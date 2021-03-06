package com.web.icook.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.icook.model.MemberBean;
import com.web.icook.model.ProductBean;
import com.web.icook.service.MemberService;
import com.web.icook.service.ProductService;

import forum.controller.ForumController;
import forum.model.ReportBean;
import forum.service.IFMService;


@Controller
public class backStagecontroller {
	@Autowired
	MemberService service; 
	@Autowired
	ServletContext context;
	@Autowired
	ProductService Productservice;

	@Autowired
	IFMService ifms;
	
	
	@ResponseBody
	@RequestMapping(value = "/allProductForProductTable", method = RequestMethod.POST)
	public List<ProductBean> allProductForProductTable() {
		System.out.println("======allProductForProductTable IN==============");
		List<ProductBean> list = Productservice.getAllProducts();
//		for(ProductBean bb :list) {
//			System.out.println("id :"+bb.getProduct_id()
//			+"  description :"+bb.getDescription() +"Name"+bb.getRemark());
//		}
		System.out.println("======allProductForProductTable OUT==============");
		return list;
	}
	
	@RequestMapping(value = { "productTable"})
	public String productTable(Model model) {
		return "backStage/examples/productTable";
	}
	
//---------------------------------------------------------------------------------------------------
	@RequestMapping(value = { "backStageDashboard"})
	public String dashboard(Model model) {
		return "backStage/examples/dashboard";
	}

	@RequestMapping(value = { "backStageTable"})
	public String table(Model model) {
		
		return "backStage/examples/table";
	}

//會員管理---------------------------------------------------------------
	@RequestMapping(value = { "backStageUser"})
	public String user(Model model) {
		List<MemberBean> list= service.selectAllMember("ROLE_MEMBER");
		model.addAttribute("members",list);
		return "backStage/examples/userBackStage";
	}
//---------------------------------------------------------------

	@RequestMapping(value = { "report_forum"})
	public String reportManager(Model model) {
		List<ReportBean> rtbList = ifms.getAllReport();
		model.addAttribute("reports", rtbList);
		return "backStage/examples/report_forum";
	}
}
