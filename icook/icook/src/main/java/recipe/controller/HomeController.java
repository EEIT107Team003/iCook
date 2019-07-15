package recipe.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import recipe.model.RecipeBean;
import recipe.service.IRecipeService;

@Controller
public class HomeController {
	private IRecipeService recipeService = null;
	private ServletContext servletContext = null;

	@Autowired
	public HomeController(IRecipeService recipeService, ServletContext servletContext) {
		// 從建構子注入service屬性
		this.recipeService = recipeService;
		this.servletContext = servletContext;
	}

	@RequestMapping("/recipe/recipeIndex")
	public String recipeHome() {
		// 這是食譜首頁
		System.out.println("食譜首頁");
		return "recipe/recipeIndex";
	}
	
	/* 跟 <a href="insert">新增</a> 有關 */
	@RequestMapping(value = "/recipe/recipeInsert", method = RequestMethod.GET)
	public String insertGet(Model model) {
		RecipeBean recipe = new RecipeBean();
		model.addAttribute("RecipeBean", recipe);
		return "recipe/recipeInsert";// 呼叫recipeInsert.jsp檔案
	}

	@RequestMapping(value = "/recipe/recipeInsert", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("RecipeBean") RecipeBean recipe, RedirectAttributes redirectAttribute)
			throws UnsupportedEncodingException {
		System.out.println("recipe.getPk_recipe_id() -> " + recipe.getPk_recipe_id());
		// System.out.println("#2");
		// System.out.println("recipeBean.getRecipe_name() -> " +
		// recipe.getRecipe_name());
		// System.out.println("request.getParameter(\"recipe_name\") -> " +
		// request.getParameter("recipe_name"));
		// 重要事項-start
		// 這三個地方一定要一樣，都只打RecipeBean
		// <form:form method="POST" modelAttribute="【RecipeBean】"
		// model.addAttribute("【RecipeBean】", recipeBean);
		// public String processAddNewProductForm(@ModelAttribute("【RecipeBean】")
		// RecipeBean recipeBean
		// 重要事項-end

		// 開始處理圖片檔案-start
		MultipartFile imageFile = recipe.getImage_file();
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (imageFile != null && !imageFile.isEmpty()) {
			String originalFilename = imageFile.getOriginalFilename();
			recipe.setFile_name(originalFilename);

			try {
				byte[] byteArray = imageFile.getBytes();
				Blob recipe_image = new SerialBlob(byteArray);
				recipe.setRecipe_image(recipe_image);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("圖片上傳發生異常：" + e);
			}
		}
		// 開始處理圖片檔案-end

		recipeService.insertRecipe(recipe);
		System.out.println("recipeService.insertRecipe(recipe);");
		System.out.println("recipe.getPk_recipe_id() -> " + recipe.getPk_recipe_id());
		// redirectAttribute.addAttribute()方法無法成功使用
		// model.addAttribute("recipe", recipe);
		// model.addAttribute("pageSubject", "新增成功");
		// redirectAttribute.addAttribute("pageSubject", "新增成功");//addAttribute方法無法成功使用
		redirectAttribute.addFlashAttribute("pageSubject", "新增成功");
		redirectAttribute.addFlashAttribute("recipe", recipe);
		return "redirect:/recipe/recipeSuccessPage";// 讓瀏覽器再次發出請求，呼叫successPage.jsp檔案
	}

	@RequestMapping(value = "/deleteTwo/{pk_recipe_id}", method = RequestMethod.GET)
	public String deleteTwoGet(@PathVariable("pk_recipe_id") Integer pk_recipe_id) {
		RecipeBean recipeBean = recipeService.getRecipeById(pk_recipe_id);
		// System.out.println("recipeBean -> " + recipeBean);
		if (recipeBean != null) {
			recipeService.deleteRecipe(recipeBean);
		} else {
			System.out.println("error. no data found.\n錯誤，沒有對應這個主鍵的資料。");
		}
		//TODO 刪除完資料後必須讓瀏覽器重新發送請求
		return "redirect:/recipe/recipeDelete";
	}

	@RequestMapping(value = "/recipe/recipeUpdateOne", method = RequestMethod.GET)
	public String updateOneGet(Model model) {
		// 進入修改頁面一，顯示所有資料
		List<RecipeBean> recipeBeanList = recipeService.getAllRecipe();
		model.addAttribute("recipeBeans", recipeBeanList);
		return "recipe/recipeUpdateOne";
	}

	@RequestMapping(value = "/recipeUpdateOne/{pk_recipe_id}", method = RequestMethod.GET)
	public String updateOneGetToRecipe(@PathVariable("pk_recipe_id") Integer pk_recipe_id, Model model,
			HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		// 如果有人點擊修改頁面【updateOne.jsp】的超連結則進入這個方法。
		HttpSession session = request.getSession();
//			redirectAttribute.addFlashAttribute("pageSubject", "修改成功");
//			redirectAttribute.addFlashAttribute("recipe", recipe);
		session.setAttribute("pk_recipe_id2", pk_recipe_id);
		System.out.println("pk_recipe_id -> " + pk_recipe_id);
		RecipeBean recipe = recipeService.getRecipeById(pk_recipe_id);
		model.addAttribute("RecipeBean", recipe);
		return "recipe/recipeUpdateTwo";
	}

	@RequestMapping(value = "/recipe/recipeUpdateTwo", method = RequestMethod.POST)
	public String updateTwoBackPost(@ModelAttribute("RecipeBean") RecipeBean recipe,
			RedirectAttributes redirectAttribute, HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		// 修改程式碼
		HttpSession session = request.getSession();
		Integer pk_recipe_id2 = (Integer) session.getAttribute("pk_recipe_id2");
		recipe.setPk_recipe_id(pk_recipe_id2);

		// 開始處理圖片檔案-start
		MultipartFile imageFile = recipe.getImage_file();
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (imageFile != null && !imageFile.isEmpty()) {
			String originalFilename = imageFile.getOriginalFilename();
			recipe.setFile_name(originalFilename);

			try {
				byte[] byteArray = imageFile.getBytes();
				Blob recipe_image = new SerialBlob(byteArray);
				recipe.setRecipe_image(recipe_image);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("圖片上傳發生異常：" + e);
			}
		}
		// 開始處理圖片檔案-end

		recipeService.updateRecipe(recipe);
		redirectAttribute.addFlashAttribute("pageSubject", "修改成功");
		redirectAttribute.addFlashAttribute("recipe", recipe);
		return "redirect:/recipe/recipeSuccessPage";// 讓瀏覽器再次發出請求，呼叫successPage.jsp檔案
	}

	@RequestMapping("/recipe/recipeSelect")
	public String select(Model model) {
		System.out.println("@RequestMapping(\"/select\")");
		// 查詢
		List<RecipeBean> recipeBeanList = recipeService.getAllRecipe();
		model.addAttribute("recipeBeans", recipeBeanList);
		return "recipe/recipeSelect";
	}

	@RequestMapping("/recipe/recipeDelete")
	public String delete(Model model) {
		// 刪除
		List<RecipeBean> recipeBeanList = recipeService.getAllRecipe();
		model.addAttribute("recipeBeans", recipeBeanList);
		return "recipe/recipeDelete";
	}

	@RequestMapping(value = "/recipe/recipeSuccessPage")
	public String successPage() {
		return "recipe/recipeSuccessPage";
	}

	// RecipeBean recipe
	// 回傳圖片給網頁的函數
	@RequestMapping(value = "/getRecipePicture/{pk_recipe_id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer pk_recipe_id) {
		// String filePath = "/resources/images/NoImage.jpg";
		System.out.println("@RequestMapping(value = \"/getRecipePicture/{pk_recipe_id}\", method = RequestMethod.GET)");
		String filePath = "/resources/images/NoImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		RecipeBean recipe = recipeService.getRecipeById(pk_recipe_id);
		if (recipe != null) {
			Blob blob = recipe.getRecipe_image();
			filename = recipe.getFile_name();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len); // blob.getBytes(1, len): 是 1 開頭。Jdbc相關的類別都是1 開頭。
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException：" + e);
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
		String mimeType = servletContext.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		// System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filePath) {
//		System.out.println("private byte[] toByteArray(String filepath) { -> start");
		byte[] byteArray = null;
		InputStream fileInputStream = null;
		try {
			// System.out.println("filePath -> " + filePath);
			String realPath = servletContext.getRealPath(filePath);
			// System.out.println("realPath -> " + realPath);
			File file = new File(realPath);
			long size = file.length();
			byteArray = new byte[(int) size];
			// System.out.println("size = " + size);
			fileInputStream = servletContext.getResourceAsStream(filePath);
			// System.out.println("fis = " + fileInputStream);
			fileInputStream.read(byteArray);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fileInputStream != null) {
				try {
					fileInputStream.close();
					fileInputStream = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return byteArray;
	}

}