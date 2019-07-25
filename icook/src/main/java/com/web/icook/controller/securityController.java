package com.web.icook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.icook.service.MemberService;

@Controller
public class securityController {
	@Autowired
	MemberService memberService;
	
	// 會員登入
	@GetMapping("/icookLogin")
	public String login(Model model) {
		
		return "icookLogin";
	}

	// 會員登出
	@GetMapping("/logout_page")
	public String logout(Model model) {
		return "member/logout";
	}
	
//	// 管理員登入
//	@GetMapping("/icookAdminLogin")
//	public String adminlogin(Model model) {
//		return "icookAdminLogin";
//	}
	
	// 取得登入帳號(username)
	public String getPrincipal() {
		String userName = null;
		// 獲得當前登入對象
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
}
