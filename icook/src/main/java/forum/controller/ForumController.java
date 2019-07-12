package forum.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import forum.model.ForumMainBean;
import forum.service.IFMService;

@Controller
public class ForumController {

	private IFMService service;

	@Autowired
	public ForumController(IFMService service) {
		this.service = service;
	}

//	@RequestMapping("/")
//	public String home() {
//		System.out.println("成功呼叫首頁");
//		return "index";
//		// Server 啟動時跳轉至首頁
//	}
//
//	@RequestMapping(value = "/home", method = RequestMethod.GET)
//	public String backHome() {
//		System.out.println("成功返回首頁");
//		return "redirect:/index";
//		// 任何返回首頁的按鈕呼叫這個方法
//	}

	@RequestMapping(value = "/newPost", method = RequestMethod.GET)
	public String insert(Model model) {
		ForumMainBean fmb = new ForumMainBean();
		model.addAttribute("ForumMainBean", fmb);
		return "addPost";
		// 新增一個主題貼文的頁面
	}

	@RequestMapping(value = "/newPost", method = RequestMethod.POST)
	public String insertForm(@ModelAttribute("ForumMainBean") ForumMainBean fmb, HttpServletRequest request,
			Model model) throws UnsupportedEncodingException {
		service.insertArticle(fmb);
		List<ForumMainBean> fmbList = service.getAllTopic();
		model.addAttribute("posts", fmbList);
		System.out.println(request.getParameter("category"));
		return "overview";
		// 新增一個主題貼文表單，成功後返回文章總覽
	}

	@RequestMapping(value = "/overview")
	public String overview(Model model) {
		List<ForumMainBean> fmbList = service.getAllTopic();
		model.addAttribute("posts", fmbList);
		return "overview";
		// 呼叫文章總覽的View
	}

	@RequestMapping(value = "/pick")
	public String specificPost(@RequestParam("harticle_id") Integer harticle_id, Integer article_id, Model model) {
		System.out.println("成功呼叫specificPost");
		model.addAttribute("posts", service.getThread(harticle_id));
		return "pick";
		// 觀看特定主題討論串
	}

	@RequestMapping(value = "/reply", method = RequestMethod.GET)
	public String reply(Model model) {
		ForumMainBean fmb = new ForumMainBean();
		model.addAttribute("ForumMainBean", fmb);
		return "addReply";
		// 呼叫新增回覆的View
	}

	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String addReply(@ModelAttribute("ForumMainBean") ForumMainBean fmb,
			@RequestParam("harticle_id") Integer harticle_id, Integer article_id, HttpServletRequest request,
			Model model) {
		fmb.setHarticle_id(harticle_id);
		service.insertReply(fmb, harticle_id);
		return this.specificPost(harticle_id, article_id, model);
		// 新增回覆的表單，成功後呼叫觀看特定討論串的方法，重新顯示討論串
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(@RequestParam("article_id") Integer article_id, Integer harticle_id, Model model) {
		ForumMainBean fmb = new ForumMainBean();
		model.addAttribute("ForumMainBean", fmb);
		model.addAttribute("posts", service.getByPK(article_id));
		return "editPost";
		// 呼叫編輯文章的表單
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String editPost(@ModelAttribute("ForumMainBean") ForumMainBean fmb, HttpServletRequest request,
			Integer article_id, Integer harticle_id, Model model) {
//		fmb.setText(request.getParameter("text"));
//		fmb.setSignature(request.getParameter("signature"));
		service.update(fmb, article_id);
		return this.specificPost(harticle_id, article_id, model);
		// 編輯文章表單，成功後呼叫觀看特定討論串的方法，重新顯示討論串
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deletePost(@RequestParam("article_id") Integer article_id, Integer harticle_id, Model model) {
		service.delete(article_id);
		if (!service.getThread(harticle_id).isEmpty()) {
			return this.specificPost(harticle_id, article_id, model);
		}
		return this.overview(model);
		//刪除文章，成功後判斷討論串有無貼文挑選合適的View
	}
	
	@RequestMapping(value = "/search")
	public String fuzzyQuery(@RequestParam("title") String title, Model model) {
		List<ForumMainBean> fmbList = service.getByTitle(title);
		model.addAttribute("posts", fmbList);
		return "queryResult";
		//標題關鍵字搜尋
	}
	
	
	@RequestMapping(value = "/like")
	@ResponseBody
	public Integer like(@RequestParam("article_id") Integer article_id, HttpServletRequest request) {
		System.out.println(request.getParameter("countId"));
		int likes = service.like(article_id);
		System.out.println("LIKE");
		return likes;
	}

}
