package com.web.icook.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.icook.service.MemberService;


@Controller
public class backStagecontroller {
	@Autowired
	MemberService service; 
	@Autowired
	ServletContext context;
	
	@RequestMapping(value = { "backStageDashboard"})
	public String dashboard(Model model) {
		return "backStage/examples/dashboard";
	}
	@RequestMapping(value = { "backStageIcons"})
	public String icons(Model model) {
		return "backStage/examples/icons";
	}
	@RequestMapping(value = { "backStageMaps"})
	public String maps(Model model) {
		return "backStage/examples/maps";
	}
	@RequestMapping(value = { "backStageNotifications"})
	public String notifications(Model model) {
		return "backStage/examples/notifications";
	}
	@RequestMapping(value = { "backStageTypography"})
	public String typography(Model model) {
		return "backStage/examples/typography";
	}
	@RequestMapping(value = { "backStageTable"})
	public String table(Model model) {
		return "backStage/examples/table";
	}
	@RequestMapping(value = { "backStageUpgrade"})
	public String upgrade(Model model) {
		return "backStage/examples/upgrade";
	}
	@RequestMapping(value = { "backStageUser"})
	public String user(Model model) {
		return "backStage/examples/user";
	}

//---------------------------------------------------------------------------------------------------
	
	
}
