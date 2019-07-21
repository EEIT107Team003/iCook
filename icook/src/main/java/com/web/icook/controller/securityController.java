package com.web.icook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class securityController {
	// 會員登入
	@GetMapping("/login_page")
	public String login(Model model) {
		return "member/login";
	}

	// 會員登出
	@GetMapping("/logout_page")
	public String logout(Model model) {
		return "member/logout";
	}

}
