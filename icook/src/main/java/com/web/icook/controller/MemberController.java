package com.web.icook.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
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
import org.springframework.security.access.prepost.PreAuthorize;
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
import com.web.icook.service.MemberService;
import com.web.icook.service.MyTrackService;

import forum.model.ForumMainBean;
import forum.service.IFMService;

@Controller
public class MemberController {
//	private int member_id;
	@Autowired
	MemberService memberService;
	@Autowired
	MyTrackService myTrackService;
	@Autowired
	ServletContext context;
	@Autowired
	IFMService ifmService;

//	@Autowired
//	IProductService productService;

	// 會員首頁
	@RequestMapping("/user")
	public String user(@ModelAttribute("MemberBean") MemberBean bean, Model model) {
		if (!getPrincipal().equals("anonymousUser")) {
			bean = memberService.selectByUsername(getPrincipal());
			model.addAttribute("member", bean);
		}
		return "member/icookUser";
	}


	// 查詢我的追蹤
	@ResponseBody
	@RequestMapping(value = "/user/mytrack", method = RequestMethod.POST)
	public List<MyTrackBean> myTrack() {
		List<MyTrackBean> list = new ArrayList<MyTrackBean>();

		if (!getPrincipal().equals("anonymousUser")) {
			MemberBean bean = memberService.selectByUsername(getPrincipal());
			list = myTrackService.selectTrackerById(bean.getMember_id());
		}
		return list;
	}

	// 查詢我的文章
	@ResponseBody
	@RequestMapping(value = "/user/myforum", method = RequestMethod.POST)
	public List<ForumMainBean> myForum() {
		List<ForumMainBean> list = new ArrayList<ForumMainBean>();

		if (!getPrincipal().equals("anonymousUser")) {
			MemberBean bean = memberService.selectByUsername(getPrincipal());
			list = ifmService.getByMember_id(bean.getMember_id());
			System.out.println(list.size());
		}
		return list;
	}

	// 修改個人簡介
	@ResponseBody
	@RequestMapping(value = "/user/updateResume", method = RequestMethod.POST)
	public List<String> updateResume(@RequestBody MemberBean bean) {
		MemberBean memberBean = memberService.selectByUsername(getPrincipal());
		String dd = bean.getResume();
		memberBean.setResume(dd);

		memberService.updateMemberInfo(memberBean, memberBean.getMember_id());
		return null;
	}

	// 修改基本資料
	@ResponseBody
	@RequestMapping(value = "/user/update", method = RequestMethod.POST)
	public List<String> updateMember(Model model, @RequestBody MemberBean bean) {
		System.out.println(bean.getNickname());
		MemberBean memberBean = memberService.selectByUsername(getPrincipal());
		memberBean.setNickname(bean.getNickname());
		memberBean.setAddress(bean.getAddress());
		memberBean.setMember_phone_num(bean.getMember_phone_num());
		memberBean.setResume(bean.getResume());
		memberService.updateMemberInfo(memberBean, memberBean.getMember_id());
		return null;
	}

	// 修改大頭貼
	@RequestMapping(value = "/user/updateMemberPhoto", method = RequestMethod.GET)
	public String updateMemberPhoto(Model model) {
		MemberBean bean = memberService.selectByUsername(getPrincipal());
		model.addAttribute("MemberBean", bean);

		return "member/user";
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

		for (MemberBean mb : list) {
//			System.out.println("Nickname : " + mb.getNickname());
		}
		return list;
	}

	// 修改封面圖片
	@RequestMapping(value = "/user/updateCoverPhoto", method = RequestMethod.GET)
	public String updateCoverPhoto(Model model) {
		MemberBean bean = memberService.selectByUsername(getPrincipal());
		model.addAttribute("MemberBean", bean);

		return "member/user";
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

//		System.out.println("size : " + list.size());
		for (MemberBean mb : list) {
//			System.out.println("Nickname : " + mb.getNickname());
		}
		return list;
	}

//	@RequestMapping(value = "/user/update", method = RequestMethod.POST)
//	public String updateMember(@ModelAttribute("MemberBean") MemberBean bean, Model model, HttpServletRequest request) {
//		memberService.updateMember(bean);
//		List<MemberBean> list = new ArrayList<>();
//		list.add(bean);
//		model.addAttribute("members", list);
//		return "result";
//	}

//-------------------------------  members  ---------------------------------------------------------------------------
	//前往會員頁
	@RequestMapping(value = "/members/page")
	public String member_page(Model model, @RequestParam("member_id") Integer member_id) {
		int user_id = 0;
		if ((!getPrincipal().equals("anonymousUser"))) {
			user_id = memberService.selectByUsername(getPrincipal()).getMember_id();
		}
		
		if (member_id == user_id) {
			return "redirect:/user";
		} else {
			MemberBean bean = memberService.selectById(member_id);
			model.addAttribute("member", bean);
			return "member/icookMembers";
		}
	}
	
	// 加入追蹤(非會員)
	@RequestMapping(value = "/members/page/track", method = RequestMethod.POST)
	public String trackMembers(Model model, @RequestParam("member_id") Integer member_id) {
		return this.member_page(model, member_id);
	}

	// 加入追蹤(會員)
	@ResponseBody
	@RequestMapping(value = "/members/page/track", method = RequestMethod.GET)
	public List<MyTrackBean> trackMember(@RequestParam(value = "member_id") Integer member_id) {
		MemberBean member = memberService.selectByUsername(getPrincipal());
		System.out.println(member_id);
		MemberBean tracked = memberService.selectById(member_id);
		MyTrackBean bean = new MyTrackBean();
		bean.setMemberId(member);
		bean.setTrackedId(tracked);
		Timestamp trackTime = new Timestamp(System.currentTimeMillis());
		bean.setTrackTime(trackTime);
		myTrackService.trackById(bean);

		List<MyTrackBean> list = new ArrayList<MyTrackBean>();
		list = myTrackService.selectTrackedById(tracked.getMember_id());
		tracked.setTracked_num(list.size());
//		//更新被追蹤者數量
		memberService.updateMemberInfo(tracked, member_id);
		return list;
	}

	// 查詢特定追蹤者是否被追蹤過
	@ResponseBody
	@RequestMapping(value = "/members/page/checkTracked", method = RequestMethod.POST)
	public List<MyTrackBean> selectOneTrackerById(
			@RequestParam(value = "member_id", required = false) Integer member_id) {
		MemberBean bean = memberService.selectByUsername(getPrincipal());
		List<MyTrackBean> list = myTrackService.selectOneTrackerById(bean.getMember_id(), member_id);
		return list;
	}

	// 取消追蹤
	@ResponseBody
	@RequestMapping(value = "/members/page/TrackCancel", method = RequestMethod.GET)
	public List<MyTrackBean> trackCancel(@RequestParam(value = "member_id", required = false) Integer member_id) {
		MemberBean bean = memberService.selectByUsername(getPrincipal());
		MemberBean tracked = memberService.selectById(member_id);
		int trackCancelCheck = myTrackService.trackCancel(bean.getMember_id(), member_id);

		List<MyTrackBean> list = new ArrayList<MyTrackBean>();
		list = myTrackService.selectTrackedById(member_id);
		System.out.println(list.size());
		tracked.setTracked_num(list.size());
		memberService.updateMemberInfo(tracked, member_id);

		return list;
	}

	// 查詢會員文章
	@ResponseBody
	@RequestMapping(value = "/members/page/myforum", method = RequestMethod.POST)
	public List<ForumMainBean> membersForum(@RequestParam(value = "member_id", required = false) Integer member_id) {
		List<ForumMainBean> list = new ArrayList<ForumMainBean>();
		list = ifmService.getByMember_id(member_id);
		System.out.println(list.size());
		return list;
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

//-------------------------------  無權限  ---------------------------------------------------------------------------

	// 新增會員
	@RequestMapping(value = "/icookRegister", method = RequestMethod.GET)
	public String addMember(Model model) {
		MemberBean bean = new MemberBean();
		model.addAttribute("MemberBean", bean);
		return "member/icookRegister";
	}

	@RequestMapping(value = "/icookRegister", method = RequestMethod.POST)
	public String addMember(@ModelAttribute("MemberBean") MemberBean bean, Model model, HttpServletRequest request) {
		// 連絡電話
		bean.setMember_phone_num("未輸入");
		// 送貨地址
		bean.setAddress("未輸入");
		// 被追蹤、發表食譜、發文數
		bean.setTracked_num(0);
		bean.setRecipe_num(0);
		bean.setForum_num(0);
		// 設定註冊時間
		Date date = new Date(System.currentTimeMillis());
		bean.setRegister_date(date);
		// 是否有效
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
//			System.out.println(originalFilename + "  --1");
			// 副檔名
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//			System.out.println(ext + "  --2");
			// 跟目錄路徑
			String rootDirectory = context.getRealPath("/");
//			System.out.println(rootDirectory + "  --3");
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

		return "icookIndex";
	}
	
	// 新增管理員
	@RequestMapping(value = "/icookAdminRegister", method = RequestMethod.GET)
	public String addAdminMember(Model model) {
		MemberBean bean = new MemberBean();
		model.addAttribute("MemberBean", bean);
		return "member/icookAdminRegister";
	}

	@RequestMapping(value = "/icookAdminRegister", method = RequestMethod.POST)
	public String addAdminMember(@ModelAttribute("MemberBean") MemberBean bean, Model model, HttpServletRequest request) {
		// 連絡電話
		bean.setMember_phone_num("未輸入");
		// 送貨地址
		bean.setAddress("未輸入");
		// 被追蹤、發表食譜、發文數
		bean.setTracked_num(0);
		bean.setRecipe_num(0);
		bean.setForum_num(0);
		// 設定註冊時間
		Date date = new Date(System.currentTimeMillis());
		bean.setRegister_date(date);
		// 是否有效
		bean.setEnabled(true);
		// 權限(預設為會員)
		bean.setRole("ROLE_ADMIN");
		// 個人簡歷
		bean.setResume("新加入的管理員");

		MultipartFile memberImage = bean.getMember_photo_tr();
		if (memberImage != null && !memberImage.isEmpty()) {
			// 完整檔名
			String originalFilename = memberImage.getOriginalFilename();
			bean.setFileName_member(originalFilename);
//			System.out.println(originalFilename + "  --1");
			// 副檔名
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//			System.out.println(ext + "  --2");
			// 跟目錄路徑
			String rootDirectory = context.getRealPath("/");
//			System.out.println(rootDirectory + "  --3");
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

		return "icookLogin";
//		return "backStage/examples/dashboard";
	}
	
	
	

	// 取得圖片(Member)-------------------------------------------------------------------
	@RequestMapping(value = "/getMemberPhoto/{member_id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getMemberPhoto(HttpServletResponse resp, @PathVariable Integer member_id) {
		String filePath = "/resources/images/NoImage.png";
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
		String filePath = "/resources/images/NoCover.png";
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
//		System.out.println("mediaType=" + mediaType);
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
		// 獲得當前登入對象
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

	public MemberBean getMemberBean(String username) {
		return memberService.selectByUsername(username);
	}
}
