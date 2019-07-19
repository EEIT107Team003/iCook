package com.web.icook.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Member;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.icook.model.MemberBean;
import com.web.icook.model.MyTrackBean;
import com.web.icook.model.ProductBean;
import com.web.icook.service.MemberService;

import recipe.model.RecipeBean;
//import recipe.service.IProductService;

@Controller
public class MemberController {
//	private int member_id;
	@Autowired
	MemberService memberService;
	@Autowired
	ServletContext context;

//	@Autowired
//	IProductService productService;

	// 會員首頁
	@RequestMapping("/user")
	public String user(@ModelAttribute("MemberBean") MemberBean bean, Model model) {
		if (!getPrincipal().equals("anonymousUser")) {
			bean = memberService.selectByUsername(getPrincipal());
			model.addAttribute("member", bean);

//			List<MyTrackBean> list=memberService.selectTrackerById(bean.getMember_id());
//			model.addAttribute("mytrack",list.size);
		}
		return "user_page";
	}

	// 查詢我的追蹤
	@ResponseBody
	@RequestMapping(value = "/user/mytrack", method = RequestMethod.POST)
	public List<MyTrackBean> myTrack() {
		List<MyTrackBean> list = new ArrayList<MyTrackBean>();

		if (!getPrincipal().equals("anonymousUser")) {
			MemberBean bean = memberService.selectByUsername(getPrincipal());
			list = memberService.selectTrackerById(bean.getMember_id());
		}
		
		return list;
	}

	// 修改個人簡介
	@ResponseBody
	@RequestMapping(value = "/user/updateResume",method = RequestMethod.POST)
	public List<String> updateResume (@RequestBody MemberBean bean) {
		MemberBean memberBean = memberService.selectByUsername(getPrincipal());
		
		String dd=bean.getResume();
		memberBean.setResume(dd);
		System.out.println(dd);
		
		memberService.updateMemberInfo(memberBean, memberBean.getMember_id());
		return null;
	}
	
	// 修改大頭貼
	@RequestMapping(value = "/user/updateMemberPhoto", method = RequestMethod.GET)
	public String updateMemberPhoto(Model model) {
		MemberBean bean = memberService.selectByUsername(getPrincipal());
		model.addAttribute("MemberBean", bean);

		return "user";
	}

	@RequestMapping(value = "/user/updateMemberPhoto", method = RequestMethod.POST)
	public String updateMemberPhoto(@ModelAttribute("MemberBean") MemberBean bean, Model model) {
		MultipartFile memberImage = bean.getMember_photo_tr();
		// 完整檔名
		if (memberImage != null && !memberImage.isEmpty()) {
			String originalFilename = memberImage.getOriginalFilename();
			// 副檔名
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			// 跟目錄路徑
			String rootDirectory = context.getRealPath("/");
			try {
				byte[] b = memberImage.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setFileName_member(originalFilename);
				bean.setMember_photo(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}

			memberService.updateMember_photo(bean);
			return "redirect:/user";
		} else {
			return "redirect:/user";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/user/updateMemberPhotos", method = RequestMethod.GET)
	public List<MemberBean> updateMemberPhoto() {
		MemberBean bean = memberService.selectByUsername(getPrincipal());
		List<MemberBean> list = new ArrayList<MemberBean>();
		list.add(bean);

		System.out.println("size : " + list.size());
		for (MemberBean mb : list) {
			System.out.println("Nickname : " + mb.getNickname());
		}
		return list;
	}

	// 修改封面圖片
	@RequestMapping(value = "/user/updateCoverPhoto", method = RequestMethod.GET)
	public String updateCoverPhoto(Model model) {
		MemberBean bean = memberService.selectByUsername(getPrincipal());
		model.addAttribute("MemberBean", bean);

		return "user";
	}

	@RequestMapping(value = "/user/updateCoverPhoto", method = RequestMethod.POST)
	public String updateCoverPhoto(@ModelAttribute("MemberBean") MemberBean bean, Model model) {
		MultipartFile memberImage = bean.getCover_photo_tr();
		if (memberImage != null && !memberImage.isEmpty()) {
			// 完整檔名
			String originalFilename = memberImage.getOriginalFilename();
			// 副檔名
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			// 跟目錄路徑
			String rootDirectory = context.getRealPath("/");
			try {
				byte[] b = memberImage.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setFileName_cover(originalFilename);
				bean.setCover_photo(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
			memberService.updateCover_photo(bean);
			return "redirect:/user";
		} else {
			return "redirect:/user";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/user/updateCoverPhotos", method = RequestMethod.GET)
	public List<MemberBean> updateCoverPhoto() {
		MemberBean bean = memberService.selectByUsername(getPrincipal());
		List<MemberBean> list = new ArrayList<MemberBean>();
		list.add(bean);

		System.out.println("size : " + list.size());
		for (MemberBean mb : list) {
			System.out.println("Nickname : " + mb.getNickname());
		}
		return list;
	}

	// 修改基本資料
	@RequestMapping(value = "/user/update", method = RequestMethod.GET)
	public String updateMember(Model model) {
		MemberBean bean = memberService.selectByUsername(getPrincipal());
		model.addAttribute("MemberBean", bean);
		return "updateMember";
	}

	@RequestMapping(value = "/user/update", method = RequestMethod.POST)
	public String updateMember(@ModelAttribute("MemberBean") MemberBean bean, Model model, HttpServletRequest request) {
		memberService.updateMember(bean);
		List<MemberBean> list = new ArrayList<>();
		list.add(bean);
		model.addAttribute("members", list);
		return "result";
	}

	// 查詢全部
	@RequestMapping("/user/result")
	public String selectAllMember(Model model) {
		List<MemberBean> list = memberService.selectAll();
		model.addAttribute("members", list);
		return "result";
	}

	// 查詢單筆
	@RequestMapping(value = "/user/resultOne", method = RequestMethod.GET)
	public String SelectMemberId(Model model) {
		MemberBean bean = new MemberBean();
		model.addAttribute("MemberBean", bean);
		return "findOne";
	}

	@RequestMapping(value = "/user/resultOne", method = RequestMethod.POST)
	public String listOne(@ModelAttribute("MemberBean") MemberBean bean, Model model, HttpServletRequest request) {
		bean = memberService.selectByNickname(bean.getNickname().trim());
		List<MemberBean> list = new ArrayList<>();
		list.add(bean);
		model.addAttribute("members", list);

		return "result";
	}

	@RequestMapping("/members")
	public String members(Model model) {
		List<MemberBean> list = memberService.selectAll();
		model.addAttribute("members", list);
		return "members";
	}

	@RequestMapping(value = "/members/page")
	public String member_page(Model model, @RequestParam("member_id") Integer member_id) {
		MemberBean bean = memberService.selectById(member_id);
		int tracked_num = bean.getTracked_num();
		int recipe_num = bean.getRecipe_num();
		int forum_num = bean.getForum_num();
		model.addAttribute("member_id", member_id);
		model.addAttribute("tracked_num", tracked_num);
		model.addAttribute("recipe_num", recipe_num);
		model.addAttribute("forum_num", forum_num);

		return "member_page";
	}

	// 加入追蹤(會員)
	@RequestMapping(value = "/members/page/track", method = RequestMethod.POST)
	public String trackMembers(Model model, @RequestParam("member_id") Integer member_id) {
		MemberBean member = memberService.selectByUsername(getPrincipal());
		MemberBean tracked = memberService.selectById(member_id);

		MyTrackBean bean = new MyTrackBean();
		bean.setMemberId(member);
		bean.setTrackedId(tracked);
		memberService.trackById(bean);

		tracked.setTracked_num(tracked.getTracked_num() + 1);
		memberService.updateMemberInfo(tracked, member_id);
		return this.member_page(model, member_id);
	}

//	//我的食譜
//	@RequestMapping(value="members/myrecipe")
//	public String MyRecipe(Model model) {
//		List<RecipeBean> allRecipeBean=.getAllRecipe();
//		
//		model.addAttribute("recipes",allRecipeBean);
//		
//		return "member_page_myrecipe";
//	}

	// 新增會員
	@RequestMapping(value = "/addMember", method = RequestMethod.GET)
	public String addMember(Model model) {
		MemberBean bean = new MemberBean();
		model.addAttribute("MemberBean", bean);
		return "addMember";
	}

	@RequestMapping(value = "/addMember", method = RequestMethod.POST)
	public String addMember(@ModelAttribute("MemberBean") MemberBean bean, Model model, HttpServletRequest request) {
		// 被追蹤、發表食譜、發文 數
		bean.setTracked_num(0);
		bean.setRecipe_num(0);
		bean.setForum_num(0);
		// 設定註冊時間
		Date date = new Date(System.currentTimeMillis());
		bean.setRegister_date(date);
		// 是否水桶
		bean.setEnabled(true);
		// 權限(預設為會員)
		bean.setRole("ROLE_MEMBER");
		// 個人簡歷
		bean.setResume("Hi 很高與你分享");

		MultipartFile memberImage = bean.getMember_photo_tr();
		if (memberImage != null && !memberImage.isEmpty()) {
			// 完整檔名
			String originalFilename = memberImage.getOriginalFilename();
			bean.setFileName_member(originalFilename);
			System.out.println(originalFilename + "  --1");
			// 副檔名
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			System.out.println(ext + "  --2");
			// 跟目錄路徑
			String rootDirectory = context.getRealPath("/");
			System.out.println(rootDirectory + "  --3");
			try {
				byte[] b = memberImage.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setMember_photo(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}
		memberService.insertMember(bean);

		List<MemberBean> list = memberService.selectAll();
		model.addAttribute("members", list);

		return "result";
	}

	// 取得圖片(Member)-------------------------------------------------------------------
	@RequestMapping(value = "/getMemberPhoto/{member_id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getMemberPhoto(HttpServletResponse resp, @PathVariable Integer member_id) {
		String filePath = "/resources/images/NoImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		MemberBean bean = memberService.selectById(member_id);
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

	// 取得圖片(Cover)-------------------------------------------------------------------
	@RequestMapping(value = "/getCoverPhoto/{member_id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getCoverPhoto(HttpServletResponse resp, @PathVariable Integer member_id) {
		String filePath = "/resources/images/NoImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		MemberBean bean = memberService.selectById(member_id);
		if (bean != null) {
			Blob blob = bean.getCover_photo();
			filename = bean.getFileName_cover();
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
		byte[] b = null;
		InputStream fis = null;
		try {
			String realPath = context.getRealPath(filepath);
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
					fis = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return b;
	}

	// 取得登入帳號(username)
	public String getPrincipal() {
		String userName = null;
		// 获取当前登录对象
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
}