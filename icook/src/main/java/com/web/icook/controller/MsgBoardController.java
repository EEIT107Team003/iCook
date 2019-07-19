package com.web.icook.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.icook.model.ArticleBean;
import com.web.icook.model.MemberBean;
import com.web.icook.model.MsgBoardBean;
import com.web.icook.service.IcookMsgService;
import com.web.icook.service.IcookService;
import com.web.icook.service.MemberService;

@Controller
public class MsgBoardController {

	@Autowired
	IcookMsgService msgservice;
	@Autowired
	ServletContext context;
	@Autowired
	IcookService arcicleservice;
	@Autowired
	MemberService memberservice;
	@Autowired
	MemberController c;
	

	@RequestMapping("/AjaxAllMsg")
	@ResponseBody
	public List<MsgBoardBean> Msglist(@RequestParam("article_num") Integer article_num, Model model) {
		List<MsgBoardBean> list = msgservice.getAllMsgBoards(article_num);
		model.addAttribute("MsgBoards", list);
		return list;
		
	}

	@RequestMapping(value = "/AjaxMsginsert", method = RequestMethod.POST)
	@ResponseBody
	public List<String> getSelectArticleForm(@RequestParam("catchnum") Integer catchnum,
			@RequestParam("msgboard_content") String msgboard_content, Model model, HttpServletRequest request)
			throws UnsupportedEncodingException {
//		System.out.println("我進來了");
		MsgBoardBean msgBoardbean = new MsgBoardBean();
		request.setCharacterEncoding("UTF-8");
		msgBoardbean.setMsgboard_content(msgboard_content);
		
		System.out.println("catchnumcatchnumcatchnum==" + catchnum);
		MemberBean mb = memberservice.selectByUsername(c.getPrincipal());
		
		ArticleBean Ab = arcicleservice.getIcookArticle(catchnum);
		msgBoardbean.setMemberid_in_msgs(mb);
		msgBoardbean.setArtuclenum_in_msg(Ab);
		msgservice.insertIcookMsgBoard(msgBoardbean);
		System.out.println("msgBoardbean" + msgBoardbean);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<String> list=new ArrayList() ;
		list.add(0,msgBoardbean.getMsgboard_content());		//留言內容
		list.add(1,Integer.toString(mb.getMember_id()));			//會員編號
		list.add(2,sdf.format(msgBoardbean.getMsgboard_date()));		//日期
		list.add(3, mb.getNickname());//暱稱
		
		return list;/* 呼叫insert.jsp檔案 */
	}

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

	@RequestMapping(value = "/user/Msginsert", method = RequestMethod.POST)
	public String processAddNewProductForm(@ModelAttribute("modelMsginsert") MsgBoardBean msgBoardbean, Model model,
			BindingResult result, HttpServletRequest request, Integer catchnum)
			// @RequestParam("id") Integer aid
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
//		System.out.println("文章編號為="+aid);
//		System.out.println("catchnumcatchnumcatchnum==="+catchnum);
		if (catchnum == null) {
			return "redirect:/A_articlemainpage";
		} else {
			MemberController c = new MemberController();
			System.out.println("catchnumcatchnumcatchnum==" + catchnum);
			MemberBean mb = memberservice.selectByUsername(c.getPrincipal());
			ArticleBean Ab = arcicleservice.getIcookArticle(catchnum);
			msgBoardbean.setMemberid_in_msgs(mb);
			msgBoardbean.setArtuclenum_in_msg(Ab);
			msgservice.insertIcookMsgBoard(msgBoardbean);

			return "redirect:article/article?article_num=" + catchnum;
		}

		// 會員進來之後砍掉
//		mb.setMember_id(catchMemnum);					//接前端catchMemnum值
		// 假會員區

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

	}

	// 取得圖片(Member)-------------------------------------------------------------------
	@RequestMapping(value = "/MemberPhoto", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getMemberPhoto(@RequestParam("member_id") Integer member_id) {
		System.out.println("我建得getMemberPhoto  member_id=" + member_id);
		String filePath = "/resources/images/NoImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		MemberBean bean = memberservice.selectById(member_id);
		if (bean != null) {
			Blob blob = bean.getMember_photo();
			filename = bean.getFileName_member();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPictur()發生SQLException:" + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType=" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);

		return responseEntity;
	}

	private byte[] toByteArray(String filepath) {
		System.out.println("private byte[] toByteArray(String filepath) {");
		byte[] b = null;
		InputStream fis = null;
		try {

			String realPath = context.getRealPath(filepath);// 取得絕對路徑
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
//				System.out.println("size = " + size);
			fis = context.getResourceAsStream(filepath);

			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

	

}
