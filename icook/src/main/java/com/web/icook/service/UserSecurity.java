package com.web.icook.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;



public class UserSecurity {
//
//	private static final long serialVersionUID = 1L;
//
//	public UserSecurity(MemberBean bean) {
//		if(bean!=null) {
//			this.setMember_id(bean.getMember_id());
//			this.setUsername(bean.getUsername());
//			this.setPassword(bean.getPassword());
//			this.setNickname(bean.getNickname());
//			this.setMember_photo(bean.getMember_photo());
//			this.setCover_photo(bean.getCover_photo());
//			this.setTracked_num(bean.getTracked_num());
//			this.setRecipe_num(bean.getRecipe_num());
//			this.setForum_num(bean.getForum_num());
//			this.setRegister_date(bean.getRegister_date());
//			this.setEnabled(bean.getEnabled());
//			this.setFileName_member(bean.getFileName_member());
//			this.setFileName_cover(bean.getFileName_cover());
//			this.setRole(bean.getRole());
//			this.setMember_photo_tr(bean.getMember_photo_tr());
//			this.setTracker(bean.getTracker());
//			this.setTracked(bean.getTracked());
//			this.setRecipe(bean.getRecipe());
//			this.setRecipe_Collecter(bean.getRecipe_Collecter());
////			System.out.println("fdfdfdfdfdfdfdfdfdfdfdfd");
//		}
//	}
//	
//	@Override
//	public Collection<? extends GrantedAuthority> getAuthorities() {
//	    Collection<GrantedAuthority> authorities = new ArrayList<>();
//        String username = this.getUsername();
//        if (username != null) {
//            SimpleGrantedAuthority authority = new SimpleGrantedAuthority(username);
//            authorities.add(authority);
//        }
//        return authorities;
//	}
//
//	@Override
//	public boolean isAccountNonExpired() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//
//	@Override
//	public boolean isAccountNonLocked() {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean isCredentialsNonExpired() {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean isEnabled() {
//		// TODO Auto-generated method stub
//		return false;
//	}

}
