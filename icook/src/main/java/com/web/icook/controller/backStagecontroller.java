package com.web.icook.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.icook.model.ProductBean;
import com.web.icook.service.MemberService;
import com.web.icook.service.ProductService;


@Controller
public class backStagecontroller {
	@Autowired
	MemberService service; 
	@Autowired
	ServletContext context;
	@Autowired
	ProductService Productservice;
	
	
	
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
	
	@RequestMapping(value = { "addSingleProduct"})
	public String addSingleProduct(Model model) {
		return "backStage/examples/addSingleProduct";
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


	
	
}
