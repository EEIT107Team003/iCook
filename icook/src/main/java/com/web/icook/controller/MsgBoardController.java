package com.web.icook.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.icook.model.ArticleBean;
import com.web.icook.model.MemberBean;
import com.web.icook.model.MsgBoardBean;
import com.web.icook.service.IcookMsgService;
import com.web.icook.service.IcookService;

@Controller
public class MsgBoardController {

	@Autowired
	IcookMsgService msgservice;
	@Autowired
	ServletContext context;
	@Autowired
	IcookService arcicleservice;

//	@RequestMapping("/findAll") // 指向index href裡面
//	public String Msglist(Model model) {
//		List<MsgBoardBean> list = msgservice.getAllMsgBoards();
//		model.addAttribute("Articles", list);
//		return "findAll"; // 指向success.jsp
//	}

//	@RequestMapping(value = "/delete", method = RequestMethod.GET)
//	public String getDeleteArticle(Model model) {
//		System.out.println("#1");
//		MsgBoardBean msgBoardBean = new MsgBoardBean();
//		model.addAttribute("MsgBoardBean", msgBoardBean);
//		return "deletepage";/* 呼叫insert.jsp檔案 */
//	}
//
//	@RequestMapping(value = "/delete", method = RequestMethod.POST)
//	public String processDeleteArticleForm(@ModelAttribute("MsgBoardBean") MsgBoardBean msgBoardbean, int msgboard_num, HttpServletRequest request,
//			Model model) throws UnsupportedEncodingException {
//		request.setCharacterEncoding("UTF-8");
//		System.out.println("#2");
//		
//		msgservice.deleteIcookMsgBoard(msgBoardbean);
//
//		return "redirect:/";/* 讓瀏覽器再次發出請求，呼叫successPage.jsp檔案 */
//	}// end of processAddNewProductForm mathod
//
//	@RequestMapping(value = "/select", method = RequestMethod.GET)
//	public String getSelectArticleForm(Model model) {
//		System.out.println("#1");
//		MsgBoardBean msgBoardbean = new MsgBoardBean();
//		model.addAttribute("MsgBoardBean", msgBoardbean);
//		return "selectpage";/* 呼叫insert.jsp檔案 */
//	}
//
//	@RequestMapping(value = "/select", method = RequestMethod.POST)
//	public String processSelectArticleForm(@ModelAttribute("MsgBoardBean") MsgBoardBean msgBoardbean, int msgboard_num, HttpServletRequest request,
//			Model model) throws UnsupportedEncodingException {
//		request.setCharacterEncoding("UTF-8");
//		System.out.println("#2");
//
//		List<MsgBoardBean> list = new ArrayList<>();
//		list.add(msgservice.getIcookMsgBoard(msgBoardbean.getMsgboard_num()));
//		model.addAttribute("MsgBoards", list);
//
//		
//		return "findAll";/* 讓瀏覽器再次發出請求，呼叫successPage.jsp檔案 */
//	}// end of processAddNewProductForm mathod
//
//	
//	
//	@RequestMapping(value = "/update", method = RequestMethod.GET)
//	public String getSelectupArticleForm(Model model) {
//		System.out.println("#1");
//		MsgBoardBean msgBoardbean = new MsgBoardBean();
//		model.addAttribute("MsgBoardBeanUpdate",msgBoardbean);
//		return "selectupdatepage";/* 呼叫insert.jsp檔案 */
//	}
//
//	@RequestMapping(value = "/update", method = RequestMethod.POST)
//	public String processSelectupArticleForm(@ModelAttribute("MsgBoardBeanUpdate") MsgBoardBean msgBoardbean, int msgboard_num, HttpServletRequest request,
//			Model model) throws UnsupportedEncodingException {
//		request.setCharacterEncoding("UTF-8");
//		System.out.println("#2");
//
//		List<MsgBoardBean> list = new ArrayList<>();
//		list.add(msgservice.getIcookMsgBoard(msgBoardbean.getMsgboard_num()));
//		model.addAttribute("MsgBoards", list);
//		model.addAttribute("test",list.get(0).getMsgboard_content());
//		msgBoardbean.setMsgboard_content(list.get(0).getMsgboard_content());
//		
//		return "updatepage";/* 讓瀏覽器再次發出請求，呼叫successPage.jsp檔案 */
//	}// end of processAddNewProductForm mathod
//
//	
//	
//	
//	
//	
//	
//	@RequestMapping(value = "/updateAfterSelete", method = RequestMethod.GET )
//	public String getUpdateArticleForm(Model model ) {
//		System.out.println("#3");
//		MsgBoardBean msgBoardbean = new MsgBoardBean();
//		model.addAttribute("MsgBoardBeanUpdate", msgBoardbean);
//		return "updatepage";
//		/* 呼叫insert.jsp檔案 */
//	}
//	
//
//
//	@RequestMapping(value = "/updateAfterSelete", method = RequestMethod.POST)
//	public String processUpdateArticleForm(@ModelAttribute("ArticlebeanUpdate") MsgBoardBean msgBoardbean, BindingResult result,
//			HttpServletRequest request) throws UnsupportedEncodingException {
//		request.setCharacterEncoding("UTF-8");
//		System.out.println("#4");
//		
//
//		// 重要事項-start
//		// 這三個地方一定要一樣，都只打RecipeBean
//		// <form:form method="POST" modelAttribute="【RecipeBean】"
//		// model.addAttribute("【RecipeBean】", recipeBean);
//		// public String processAddNewProductForm(@ModelAttribute("【RecipeBean】")
//		// RecipeBean recipeBean
//		// 重要事項-end
//
//		/* 開始處理圖片檔案-start */
//		// 如果沒上傳圖片，則保持原本圖片
////		if (msgBoardbean.getArticleImage() != null) {
////			MultipartFile imageFile = msgBoardbean.getArticleImage();
////			// 建立Blob物件，交由 Hibernate 寫入資料庫
////
////			if (imageFile != null && !imageFile.isEmpty()) {
////				String originalFilename = imageFile.getOriginalFilename();
////				msgBoardbean.setFileName(originalFilename);
////
////				try {
////					byte[] byteArray = imageFile.getBytes();
////					Blob coverImage = new SerialBlob(byteArray);
////					msgBoardbean.setCoverImage(coverImage);
////					;
////				} catch (Exception e) {
////					e.printStackTrace();
////					throw new RuntimeException("圖片上傳發生異常：" + e.getMessage());
////				}
////			}
////			/* 開始處理圖片檔案-end */
////		}
//
//		msgservice.updateIcookMsgBoard(msgBoardbean);
//
//		// 將上傳的檔案移到指定的資料夾
//		return "redirect:/";/* 讓瀏覽器再次發出請求，呼叫successPage.jsp檔案 */
//	}// end of processAddNewProductForm mathod
//
//	/* 跟 <a href="insert">新增</a> 有關 */
//	
//

//	@RequestMapping(value = "/Msginsert", method = RequestMethod.GET)
//	public String getSelectArticleForm(Model model) {
//		System.out.println("#1");
//		MsgBoardBean msgBoardbean = new MsgBoardBean();
//		model.addAttribute("modelMsginsert", msgBoardbean);
//		return "findone";/* 呼叫insert.jsp檔案 */
//	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/Msginsert", method = RequestMethod.POST)
	public String processAddNewProductForm(@ModelAttribute("modelMsginsert") MsgBoardBean msgBoardbean, Model model,
			BindingResult result, HttpServletRequest request,int catchnum,MemberBean mb)
	//@RequestParam("id") Integer aid
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
//		System.out.println("文章編號為="+aid);
//		System.out.println("catchnumcatchnumcatchnum==="+catchnum);
		ArticleBean Ab= arcicleservice.getIcookArticle(catchnum);
								                         //會員進來之後砍掉
//		mb.setMember_id(catchMemnum);					//接前端catchMemnum值
//		msgBoardbean.setMemberid_in_msgs(mb);
		msgBoardbean.setArtuclenum_in_msg(Ab); 
//		System.out.println("mb=========="+mb.toString());
//		model.addAttribute("modelMsginsert", msgBoardbean);
		// 重要事項-start
		// 這三個地方一定要一樣，都只打RecipeBean
		// <form:form method="POST" modelAttribute="【RecipeBean】"
		// model.addAttribute("【RecipeBean】", recipeBean);
		// public String processAddNewProductForm(@ModelAttribute("【RecipeBean】")
		// RecipeBean recipeBean
		// 重要事項-end
//		System.out.println("msgBoardbean====="+msgBoardbean.toString());
		msgservice.insertIcookMsgBoard(msgBoardbean);
		return "A_article";
	}

}
