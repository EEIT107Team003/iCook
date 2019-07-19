package com.web.icook.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.icook.model.MemberBean;
import com.web.icook.service.MemberService;


@Controller
public class Homecontroller {
	@Autowired
	MemberService service; 
	@Autowired
	ServletContext context;
	@RequestMapping(value = { "backStage"})
	public String backStage(Model model) {
		return "backStage/examples/dashboard";
	}

//---------------------------------------------------------------------------------------------------
	// 首頁
	@RequestMapping(value = { "/", "home" })
	public String home(Model model) {
		if (getPrincipal() != "anonymousUser") {
			String nickname = service.selectByUsername(getPrincipal()).getNickname();
			int member_id = service.selectByUsername(getPrincipal()).getMember_id();
			model.addAttribute("user", nickname);
			model.addAttribute("member_id", member_id);
			System.out.println(member_id);
		} else {
			model.addAttribute(getPrincipal());
		}
		return "index";
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
	
	// --------------------------------------------------------------------------
	// AJAX測試
	@ResponseBody
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public  List<MemberBean> categorySelect () {
		System.out.println("======CategorySelect IN==============");
		List<MemberBean> bean=service.selectAll();
//	    	String nvrsjson = JSONArray.toJSONString(bean);
		for(MemberBean bb : bean) {
			System.out.println("name : "+bb.getNickname()+" 55555555555555555555555555");
		}
		System.out.println("======CategorySelect OUT=============");
		return bean;
	}
	//--------------------------------------------------------------------------
	
	
	
	
}
