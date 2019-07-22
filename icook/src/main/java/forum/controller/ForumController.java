package forum.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.icook.controller.MemberController;
import com.web.icook.model.MemberBean;
import com.web.icook.service.MemberService;

import forum.model.ForumMainBean;
import forum.service.IFMService;

@Controller
public class ForumController {
	// 07.22 江慶庭 -更新memberbean.forum_num
	@Autowired
	MemberService memberService;

	private IFMService service;

	@Autowired
	public ForumController(IFMService service) {
		this.service = service;
	}

	@Autowired
	MemberController mc;

	@Autowired
	MemberService ms;

//	@RequestMapping("/")
//	public String home(Model model) {
//		System.out.println("成功呼叫首頁");
//		return this.overview(model);
//		// Server 啟動時跳轉至首頁
//	}

	@RequestMapping(value = "/forum", method = RequestMethod.GET)
	public String backHome(Model model) {
		System.out.println("成功返回首頁");
		if (!getPrincipal().equals("anonymousUser")) {
			MemberBean mb = ms.selectByUsername(getPrincipal());
			List<MemberBean> mbList = new ArrayList<>();
			mbList.add(mb);
			model.addAttribute("LoginOK", mbList);
		}
		return "redirect:/forum/overview";
		// 任何返回首頁的按鈕呼叫這個方法
	}

	@RequestMapping(value = "/forum/newPost", method = RequestMethod.GET)
	public String insert(MemberBean memberBean, Model model) {

		ForumMainBean fmb = new ForumMainBean();

		model.addAttribute("ForumMainBean", fmb);
		System.out.println(getPrincipal());
		return "addPost";
		// 新增一個主題貼文的頁面
	}

	@RequestMapping(value = { "/forum/newPost" }, method = RequestMethod.POST)
	public String insertForm(@ModelAttribute("ForumMainBean") ForumMainBean fmb, HttpServletRequest request,
			MemberBean memberBean, Model model) throws UnsupportedEncodingException {
		Map<String, String> error = new HashMap<>();
		memberBean = mc.getMemberBean(getPrincipal());
		if (fmb.getCategory() == null || fmb.getCategory().length() == 0) {
			error.put("category", "必須選擇一個分類");
		}
		if (fmb.getTitle() == null || fmb.getTitle().trim().length() == 0) {
			error.put("title", "須填入標題");
		} else if (fmb.getTitle().trim().length() > 25) {
			error.put("title", "標題不能超過25字");
		}
		if (fmb.getText() == null || fmb.getText().trim().length() == 0) {
			error.put("text", "內文不得留空");
		}
		if (error.isEmpty()) {
			service.insertArticle(fmb, memberBean);
			List<ForumMainBean> fmbList = service.getAllTopic();
			model.addAttribute("posts", fmbList);

			// 07.22 江慶庭 -更新memberbean.forum_num
			List<ForumMainBean> memberList = service.getByMember_id(memberBean.getMember_id());
			memberBean.setForum_num(memberList.size());
			memberService.updateMemberInfo(memberBean, memberBean.getMember_id());

			return this.backHome(model);
		} else {
			List<ForumMainBean> fmbError = new ArrayList<>();
			fmbError.add(fmb);
			model.addAttribute("posts", fmbError);
			request.setAttribute("errors", error);
			return "addPostError";
		}
		// 新增一個主題貼文表單，成功後返回文章總覽
	}

	@RequestMapping(value = "/forum/overview")
	public String overview(Model model) {
		List<ForumMainBean> fmbList = service.getAllTopic();
//		List<String> authors = new ArrayList<String>();
//		List<String> nicknames = new ArrayList<String>();
//		for(int i = 0; i < fmbList.size(); i++) {			
//			authors.add(fmbList.get(i).getMemberBean().getUsername());
//			nicknames.add(fmbList.get(i).getMemberBean().getNickname());
//		}
		if (!getPrincipal().equals("anonymousUser")) {
			MemberBean mb = ms.selectByUsername(getPrincipal());
			List<MemberBean> mbList = new ArrayList<>();
			mbList.add(mb);
			model.addAttribute("LoginOK", mbList);
		}
		model.addAttribute("posts", fmbList);
//		model.addAttribute("authors", authors);
//		model.addAttribute("nicknames", nicknames);
		return "overview";
		// 呼叫文章總覽的View
	}

	@RequestMapping(value = "/forum/pick")
	public String specificPost(@RequestParam("harticle_id") Integer harticle_id, Integer article_id, Model model) {
		System.out.println("成功呼叫specificPost");
		List<ForumMainBean> HeadFmb = service.getByPK(harticle_id);
		model.addAttribute("HeadFmb", HeadFmb);
		model.addAttribute("posts", service.getThread(harticle_id));
		if (!getPrincipal().equals("anonymousUser")) {
			MemberBean mb = ms.selectByUsername(getPrincipal());
			List<MemberBean> mbList = new ArrayList<>();
			mbList.add(mb);
			model.addAttribute("LoginOK", mbList);
		}
		return "pick";
		// 觀看特定主題討論串
	}

	@RequestMapping(value = "/forum/reply", method = RequestMethod.GET)
	public String reply(@RequestParam("harticle_id") Integer harticle_id, Model model, MemberBean memberBean) {
		List<ForumMainBean> HeadFmb = service.getByPK(harticle_id);
		model.addAttribute("HeadFmb", HeadFmb);
		ForumMainBean fmb = new ForumMainBean();
		model.addAttribute("ForumMainBean", fmb);
		
		return "addReply";
		// 呼叫新增回覆的View
	}

	@RequestMapping(value = "/forum/reply", method = RequestMethod.POST)
	public String addReply(@ModelAttribute("ForumMainBean") ForumMainBean fmb,
			@RequestParam("harticle_id") Integer harticle_id, Integer article_id, HttpServletRequest request,
			MemberBean memberBean, Model model) {
		Map<String, String> error = new HashMap<>();
		memberBean = mc.getMemberBean(getPrincipal());
		if (fmb.getText() == null || fmb.getText().trim().length() == 0) {
			error.put("text", "內文不得留空");
		}
		if (error.isEmpty()) {
			fmb.setHarticle_id(harticle_id);
			service.insertReply(fmb, harticle_id, memberBean);
			MemberBean bean = memberService.selectByUsername(getPrincipal());
			List<ForumMainBean> memberList = service.getByMember_id(bean.getMember_id());
			bean.setForum_num(memberList.size());
			memberService.updateMemberInfo(bean, bean.getMember_id());
			return "redirect:/forum/" + this.specificPost(harticle_id, article_id, model) + "?harticle_id="
					+ harticle_id;
		} else {
			List<ForumMainBean> fmbError = new ArrayList<>();
			fmbError.add(fmb);
			model.addAttribute("posts", fmbError);
			request.setAttribute("errors", error);
			return "replyError";
		}
		// 新增回覆的表單，成功後呼叫觀看特定討論串的方法，重新顯示討論串
	}

	@RequestMapping(value = "/forum/edit", method = RequestMethod.GET)
	public String edit(@RequestParam("article_id") Integer article_id, Integer harticle_id, Model model,
			MemberBean memberBean) {
		List<ForumMainBean> HeadFmb = service.getByPK(harticle_id);
		model.addAttribute("HeadFmb", HeadFmb);
		ForumMainBean fmb = new ForumMainBean();
		model.addAttribute("ForumMainBean", fmb);
		model.addAttribute("posts", service.getByPK(article_id));
		return "editPost";
		// 呼叫編輯文章的表單
	}

	@RequestMapping(value = "/forum/edit", method = RequestMethod.POST)
	public String editPost(@ModelAttribute("ForumMainBean") ForumMainBean fmb, HttpServletRequest request,
			MemberBean memberBean, Integer article_id, Integer harticle_id, Model model) {
		Map<String, String> error = new HashMap<>();
		memberBean = mc.getMemberBean(getPrincipal());
		if (fmb.getCategory() == null || fmb.getCategory().length() == 0) {
			error.put("category", "必須選擇一個分類");
		}
		if (fmb.getTitle() == null || fmb.getTitle().trim().length() == 0) {
			error.put("title", "須填入標題");
		} else if (fmb.getTitle().trim().length() > 25) {
			error.put("title", "標題不能超過25字");
		}
		if (fmb.getText() == null || fmb.getText().trim().length() == 0) {
			error.put("text", "內文不得留空");
		}
		if (error.isEmpty()) {
//			fmb.setText(request.getParameter("text"));
//			fmb.setSignature(request.getParameter("signature"));
			service.update(fmb, article_id, memberBean);
			return this.specificPost(harticle_id, article_id, model);
		} else {
			List<ForumMainBean> fmbError = new ArrayList<>();
			List<ForumMainBean> HeadFmb = service.getByPK(harticle_id);
			fmbError.add(fmb);
			model.addAttribute("HeadFmb", HeadFmb);
			model.addAttribute("posts", fmbError);
			request.setAttribute("errors", error);
			return "editError";
		}
		// 編輯文章表單，成功後呼叫觀看特定討論串的方法，重新顯示討論串
	}

	@RequestMapping(value = "/forum/delete", method = RequestMethod.GET)
	public String deletePost(@RequestParam("article_id") Integer article_id, Integer harticle_id, Model model) {
		service.delete(article_id);
		if (!service.getThread(harticle_id).isEmpty()) {
			// 07.22 江慶庭 -更新memberbean.forum_num
			MemberBean memberBean = memberService.selectByUsername(getPrincipal());
			List<ForumMainBean> memberList = service.getByMember_id(memberBean.getMember_id());
			memberBean.setForum_num(memberList.size());
			memberService.updateMemberInfo(memberBean, memberBean.getMember_id());

			return "redirect:/forum/" + this.specificPost(harticle_id, article_id, model) + "?harticle_id="
					+ harticle_id;
		}
		// 07.22 江慶庭 -更新memberbean.forum_num
		MemberBean memberBean = memberService.selectByUsername(getPrincipal());
		List<ForumMainBean> memberList = service.getByMember_id(memberBean.getMember_id());
		memberBean.setForum_num(memberList.size());
		memberService.updateMemberInfo(memberBean, memberBean.getMember_id());

		return "redirect:/forum/" + this.overview(model);
		// 刪除文章，成功後判斷討論串有無貼文挑選合適的View
	}

	@RequestMapping(value = "/forum/search")
	public String fuzzyQuery(@RequestParam("title") String title, Model model) {
		List<ForumMainBean> fmbList = service.getByTitle(title);
		model.addAttribute("posts", fmbList);
		return "overview";
		// 標題關鍵字搜尋
	}

	@RequestMapping(value = "/forum/query")
	public String categoryQuery(@RequestParam("category") String category, Model model) {
		List<ForumMainBean> fmbList = service.getByCategory(category);
		model.addAttribute("posts", fmbList);
		return "overview";
	}

	@RequestMapping(value = "/forum/like")
	@ResponseBody
	public Integer like(@RequestParam("article_id") Integer article_id, HttpServletRequest request,
			MemberBean memberBean) {
		System.out.println(request.getParameter("countId"));
		memberBean = mc.getMemberBean(getPrincipal());
		int likes = service.like(article_id, memberBean);
		System.out.println("LIKE");
		return likes;
	}

	@RequestMapping(value = "/forum/test")
	public String websocketTest() {
		return "test";
	}

	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

	@RequestMapping(value = "/forum/isLogin")
	@ResponseBody
	public Integer getMemberId(@RequestParam Integer article_id) {
		System.out.println(article_id);
		List<ForumMainBean> fmbList = service.getByPK(article_id);
		if (!(fmbList.isEmpty())) {
			ForumMainBean fmb = fmbList.get(0);
			Integer memberId = fmb.getMemberBean().getMember_id();
			return memberId;
		}
		return null;
	}

}
