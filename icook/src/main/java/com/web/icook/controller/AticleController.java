package com.web.icook.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialClob;
import javax.sql.rowset.serial.SerialException;

import org.h2.engine.User;
import org.hibernate.Session;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.web.icook.model.ArticleBean;
import com.web.icook.model.MsgBoardBean;
import com.web.icook.service.IcookMsgService;
import com.web.icook.service.IcookService;

@Controller
public class AticleController {
	@Autowired
	IcookService arcicleservice;
	@Autowired
	ServletContext context;
	@Autowired
	IcookMsgService msgservice;
	


	@RequestMapping("/A_article")
	public String A_article() {
		
		return "A_article";
	}

//	@RequestMapping("/delete")
//	public String delete() {
//		// 刪除
//		return "deletepage";
//	}
//
//	@RequestMapping("/update")
//	public String update() {
//		// 修改
//		return "updatepage";
//	}
//
//	@RequestMapping("/select")
//	public String select() {
//		// 查詢
//		return "selectpage";
//	}
	
	@RequestMapping("/A_findAll") // 指向index href裡面
	public String list(Model model) {
		List<ArticleBean> list = arcicleservice.getAllArticles();
		model.addAttribute("Articles", list);
		System.out.println("list.toString()"+list.toString());
		return "A_findAll"; // 指向success.jsp
	}

	@RequestMapping(value = "/A_delete", method = RequestMethod.GET)
	public String getDeleteArticle(Model model) {
		System.out.println("#1");
		ArticleBean articlebean = new ArticleBean();
		model.addAttribute("Articlebean", articlebean);
		return "A_deletepage";/* 呼叫insert.jsp檔案 */
	}

	@RequestMapping(value = "/A_delete", method = RequestMethod.POST)
	public String processDeleteArticleForm(@ModelAttribute("Articlebean") ArticleBean articlebean, int article_num, HttpServletRequest request,
			Model model) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("#2");
		
		arcicleservice.deleteIcookArticle(articlebean);

		return "A_article";/* 讓瀏覽器再次發出請求，呼叫successPage.jsp檔案 */
	}// end of processAddNewProductForm mathod

	@RequestMapping(value = "/A_select", method = RequestMethod.GET)
	public String getSelectArticleForm(Model model) {
		System.out.println("#1");
		ArticleBean articlebean = new ArticleBean();
		model.addAttribute("Articlebeanselect", articlebean);
		return "A_selectpage";/* 呼叫insert.jsp檔案 */
	}

	@RequestMapping(value = "/A_select", method = RequestMethod.POST)
	public String processSelectArticleForm(@ModelAttribute("Articlebeanselect") ArticleBean articlebean, int article_num, HttpServletRequest request,
			Model model,MsgBoardBean msgBoardbean) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("#2");

//		List<ArticleBean> list = new ArrayList<>();
//		list.add(arcicleservice.getIcookArticle(articlebean.getArticle_num()));
//		model.addAttribute("Articles", list);
		
		ArticleBean ab=arcicleservice.getIcookArticle(articlebean.getArticle_num());
		model.addAttribute("Article",ab);
        model.addAttribute("modelMsginsert",msgBoardbean);
        model.addAttribute("number",article_num);
//		System.out.println("select方法getArticle_num()="+article_num);
		
		return "A_findone";
//		return "redirect:/select/Msginsert.action?bean="+ab;
//		return "redirect:/findone?id="+article_num;
//		return "findone?id="+article_num;
	}// end of processAddNewProductForm mathod
	
	//return "redirect:/emp/update.action?id=" + id
//	@RequestMapping("/findone/{article_num}")
//	public String getArticleByNum(@PathVariable("article_num") int article_num ,ArticleBean articlebean,Model model) {
//		ArticleBean ab=arcicleservice.getIcookArticle(articlebean.getArticle_num());
//		model.addAttribute("Article",ab);
//		return null;
//	}
	
	@RequestMapping(value = "/A_update", method = RequestMethod.GET)
	public String getSelectupArticleForm(Model model) {
		System.out.println("#1");
		ArticleBean articlebean = new ArticleBean();
		model.addAttribute("ArticlebeanUpdate", articlebean);
		return "A_selectupdatepage";/* 呼叫insert.jsp檔案 */
	}

	@RequestMapping(value = "/A_update", method = RequestMethod.POST)
	public String processSelectupArticleForm(@ModelAttribute("ArticlebeanUpdate") ArticleBean articlebean, int article_num, HttpServletRequest request,
			Model model) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("#2");

		List<ArticleBean> list = new ArrayList<>();
		list.add(arcicleservice.getIcookArticle(articlebean.getArticle_num()));
		System.out.println("getArticle_content()"+articlebean.getArticle_content());
		model.addAttribute("Articles", list);
		model.addAttribute("test",list.get(0).getArticle_content());
		articlebean.setArticle_content(list.get(0).getArticle_content());
//		System.out.println("list.get(0)==========="+list.get(0).getArticle_content());
//		System.out.println("111111111111nummmmmmmmmm===="+list.toString());
		
		return "A_updatepage";/* 讓瀏覽器再次發出請求，呼叫successPage.jsp檔案 */
	}// end of processAddNewProductForm mathod

	
	
	
	
	
	
	@RequestMapping(value = "/A_updateAfterSelete", method = RequestMethod.GET )
	public String getUpdateArticleForm(Model model ) {
		System.out.println("#3");
		ArticleBean articlebean = new ArticleBean();
		model.addAttribute("ArticlebeanUpdate", articlebean);
		return "A_updatepage";
		/* 呼叫insert.jsp檔案 */
	}
	


	@RequestMapping(value = "/A_updateAfterSelete", method = RequestMethod.POST)
	public String processUpdateArticleForm(@ModelAttribute("ArticlebeanUpdate") ArticleBean articlebean, BindingResult result,
			HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("#4");
		

		// 重要事項-start
		// 這三個地方一定要一樣，都只打RecipeBean
		// <form:form method="POST" modelAttribute="【RecipeBean】"
		// model.addAttribute("【RecipeBean】", recipeBean);
		// public String processAddNewProductForm(@ModelAttribute("【RecipeBean】")
		// RecipeBean recipeBean
		// 重要事項-end

		/* 開始處理圖片檔案-start */
		// 如果沒上傳圖片，則保持原本圖片
		if (articlebean.getArticleImage() != null) {
			MultipartFile imageFile = articlebean.getArticleImage();
			// 建立Blob物件，交由 Hibernate 寫入資料庫

			if (imageFile != null && !imageFile.isEmpty()) {
				String originalFilename = imageFile.getOriginalFilename();
				articlebean.setFileName(originalFilename);

				try {
					byte[] byteArray = imageFile.getBytes();
					Blob coverImage = new SerialBlob(byteArray);
					articlebean.setCoverImage(coverImage);
					;
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("圖片上傳發生異常：" + e.getMessage());
				}
			}
			/* 開始處理圖片檔案-end */
		}

		arcicleservice.updateIcookArticle(articlebean);

		// 將上傳的檔案移到指定的資料夾
		return "A_article";/* 讓瀏覽器再次發出請求，呼叫successPage.jsp檔案 */
		
	}// end of processAddNewProductForm mathod

	/* 跟 <a href="insert">新增</a> 有關 */
	@RequestMapping(value = "/A_insert", method = RequestMethod.GET)
	public String getAddNewArticleForm(Model model) throws SerialException, SQLException {
		

		
		System.out.println("#1");
		ArticleBean articlebean = new ArticleBean();
		model.addAttribute("Articlebean", articlebean);
		
		return "A_insertpage";/* 呼叫insert.jsp檔案 */
	}

	@RequestMapping(value = "/A_insert", method = RequestMethod.POST)
	public String processAddNewProductForm(@ModelAttribute("Articlebean") ArticleBean articlebean, BindingResult result,
			HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("bean"+articlebean.toString());
		
		
		
		
//		System.out.println("#2");
//		System.out.println("MidBean_num() -> " + bean.getNum());

		// 重要事項-start
		// 這三個地方一定要一樣，都只打RecipeBean
		// <form:form method="POST" modelAttribute="【RecipeBean】"
		// model.addAttribute("【RecipeBean】", recipeBean);
		// public String processAddNewProductForm(@ModelAttribute("【RecipeBean】")
		// RecipeBean recipeBean
		// 重要事項-end

		/* 開始處理圖片檔案-start */
		MultipartFile imageFile = articlebean.getArticleImage();
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (imageFile != null && !imageFile.isEmpty()) {
			String originalFilename = imageFile.getOriginalFilename();
			articlebean.setFileName(originalFilename);

			try {
				byte[] byteArray = imageFile.getBytes();
				Blob coverImage = new SerialBlob(byteArray);
				articlebean.setCoverImage(coverImage);
				;
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("圖片上傳發生異常：" + e.getMessage());
			}
		}
		/* 開始處理圖片檔案-end */

		arcicleservice.insertIcookArticle(articlebean);

		// 將上傳的檔案移到指定的資料夾
		return "A_article";/* 讓瀏覽器再次發出請求，呼叫successPage.jsp檔案 */
	}// end of processAddNewProductForm mathod

	@RequestMapping(value = "/getPicture/{article_num}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable int article_num) {
		String filepath = "/resources/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ArticleBean articlebean = arcicleservice.getIcookArticle(article_num);
		if (articlebean != null) {
			Blob blob = articlebean.getCoverImage();
			filename = articlebean.getFileName();
//			if (blob != null) {
//				System.out.println("bean.getFileName()=" + bean.getFileName());
//				filename = midBean.getFileName().trim();
//			}
			
			System.out.println("num = " + article_num);
			System.out.println("blob = " + blob);
			if (blob != null) {
				try {
					filename = articlebean.getFileName().trim();
					len = (int) blob.length();
					media = blob.getBytes(1, len); // blob.getBytes(1, len): 是 1 開頭。Jdbc相關的類別都是1 開頭。
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filepath);
				filename = filepath;
			}
		} else {
			media = toByteArray(filepath);
			filename = filepath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//		System.out.println("filename=" + filename + "*");
//		System.out.println("filePath=" + filepath);
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(media, headers, HttpStatus.OK);
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
//			System.out.println("size = " + size);
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
