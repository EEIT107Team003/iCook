package com.web.icook.config;

import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.web.icook.viewResolver.ExcelViewResolver;

import forum.model.Users;

import forum.model.Users;

@Configuration

@EnableWebMvc
@ComponentScan(basePackages = {"com.web.icook", "forum","recipe"})

public class WebAppConfig extends WebMvcConfigurerAdapter {
	@Bean
	public ViewResolver internalResourViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setViewClass(JstlView.class);
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/views/css/");
		registry.addResourceHandler("/member_image/**").addResourceLocations("/WEB-INF/views/member_image/");
		registry.addResourceHandler("/ckeditor/**").addResourceLocations("/WEB-INF/views/ckeditor/");
		registry.addResourceHandler("/assets/**").addResourceLocations("/WEB-INF/views/assets/");
		//		super.addResourceHandlers(registry);

		
		
		//==========亘哲==============
		registry.addResourceHandler("/product_css/**").addResourceLocations("/WEB-INF/views/products/css/");
		registry.addResourceHandler("/product_js/**").addResourceLocations("/WEB-INF/views/products/js/");
		registry.addResourceHandler("/product_image/**").addResourceLocations("/WEB-INF/views/products/images/");
		registry.addResourceHandler("/product_pathImage/**").addResourceLocations("/WEB-INF/views/products/images/savedPicture/");
		registry.addResourceHandler("/backStage/**").addResourceLocations("/WEB-INF/views/backStage/");
		//==========亘哲==============
		
		//秉諺 開始
		registry.addResourceHandler("/article/**/**").addResourceLocations("/WEB-INF/views/article/");
		registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/views/article/fonts/");
		registry.addResourceHandler("/aimages/**").addResourceLocations("/WEB-INF/views/article/aimages/");
		registry.addResourceHandler("/ascss/**").addResourceLocations("/WEB-INF/views/article/ascss/");
		registry.addResourceHandler("/ajs/**").addResourceLocations("/WEB-INF/views/article/ajs/");
		registry.addResourceHandler("/acss/**").addResourceLocations("/WEB-INF/views/article/acss/");
		//秉諺 結束
		
		//威翰套版前端畫面
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/views/frontend/js/");
		registry.addResourceHandler("/bat/**").addResourceLocations("/WEB-INF/views/frontend/bat/");
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/views/frontend/css/");
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/views/frontend/images/");
		//DengYao
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}
	@Bean
	public MappingJackson2JsonView jsonView() {
		MappingJackson2JsonView view = new MappingJackson2JsonView();
		view.setPrettyPrint(true);
		return view;
	}
	@Bean
	public ViewResolver contentNegotiatingViewResolver(ContentNegotiationManager manager) {
		ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
		resolver.setContentNegotiationManager(manager);
		ArrayList<View> views = new ArrayList<>();
		views.add(jsonView());
		resolver.setDefaultViews(views);
		return resolver;
	}
	
	@Bean
	public ViewResolver excelViewResolver() {
		System.out.println("excelViewResolver");
		return new ExcelViewResolver();
	}
	
	@Bean
	public Users getUsers() {
		return new Users();
	} //for livechat
}
