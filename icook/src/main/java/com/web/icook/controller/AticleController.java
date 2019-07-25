package com.web.icook.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.icook.model.ArticleBean;
import com.web.icook.model.MemberBean;
import com.web.icook.model.MsgBoardBean;
import com.web.icook.service.IcookMsgService;
import com.web.icook.service.IcookService;
import com.web.icook.service.MemberService;



import java.util.HashMap;
import java.util.Map;


// TODO mainpage裡面的推播功能
@Controller
public class AticleController {
	@Autowired
	IcookService arcicleservice;
	@Autowired
	ServletContext context;
	@Autowired
	IcookMsgService msgservice;
	@Autowired
	MemberService memberservice;
	@Autowired
	MemberController c;

	
	@RequestMapping("/A_article")
	public String A_article() {
		
		return "article/A_article";
	}
	@RequestMapping("/A_articlemainpage")
	public String A_articlemainpage() {
		
		return "forward:/A_findAll";
	}
	
	
	@RequestMapping("/A_findThree") // 指向index href裡面
	public String threelist(Model model) {
		List<ArticleBean> list = arcicleservice.getThreeArticles();
		System.out.println("list.toString()"+list.toString());
		return "list"; // 指向success.jsp
	}
	
	@RequestMapping("/A_findAll") // 指向index href裡面
	public String list(Model model) {
		List<ArticleBean> aclist = arcicleservice.getAllArticles();
		model.addAttribute("Articles", aclist);
		model.addAttribute("list",aclist);
		
		return "article/A_articlemainpage"; // 指向success.jsp
	}

	@RequestMapping(value = "/A_delete", method = RequestMethod.GET)
	public String getDeleteArticle(Model model) {
		System.out.println("#1");
		ArticleBean articlebean = new ArticleBean();
		model.addAttribute("Articlebean", articlebean);
		return "article/A_deletepage";/* 呼叫insert.jsp檔案 */
	}

	@RequestMapping(value = "/A_delete", method = RequestMethod.POST)
	public String processDeleteArticleForm(@ModelAttribute("Articlebean") ArticleBean articlebean, int article_num, HttpServletRequest request,
			Model model) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("#2");
		
		arcicleservice.deleteIcookArticle(articlebean);

		return "article/A_article";/* 讓瀏覽器再次發出請求，呼叫successPage.jsp檔案 */
	}// end of processAddNewProductForm mathod

	@RequestMapping(value = "/A_select", method = RequestMethod.GET)
	public String getSelectArticleForm(Model model) {
		System.out.println("#1");
		ArticleBean articlebean = new ArticleBean();
		model.addAttribute("Articlebeanselect", articlebean);
		
		
		
		
		
		return "article/A_selectpage";/* 呼叫insert.jsp檔案 */
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
        //前三筆文章開始
        List<ArticleBean> threelist = arcicleservice.getThreeArticles();
		model.addAttribute("ArticleThrees", threelist);
		//前三筆文章結束
		
		return "article/A_single";
//		return "redirect:/select/Msginsert.action?bean="+ab;
//		return "redirect:/findone?id="+article_num;
//		return "findone?id="+article_num;
	}
	
	//return "redirect:/emp/update.action?id=" + id
	@RequestMapping("/article")
	public String getInsertarcitleById( @RequestParam("article_num") Integer article_num, Model model,MsgBoardBean msgBoardbean) {
		
		ArticleBean ab=arcicleservice.getIcookArticle(article_num);
		model.addAttribute("Article", ab);
		model.addAttribute("modelMsginsert",msgBoardbean);
		
//		System.out.println("@RequestMapping(\"/article\")article_num="+article_num);
		//select留言板
		List<MsgBoardBean> list = msgservice.getAllMsgBoards(article_num);
		
		model.addAttribute("MsgBoards", list);
		
		//等等MemberBean mb= memberservice.selectById(memberId);
		List<ArticleBean> threelist = arcicleservice.getThreeArticles();
		model.addAttribute("ArticleThrees", threelist);
		
		return "article/A_single";
		
		
	}
	@RequestMapping("/TagarticleUpdate")
	public String getUpdatearcitleById(@RequestParam("article_num") Integer article_num, Model model,ArticleBean articlebean, HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		List<ArticleBean> list = new ArrayList<>();
		list.add(arcicleservice.getIcookArticle(articlebean.getArticle_num()));
		System.out.println("getArticle_content()"+articlebean.getArticle_content());
		model.addAttribute("Articles", list);
		model.addAttribute("test",list.get(0).getArticle_content());
		articlebean.setArticle_content(list.get(0).getArticle_content());
		model.addAttribute("ArticlebeanUpdate", articlebean);
		return "article/A_articleupdate";
		
		
	}
	
	@RequestMapping(value = "/A_update", method = RequestMethod.GET)
	public String getSelectupArticleForm(Model model) {
		System.out.println("#1");
		ArticleBean articlebean = new ArticleBean();
		model.addAttribute("ArticlebeanUpdate", articlebean);
		return "article/A_selectupdatepage";/* 呼叫insert.jsp檔案 */
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
		
		return "article/A_updatepage";/* 讓瀏覽器再次發出請求，呼叫successPage.jsp檔案 */
	}// end of processAddNewProductForm mathod

	
	@RequestMapping(value = "/A_updateAfterSelete", method = RequestMethod.GET )
	public String getUpdateArticleForm(Model model ) {
		System.out.println("#3");
		ArticleBean articlebean = new ArticleBean();
		model.addAttribute("ArticlebeanUpdate", articlebean);
		return "article/A_updatepage";
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
		
		MemberBean mb = memberservice.selectByUsername(c.getPrincipal());
		articlebean.setArticle_member(mb);
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
//		session.merge(object)
		arcicleservice.updateIcookArticle(articlebean);

		// 將上傳的檔案移到指定的資料夾
		return "redirect:/A_articlemainpage";/* 讓瀏覽器再次發出請求，呼叫successPage.jsp檔案 */
		
	}// end of processAddNewProductForm mathod

	/* 跟 <a href="insert">新增</a> 有關 */
	@RequestMapping(value = "/A_insert", method = RequestMethod.GET)
	public String getAddNewArticleForm(Model model) throws SerialException, SQLException {
		
		  //前三筆文章開始
        List<ArticleBean> threelist = arcicleservice.getThreeArticles();
		model.addAttribute("ArticleThrees", threelist);
		//前三筆文章結束
		
		System.out.println("#1");
		ArticleBean articlebean = new ArticleBean();
		model.addAttribute("Articlebean", articlebean);
		
		return "article/A_articleinster";/* 呼叫insert.jsp檔案 */
	}

	@RequestMapping(value = "/A_insert", method = RequestMethod.POST)
	public String processAddNewProductForm(@ModelAttribute("Articlebean") ArticleBean articlebean, BindingResult result,
			HttpServletRequest request ,Model model) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		
		
		MemberController c = new MemberController();
		MemberBean mb = memberservice.selectByUsername(c.getPrincipal());
		articlebean.setArticle_member(mb);
		//錯誤訊息
		Map<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrorMsg", errorMessage);
		
//		if(articlebean.getArticle_author()==null||articlebean.getArticle_author().trim().length()==0) {
//			errorMessage.put("error_Article_author", "作者名稱不可為空");
//		}
		if(articlebean.getArticle_content()==null||articlebean.getArticle_content().trim().length()==0) {
			errorMessage.put("error_Article_content", "必須輸入文章");
		}
		
//		if(articlebean.getArticle_date()==null) {
//			errorMessage.put("error_Article_date", "必須輸入日期");
//		}	
		if(articlebean.getArticle_title()==null||articlebean.getArticle_title().trim().length()==0) {
			errorMessage.put("error_Article_title", "必須輸入標題");
		}
		if (!errorMessage.isEmpty()) {
			
			return "article/A_articleinster";}
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
		return "redirect:/A_articlemainpage";/* 讓瀏覽器再次發出請求，呼叫successPage.jsp檔案 */
	}// end of processAddNewProductForm mathod

	
	
	@RequestMapping(value = "/getartPicture/{article_num}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getartPicture(HttpServletResponse resp, @PathVariable int article_num) {
		String filePath = "/resources/images/NoImage.png";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ArticleBean articlebean = arcicleservice.getIcookArticle(article_num);
		if (articlebean != null) {
			Blob blob = articlebean.getCoverImage();
			filename = articlebean.getFileName();
			
			
			if (blob != null) {
				try {
					filename = articlebean.getFileName().trim();
					len = (int) blob.length();
					media = blob.getBytes(1, len); // blob.getBytes(1, len): 是 1 開頭。Jdbc相關的類別都是1 開頭。
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getartPicture()發生SQLException: " + e.getMessage());
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
//		System.out.println("filename=" + filename + "*");
//		System.out.println("filePath=" + filepath);
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filePath) {
		
		byte[] b = null;
		InputStream fis = null;
		try {

			String realPath = context.getRealPath(filePath);// 取得絕對路徑
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
//			System.out.println("size = " + size);
			fis = context.getResourceAsStream(filePath);

			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	
	@RequestMapping(value = "/findArctile")
	public String findArctile( @RequestParam("article_title") String  article_title, Model model) {
		System.out.println("article_title="+article_title);
		List<ArticleBean> list = arcicleservice.getByArticle_Title(article_title);
		model.addAttribute("Articles", list);
		
		 //前三筆文章開始
        List<ArticleBean> threelist = arcicleservice.getThreeArticles();
		model.addAttribute("ArticleThrees", threelist);
		//前三筆文章結束
		
		model.addAttribute("list",list);
		
		return "/article/A_articlesearch"; // 指向success.jsp
	}
	
	@RequestMapping(value = "/findArctiCatergory")
	public String findArctiCatergory( @RequestParam("article_catergoary") String  article_catergoary, Model model) {	
		System.out.println("article_catergoary="+article_catergoary);
		List<ArticleBean> list = arcicleservice.getByArticle_Catergory(article_catergoary);
		model.addAttribute("Articles", list);
		model.addAttribute("list",list);
		return "/article/A_articlesearch"; // 指向success.jsp
	}
}
