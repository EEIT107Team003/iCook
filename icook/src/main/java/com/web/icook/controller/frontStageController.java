package com.web.icook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.icook.model.MemberBean;
import com.web.icook.service.MemberService;

@Controller
public class frontStageController {
	@Autowired
	MemberService memberService;

	@RequestMapping("/index2")
	public String toIndex2(Model model) {
		if (getPrincipal() != "anonymousUser") {
			MemberBean bean = memberService.selectByUsername(getPrincipal());
			model.addAttribute("bean", bean);
		}
		return "icookIndex";
	}

	@RequestMapping("/icookLogin")
	public String toicookLogin() {
		return "icookLogin";
	}

	@RequestMapping("/icookContact")
	public String icookContact() {
		return "icookContact";
	}

	@RequestMapping("/icookAboutUS")
	public String icookAboutUS() {
		return "icookAboutUS";
	}

	@RequestMapping("/icookMenu")
	public String icookMenu() {
		return "icookMenu";
	}

	@RequestMapping("/icookProducts")
	public String icookProducts() {
		return "icookProducts";
	}

	@RequestMapping("/icookLife")
	public String icookLife() {
		return "icookLife";
	}

	// 取得登入帳號(username)
	private String getPrincipal() {
		String userName = null;
		// 獲取當前登入對象
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
}
