package com.web.icook.config;

import javax.sql.DataSource;

import org.hibernate.annotations.common.util.impl.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.authentication.RememberMeServices;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.sun.istack.logging.Logger;

@Configuration
@EnableWebSecurity
@ComponentScan("com.web.icook")
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;

	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
	  auth.jdbcAuthentication().dataSource(dataSource)
		.usersByUsernameQuery(//帳號密碼
			"select username, password, enabled from members where username=?")
		.authoritiesByUsernameQuery(//權限
			"select username,role from members where username=?");
	}		
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
   	    http.authorizeRequests()
   	    .antMatchers("/","/login_page","/addMember","/member").permitAll() //不用登入即可使用
   	    .antMatchers("/user/**","/members/page/track")
   	    .hasAnyRole("ADMIN", "MEMBER") //只要登入成功,便可使用(權限:"ADMIN"或"MEMBER")
   	    .and()
   	    .csrf().disable() //關閉CSRF檢查
   	    .rememberMe()
   	    .and()
   	    .formLogin() 
	        .loginPage("/login_page")
	        .loginProcessingUrl("/perform_login")
	        .failureUrl("/login_page?error")
	        .usernameParameter("username").passwordParameter("password")
        .and()
	        .logout()
	        .logoutUrl("/perform_logout")
	        .logoutSuccessUrl("/"); 
	}
}
