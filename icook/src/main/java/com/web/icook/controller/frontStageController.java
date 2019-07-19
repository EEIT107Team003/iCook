package com.web.icook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class frontStageController {
	@RequestMapping("/index2")
	public String toIndex2() {
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
}
