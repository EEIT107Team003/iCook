package com.web.icook.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.icook.dao.OrderDao;
import com.web.icook.dao.OrderItemDao;
import com.web.icook.model.MemberBean;
import com.web.icook.model.OrderBean;
import com.web.icook.model.OrderItemBean;
import com.web.icook.service.MemberService;
import com.web.icook.service.OrderService;

@Controller
public class OrderController {
	// 目的:把OrderItemBean 塞到OrderBean裡
	@Autowired
	OrderDao odao;

	@Autowired
	MemberService mservice;

	@Autowired
	OrderItemDao oidao;

	@Autowired
	OrderService oservice;

	@Autowired
	memberController mcontroller;
	
	// 處理結帳
//	@SuppressWarnings("unchecked")
//	@RequestMapping("/check") // 購物車跳轉填資料頁
//	public String createOrder(HttpSession session, Model model, HttpServletRequest request) {
//		List<OrderItemBean> orderItemBeanSet = new ArrayList<>();// Order裡面的OrderItemBean Set
//		OrderItemBean oib = new OrderItemBean();
//		Map<String, OrderBean> order = new HashMap<>();
//		Map<Integer, OrderItemBean> cart = (Map<Integer, OrderItemBean>) session.getAttribute("shoppingCart");
//		MemberBean mb = null;
//		Double Amount = 0.0;
//		if (cart == null) {
//			// 處理訂單時如果找不到購物車(通常是Session逾時)，沒有必要往下執行
//			// 導向首頁
//			model.addAttribute("emptymsg", "您沒有購買任何東西");
//			return "redirect:/products";
//		}
//		mb = (MemberBean) session.getAttribute("LoginOK");// 已登入會員會丟會員物件至session
//		if (mb == null) {
//			model.addAttribute("LoginMsg", "請先登入");
//			return "redirect:/login";// 此處要改跳轉至登入畫面
//		}
//		// 從購物車取OrderItemBean放給OrderBean裡的Set
//		Iterator<Integer> iter1 = cart.keySet().iterator();
//		while (iter1.hasNext()) {
//			Integer key = iter1.next();
//			oib = cart.get(key);
//			// 測試應會顯示1號會員
//			Amount += oib.getSubtotal();// 累加小計
//			orderItemBeanSet.add(oib);// 把所有oib放入set
//		}
//		session.setAttribute("Amount", Amount);
//		session.setAttribute("orderItemBeanSet", orderItemBeanSet);
//		return "information";
//	}
	
	// EZ填完資料跳EZ API,把資料丟給exship API
	@SuppressWarnings({ "unchecked", "unused" })
	@RequestMapping(value = "/toEZship")
	public String toezship(Model model, HttpSession session, HttpServletRequest request) {
		//抓session member-----------------------------------------------------
		String username=mcontroller.getPrincipal();
		MemberBean mb=mservice.selectByUsername(username);
		//抓session member-----------------------------------------------------
		//mb = (MemberBean) session.getAttribute("LoginOK");// 已登入會員會丟會員物件至session
		if (mb == null) {
			model.addAttribute("LoginMsg", "請先登入");
			return "redirect:/login_page";// 此處要改跳轉至登入畫面
		}
		String lastName = (String) request.getAttribute("lastName");
		String FirstName = (String) request.getAttribute("FirstName");
		String inputEmail4 = (String) request.getAttribute("inputEmail4");
		String tel = (String) request.getAttribute("tel");
		Double Order_total = 0.0;
		Map<Integer, OrderItemBean> cart = (Map<Integer, OrderItemBean>) session.getAttribute("shoppingCart");
		List<OrderItemBean> items = new ArrayList<>();
		Set<Integer> key_set = cart.keySet();
		for (Integer k : key_set) {
			OrderItemBean oi_product = cart.get(k);// 直接用特定key去抓特定Value
			Order_total += oi_product.getSubtotal();
			items.add(oi_product);
		}
		Integer orderTotal = Order_total.intValue();// 因為ezship只接整數
		model.addAttribute("orderTotal", "orderTotal");
		model.addAttribute("description", "icook訂單");
		model.addAttribute("lastName", lastName);
		model.addAttribute("FirstName", FirstName);
		model.addAttribute("inputEmail4", inputEmail4);
		model.addAttribute("tel", tel);
		model.addAttribute("orderItems_List", items);
		return "ezship";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/check") // 購物車跳轉填資料頁
	public String createOrder(HttpSession session, Model model, HttpServletRequest request) {
		
		//抓session member-----------------------------------------------------
		String username=mcontroller.getPrincipal();
		MemberBean mb=mservice.selectByUsername(username);
		//抓session member-----------------------------------------------------
		mb = (MemberBean) session.getAttribute("LoginOK");// 已登入會員會丟會員物件至session
		if (mb == null) {
			model.addAttribute("LoginMsg", "請先登入");
			return "redirect:/login_page";// 此處要改跳轉至登入畫面
		}
		Map<Integer, OrderItemBean> cart = (Map<Integer, OrderItemBean>) session.getAttribute("shoppingCart");
	    //String s_processID = request.getParameter("processID")==null?"":request.getParameter("processID");
	    String s_stCate = request.getParameter("stCate")==null?"":request.getParameter("stCate");
	    String s_stCode = request.getParameter("stCode")==null?"":request.getParameter("stCode");
	    String s_stName = request.getParameter("stName")==null?"":request.getParameter("stName");//店名
	    String s_stAddr = request.getParameter("stAddr")==null?"":request.getParameter("stAddr");//店地址
	    String s_stTel = request.getParameter("stTel")==null?"":request.getParameter("stTel");//店電話
	    String s_webPara = request.getParameter("webPara")==null?"":request.getParameter("webPara");
	    //model.addAttribute("s_processID",s_processID);
	    model.addAttribute("s_stCate",s_stCate);
	    model.addAttribute("s_stCode",s_stCode);
	    model.addAttribute("s_stName",s_stName);
	    model.addAttribute("s_stAddr",s_stAddr);
	    model.addAttribute("s_stTel",s_stTel);
	    model.addAttribute("shoppingCart", cart);
		return "information";
	}

	@RequestMapping("/placeOrder") // 資料頁跳轉訂單
	public String toInformation(HttpSession session, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) throws AddressException, MessagingException {
		//抓session member-----------------------------------------------------
		String username=mcontroller.getPrincipal();
		MemberBean mb=mservice.selectByUsername(username);
		//抓session member-----------------------------------------------------
		//System.out.println(mb.getMember_id());
		@SuppressWarnings("unchecked")
		Map<Integer, OrderItemBean> cart = (Map<Integer, OrderItemBean>) session.getAttribute("shoppingCart");
		List<OrderItemBean> items = new ArrayList<>();
		//--------------------------此欄資訊不會寫入DB而是用在發送email--------------------------
		String custName=request.getParameter("lastName")+"先生/小姐"+request.getParameter("FirstName");
		String custEmail=request.getParameter("inputEmail4");
		String custTel=request.getParameter("tel");
		//測試:成功接到值,並發送email給顧客
		System.out.println("custName="+custName);
		System.out.println("custEmail="+custEmail);
		System.out.println("custTel="+custTel);
		//--------------------------此欄資訊不會寫入DB而是用在發送email--------------------------
		Double Amount = (Double) session.getAttribute("Amount");
		String receiver_Address = request.getParameter("shippingAddress");
		Double Order_total = 0.0;
		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date orderDate = new Date();
		Date ShippingDate = turnToShippingDate(orderDate, 2);
		String description_all = "";
		String invoiceTitle = request.getParameter("invoiceTitle");
		//String payment = request.getParameter("payment");
		// 前端可以改form:form送資料
		OrderBean ob = new OrderBean();
		ob.setMemberbean(mb);
		odao.insertOrder(ob);
		// System.out.println(cart);
		Set<Integer> key_set = cart.keySet();
		for (Integer k : key_set) {
			OrderItemBean oi_product = cart.get(k);// 直接用特定key去抓特定Value
			// 簡單整合產品描述在產品list上
			description_all =  "產品描述"
					+ oi_product.getProductBean().getDescription() + "\n" + "產品尺寸"
					+ oi_product.getProductBean().getUnit_size() + "\n" + "產品顏色"
					+ oi_product.getProductBean().getColor();
			System.out.println(description_all);
			Order_total += oi_product.getSubtotal();
			// 先創OrderBean,最後再給OrderItemBean關聯,給OrderItemBean去set
			oi_product.setOrderBean(ob);
			oi_product.setMemberBean(mb);
			oidao.updateProductStock(oi_product);// 先試算是否足夠庫存
			oidao.insertOrderItem(oi_product);
			items.add(oi_product);
		}
		//ob.setPayment(payment);
		ob.setInvoiceTitle(invoiceTitle);
		ob.setShippingAddress(receiver_Address);
		ob.setOrderDate(orderDate);
		ob.setItems(items);
		ob.setTotalAmount(Order_total);
		ob.setShippingDate(ShippingDate);
		ob.setDescription_all(description_all);
		ob.setReceiver(custName);
		ob.setReceiver_email(custEmail);
		ob.setReceiver_tel(custTel);
		odao.updateOrder(ob);
		// 到前頁顯示此會員所有訂單
		Integer member_SeqNo = mb.getMember_id();
		//測試
		// System.out.println(member_SeqNo);
		//改跳轉至感謝頁,不用抓資料
		//List<OrderBean> obs = odao.getOrdersbyMemberSeqNo(member_SeqNo);
		//model.addAttribute("orders_list", obs);
		//--------------------------------------開始發送email---------------------------------------
		Properties props = new Properties();
		props.setProperty("mail.smtp.auth", "true"); // 發送伺服器需要身份驗證
		props.setProperty("mail.transport.protocol", "smtp"); // 發送郵件協議名稱
		props.setProperty("mail.smtp.host", "smtp.qq.com"); // 設置郵件伺服器主機名:qq是用 smtp.qq.com
		props.setProperty("mail.smtp.starttls.enable", "true"); // 需要時使用SSL登陸方式，隨著各個Mail伺服器對於安全的重視，紛紛採用基於SSL的Mail登陸方式進行發送和接收電子郵件。例如GMail等。當使用JavaMail發送電子郵件時，需要根據SSL設定，增加安全驗證的功能。
		props.setProperty("mail.debug", "true"); // 開啟debug調試
		//注意!!!!!!!!!!此session要用javax.mail.Session!!!!!!!
		Session javamail_session = Session.getInstance(props,
				new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						// return new PasswordAuthentication("你的郵箱名", "你的授權碼");
						//授權碼是在自己QQ信箱開啟POP3/SMTP功能後會才可以第三方發送信件
						return new PasswordAuthentication("2319634862@qq.com", "korlgyceppicdhgb");
					}
				});
		//注意!!!!!!!!!!此session要用javax.mail.Session!!!!!!!
		Message msg = new MimeMessage(javamail_session);
		msg.setFrom(new InternetAddress("2319634862@qq.com")); // 發件人
		msg.setSubject("icook 下單成功!");
//		msg.setSubject("我是主題");
		Integer ordersuccessNo=ob.getOrderNo();
		String content="\"<span style='color:black'>訂單編號\"+"+ordersuccessNo+"\"下單成功!</span><br>\"+\r\n" + 
				"				'試試使用paypal付款!<br><form action=\"https://www.paypal.com/cgi-bin/webscr\" method=\"post\" target=\"_top\"><br>'+\r\n" + 
				"		'<input type=\"hidden\" name=\"cmd\" value=\"_s-xclick\"><br>'+\r\n" + 
				"		'<input type=\"hidden\" name=\"hosted_button_id\" value=\"5KUTFZ9H3G9Q8\"><br>'+\r\n" + 
				"		'<input type=\"image\" src=\"https://www.paypalobjects.com/en_US/TW/i/btn/btn_buynowCC_LG_wCUP.gif\" border=\"0\" name=\"submit\" alt=\"PayPal - The safer, easier way to pay online!\"><br>'+\r\n" + 
				"		'<img alt=\"\" border=\"0\" src=\"https://www.paypalobjects.com/en_US/i/scr/pixel.gif\" width=\"1\" height=\"1\"><br></form><br>'+’icook愛廚感謝您’";
		msg.setContent(content	,"text/html;charset=utf-8");
		//讀不到值!!!!!!!!!!!!!
		msg.setRecipients(RecipientType.TO, InternetAddress.parse(custEmail));
		//測試用
//		msg.setRecipients(RecipientType.TO, InternetAddress.parse("herryfish2@gmail.com"));
//		msg.setRecipients(RecipientType.TO, InternetAddress.parse("herryfish2@gmail.com,lozahury2@gmail.com"));
//多個收件人，RecipientType.TO平常發送，CC抄送，BCC是暗送（就是別的收件人看不到)
		Transport.send(msg);
		//--------------------------------------結束email---------------------------------------
		model.addAttribute("orderNo",ob.getOrderNo());
		session.removeAttribute("shoppingCart");
		//要把變數清空不然還會存留上次購物的內容在map
		cart.clear();
		return "finishOrderPage";
	}
	
	//管理員設定收到款
	//測試成功
	@RequestMapping(value="/setPaymentOK") 
	public String setOrderPaymentToOK(@RequestParam("id") Integer OrderNo,Model model) {
		if(odao.setPaymentOK(OrderNo)) {
		}
		//用forward下一個controller之後的view還是可以用EL取出
		return "forward:/adminCheckOrders";
	}
	
//==================================================================================
//	//測試getMemberOrdersbySeqNo
//	//成功,注意與hql語法用外鍵來抓OrderBean要ob.memberbean.seqNo不然狂錯persist錯誤超難抓
//	List<OrderBean> obs =odao.getMemberOrdersbySeqNo(member_SeqNo);
//	OrderBean obs_test = null;
//	Integer orderNos =0;
//	Iterator<OrderBean> it = obs.iterator();
//	while (it.hasNext()) {
//		obs_test = it.next();
//		orderNos = obs_test.getOrderNo();
//		System.out.println(orderNos);
//	}
//==================================================================================

//		// 測試getOrderItemsByMemberSeqNo
//	    //是否抓到該會員所有細項:成功抓到!!!
//		List<OrderItemBean> OrderItems = odao.getOrderItemsByMemberSeqNo(member_SeqNo);
//		OrderItemBean ob_test = null;
//		Double subtotal = 0.0;
//		Iterator<OrderItemBean> it = OrderItems.iterator();
//		while (it.hasNext()) {
//			ob_test = it.next();
//			subtotal = ob_test.getSubtotal();
//			System.out.println(subtotal);
//		}
//		model.addAttribute("by_member_all_orderitems", OrderItems);
//==================================================================================
//                             		查詢功能分水嶺
//==================================================================================

	// 查看該會員所有訂單
	@RequestMapping("/checkOrders")
	public String showOrders(Model model, HttpSession session) {
//		會員無訂單還是顯示成功
		
		//抓session member-----------------------------------------------------
		String username=mcontroller.getPrincipal();
		MemberBean mb=mservice.selectByUsername(username);
		//抓session member-----------------------------------------------------
		//MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		List<OrderBean> orders = new ArrayList<>();
		//記得撈取是否否付款
		if (mb == null) {
			model.addAttribute("LoginMsg", "請先登入");
			return "redirect:/login_page";// 此處要改跳轉至登入畫面
		}
		orders = odao.getOrdersbyMemberSeqNo(mb.getMember_id());
		model.addAttribute("orders_list", orders);
		return "OrdersPage";
	}

	// 進入後台才有的url
	// admin查看所有訂單
	@RequestMapping("/adminCheckOrders")
	public String adminAllOrders(Model model, HttpSession session) {
		String requestURI = (String) session.getAttribute("requestURI");
		//抓session member-----------------------------------------------------
		String username=mcontroller.getPrincipal();
		MemberBean mb=mservice.selectByUsername(username);
		//抓session member-----------------------------------------------------
		//MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		if (mb == null) {
			model.addAttribute("LoginMsg", "管理員請先登入");
			return "redirect:/login_page";// 此處要改跳轉至登入畫面
		}
		if (mb.getMember_id().equals("Admin")) {
			// mb.getMember_id=="Admin" XXX 要用equal
			List<OrderBean> orders = new ArrayList<>();
			orders = odao.getAllOrders();
//-----------------------------------------計算離出貨<1天------------------------------------------------------
			

//			//算出貨時間<1天的
//			Iterator<OrderBean> iter1 = orders.iterator();
//			List<Integer> needShipOutOrderNo = new ArrayList<>();
//			while (iter1.hasNext()) {
//				OrderBean ob = iter1.next();
//				Date checkDate = new Date();
//				//test
//				Long OrderDateLong=ob.getOrderDate().getTime();//why nullpointer!!!!
//				Long checkDateLong=checkDate.getTime();
//				System.out.println("OrderDate="+OrderDateLong);
//				System.out.println("checkDate="+checkDateLong);
//				Long diffDateLong=checkDateLong-OrderDateLong;
//				System.out.println("diffDateLong="+diffDateLong);
//				Long diffDateDay=diffDateLong/(1000 * 60 * 60 * 24);
//				System.out.println("diffDateDay="+diffDateDay);
//				System.out.println("四捨五入="+Math.ceil(diffDateLong/(1000 * 60 * 60 * 24)));;
//				Long diffLong=checkDate.getTime()-ob.getOrderDate().getTime();
//				Long diffDays=diffLong/(1000 * 60 * 60 * 24);
//				//測試
//				System.out.println("diffDays="+diffDays);
//				if(diffDays<1) {
//					needShipOutOrderNo.add(ob.getOrderNo());
//				}
//				//測試
//				System.out.println("urgentOrderNo="+ob.getOrderNo());
//			}
//			model.addAttribute("urgentOrders_No", needShipOutOrderNo);
			
			
//------------------------------------計算完畢-------------------------------------------------
			model.addAttribute("orders_list", orders);
			return "adminCheckOrders";
		}
		return "redirect:/login";
	}

	// 查看系統所有訂單,一定是從orderPage跳轉到此頁,此頁無法直接到達
	@RequestMapping(value = "/adminCheckOrderDetails", method = RequestMethod.POST)
	public String order_details_by_member(Model model, HttpSession session, @RequestParam("id") String buyerId,
			HttpServletRequest req) {
		// 一定是從orderPage跳轉到此頁,此頁無法直接到達,所以session.get會員
		Integer OrderNo = Integer.parseInt(req.getParameter("OrderNo"));
		OrderBean admin_ob = odao.get_One_Order_by_OrderNo(OrderNo);
		List<OrderItemBean> admin_oib = admin_ob.getItems();
		model.addAttribute("orderItems_List", admin_oib);

		return "adminCheckOrderDetails";
	}

	// 查看會員所有訂單,一定是從orderPage跳轉到此頁,此頁無法直接到達
	@RequestMapping(value = "/orderdetails", method = RequestMethod.POST)
	public String order_details_by_member(Model model, HttpSession session, @RequestParam("id") Integer buyerSyetemSeqNo,
			@RequestParam("orderNo") Integer orderNo, HttpServletRequest req) {
		Integer FrontSeqNoForOrderByMember = Integer.parseInt(req.getParameter("SeqOrderNoForMember"));
		// 一定是從orderPage跳轉到此頁,此頁無法直接到達,所以session.get會員
		OrderBean ob = null;
		List<OrderBean> mo = odao.getOrdersbyMemberSeqNo(buyerSyetemSeqNo);
		Iterator<OrderBean> it = mo.iterator();
		while (it.hasNext()) {
			ob = it.next();
			if (ob.getOrderNo() == orderNo) {
				model.addAttribute("orderItems_List", ob.getItems());
				model.addAttribute("FrontSeqOrderNo", FrontSeqNoForOrderByMember);
				//顯示系統單號
//				model.addAttribute("OrderNo", buyerSyetemSeqNo);
				return "OrderDetails";
			}
		}
		return "OrdersPage";
	}

	// 處理日期+2天問題 method
	public static Date turnToShippingDate(Date dateTime/* 待處理的日期 */, int n/* 加減天數 */) {
		// 日期格式
		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// set format目的只是轉成想要的日期形式的字串
		Date today = new Date();
		java.util.Calendar calstart = java.util.Calendar.getInstance();
		calstart.setTime(today);
		calstart.add(Calendar.DAY_OF_YEAR, n);
		Date shippingDate = calstart.getTime();
		// String shippingDateF=sdf.format(shippingDate);
		return shippingDate;
	}

}
