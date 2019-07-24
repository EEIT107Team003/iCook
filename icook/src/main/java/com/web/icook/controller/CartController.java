package com.web.icook.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.icook.model.MemberBean;
import com.web.icook.model.OrderItemBean;
import com.web.icook.model.ProductBean;
import com.web.icook.service.MemberService;
import com.web.icook.service.OrderService;
import com.web.icook.service.ProductService;

@Controller
public class CartController {

	@Autowired
	ServletContext context;
	@Autowired
	OrderService service;
	// 測試

	@Autowired
	ProductService pservice;

	@Autowired
	MemberService mservice;

	@Autowired
	MemberController mcontroller;
	
//	@RequestMapping("/backStage")
//	public String backStage(Model model) {
//		return "index";
//	}
	
	
	@RequestMapping("/icookAddRecipe")
	public String receipe() {

		return "icookAddRecipe";
	}


	
	
	
	
	// 測試
	@RequestMapping("/finishOrderPage")
	public String tofinishOrderPage(Model model) {
		// 測試
//		boolean status=odao.setPaymentOK(13);
//		model.addAttribute("status", status);
		return "finishOrderPage";
	}

	@RequestMapping("/icookFinishOrderPage")
	public String icookFinishOrderPage(Model model,HttpSession session) {
		// 測試
		
		
		//測試綠界只收int
//		int AmountInt=100;
//		Integer AmountInteger = new Integer(AmountInt);
//		String AmountString = "33號";
//		session.setAttribute("orderAmount",AmountInteger );
//		session.setAttribute("orderNo",AmountString );
//		boolean status=odao.setPaymentOK(13);
//		model.addAttribute("status", status);
		return "icookFinishOrderPage";
	}

//	@RequestMapping("/thankyou")
//	public String thankyou() {
//		return "thankyouPage2";
//	}

	@RequestMapping("/realPaypal")
	public String realPaypal() {

		return "realPaypal";
	}

	// 測試
	@RequestMapping("/testEL1")
	public String toTest1() {

		return "testEL1";
	}

	// 測試
	@RequestMapping("/testEL2")
	public String totestEL2() {

		return "testEL2";
	}

	// 測試
	@RequestMapping("/toIndex")
	public String toIndex() {

		return "index";
	}

//	@RequestMapping("/paypal")
//	public String toPaypal() {
//		return "information";
//	}

	// 測試顯示此頁,不會有單一指令到此頁
	@RequestMapping("/information")
	public String inforamation() {

		return "information";
	}

//	@RequestMapping("/aioCheckOutOneTime")
//	public String aioCheckOutOneTime() {
//		
//		return "aioCheckOutOneTime";
//	}
	@RequestMapping("/toAIOcheck")
	public String aioCheckOut() {

		return "aioCheckOut";
	}

	// 選擇了EZ要先填資料
	@RequestMapping("/ezship2")
	public String chosedEZ(Model model, HttpSession session) {
		return "ezship2";
	}
	// 選擇了EZ要先填資料
	@RequestMapping("/icookezship")
	public String icookezship(Model model, HttpSession session) {
		return "icookezship";
	}

	// 測試
	// 確認結帳跳轉至填寫information
	@RequestMapping("/confirmOrder")
	public String confirmOrder(Model model, HttpSession session) {
		return "inforamation";
	}

	// 非測試,市集>購物車
	@RequestMapping("/cartPage")
	public String gotoCart(Model model, HttpSession session) {
		MemberBean mb;
		if (!mcontroller.getPrincipal().equals("anonymousUser")) {
			mb = mservice.selectByUsername(mcontroller.getPrincipal());
			model.addAttribute("LoginOK", mb);
		} else {
		}
		return "icookCartPage";
	}

	// 非測試,市集>購物車
	@RequestMapping("/icookCartPage")
	public String icookCartPage(Model model, HttpSession session) {
		MemberBean mb;
		if (!mcontroller.getPrincipal().equals("anonymousUser")) {
			mb = mservice.selectByUsername(mcontroller.getPrincipal());
			model.addAttribute("LoginOK", mb);
		} else {
		}
		return "icookCartPage";
	}

	@RequestMapping("/showOrder")
	public String Cash(Model model, HttpSession session) {
		return "showOrder";
	}

	Map<Integer, OrderItemBean> cart = new HashMap<>();

	@RequestMapping(value = "/product/addToCart")
	private String addToCart(@RequestParam(value = "productId", required = false) Integer productId,
//			@RequestParam(value = "quantity") Integer quantity, Model model, HttpSession session) {
			Model model, HttpSession session, HttpServletRequest req) {
		String quantityString = req.getParameter("quan");
		if (quantityString == "") {
			cart.remove(productId);
			return "redirect:/product?id=" + productId;
		}
		Integer quantity = Integer.parseInt(quantityString);
		// -----------------------------測試是否抓到登入會員------------------------------
		// 成功
//		String username=mcontroller.getPrincipal();
//		MemberBean mb=mservice.selectByUsername(username);
//		System.out.println(mb.getUsername());
		// -------------------------------------------------------------------------------
		Set<OrderItemBean> oibSet = new HashSet<>();
		OrderItemBean oib;
		ProductBean pb;
		// 前端已經攔截<0
		if (quantity == 0) {
			cart.remove(productId);
			return "redirect:/product?id=" + productId;
		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if (quantity > 0) {
			pb = new ProductBean();
			pb = pservice.getProductById(productId);
			oib = new OrderItemBean();
			oib.setDiscount(1.0);
			oib.setQuantity(quantity);
			oib.setSubtotal(quantity * pb.getPrice());
			oib.setProductBean(pb);
			cart.put(productId, oib);
			session.setAttribute("shoppingCart", cart);
			return "redirect:/product?id=" + productId;
		} else {
			return "redirect:/product?id=" + productId;
		}
	}

	@SuppressWarnings({ "unused" })
	@RequestMapping("/deleteCart")
	public String deleteProduct(HttpSession session, @RequestParam(value = "id") Integer productId) {
		if (productId == null) {
			session.removeAttribute("shoppingCart");
			cart.clear();
			return "redirect:/icookCartPage";
		} else if (productId != null) {
			cart.remove(productId);
			return "redirect:/icookCartPage";
		} else {
			return "redirect:/icookCartPage";
		}
	}

	@RequestMapping("/infomationDeleteAllToMarket")
	public String infomationDeleteAllToMarket(HttpSession session) {
		session.removeAttribute("shoppingCart");
		cart.clear();
		return "redirect:/products";
	}

}
