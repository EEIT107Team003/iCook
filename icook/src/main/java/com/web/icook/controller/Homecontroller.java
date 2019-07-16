package com.web.icook.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sun.xml.bind.CycleRecoverable.Context;
import com.web.icook.model.MemberBean;
import com.web.icook.service.MemberService;


@Controller
public class Homecontroller {
	@Autowired
	MemberService service; 
	@Autowired
	ServletContext context;

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
