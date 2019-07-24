package recipe.controller;

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
import recipe.model.RecipeIngredientsBean;
import recipe.model.RecipeIngredientsBeanForm;
import recipe.model.RecipeUnit;
import recipe.model.RecipeUnitForm;
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

	@RequestMapping(value = "/recipe/search", method = RequestMethod.POST)
	public String recipeSearch(Model model, HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("@RequestMapping(value = \"/recipe/search\", method = RequestMethod.POST)");
		String recipe_name = request.getParameter("recipeSearch");
		System.out.println("recipe_name -> " + recipe_name);
		List<RecipeBean> recipeBeanList = recipeService.searchRecipe(recipe_name);
		System.out.println("recipeBeanList -> " + recipeBeanList);
		model.addAttribute("recipeBeans", recipeBeanList);
		return "recipe/recipeSelect";
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
	public String insertPost(@ModelAttribute("RecipeBean") RecipeBean recipeBean,
			RecipeIngredientsBeanForm recipeIngredientsBeanForm, RecipeUnitForm recipeUnitForm,
			RedirectAttributes redirectAttribute) {
		// RecipeBean recipeBean//主食譜、食譜封面跟摘要
		// RecipeIngredientsBeanForm recipeIngredientsBeanForm//儲存食材的表格
		// RecipeUnitForm recipeUnitForm//單元食譜、食譜步驟
		//
//		System.out.println("@RequestMapping(value = \"/recipe/recipeInsert\", method = RequestMethod.POST)");
//		System.out.println("recipe.getPk_recipe_id() -> " + recipeBean.getPk_recipe_id());
		// RecipeBean -> 食譜
		// RecipeIngredientsBeanForm -> 食材名稱
		// RecipeUnitForm -> 食譜步驟
		//
//		System.out.println("recipeBean -> " + recipeBean);
//		System.out.println("recipeIngredientsBeanForm -> " + recipeIngredientsBeanForm);
//		System.out.println("recipeUnitForm -> " + recipeUnitForm);
		//
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

		MultipartFile imageFile = recipeBean.getImage_file();
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (imageFile != null && !imageFile.isEmpty()) {
			String originalFilename = imageFile.getOriginalFilename();
			recipeBean.setFile_name(originalFilename);

			try {
				byte[] byteArray = imageFile.getBytes();
				Blob recipe_image = new SerialBlob(byteArray);
				recipeBean.setRecipe_image(recipe_image);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("圖片上傳發生異常：" + e);
			}
		}
		// 開始處理圖片檔案-end

		// 開始處理第二張關聯table【RecipeIngredientsBean】【食譜食材表單】-start
		// RecipeIngredientsBeanForm recipeIngredientsBeanForm//儲存食材的表格
//		public class RecipeIngredientsBeanForm {
//			private List<String> ingredients2;// 食材名稱
//			private List<String> quantity2;// 份量
		//
		// private List<RecipeIngredientsBean> recipeIngredients = new
		// ArrayList<RecipeIngredientsBean>();// 一對多，「食譜食材」
		List<RecipeIngredientsBean> ingredientsBeanList = new ArrayList<RecipeIngredientsBean>();
		int ingredientsSize = Integer.MIN_VALUE;

		// 求出總共有幾列資料「食材清單」
		if (recipeIngredientsBeanForm.getIngredients2().size() > ingredientsSize) {
			ingredientsSize = recipeIngredientsBeanForm.getIngredients2().size();
		}
		if (recipeIngredientsBeanForm.getQuantity2().size() > ingredientsSize) {
			ingredientsSize = recipeIngredientsBeanForm.getQuantity2().size();
		}

		RecipeIngredientsBean ingredientsBean = null;
		for (int i = 0; i < ingredientsSize; i++) {
			ingredientsBean = new RecipeIngredientsBean();// 建一個全新的空容器JavaBean，這是即將塞入每一個 List 裡面的元素
			ingredientsBean.setIngredients(recipeIngredientsBeanForm.getIngredients2().get(i));
			ingredientsBean.setQuantity(recipeIngredientsBeanForm.getQuantity2().get(i));
			ingredientsBeanList.add(ingredientsBean);
			ingredientsBean = null;
		}
		recipeBean.setRecipeIngredients(ingredientsBeanList);
		// 開始處理第二張關聯table【RecipeIngredientsBean】【食譜食材表單】-end

		// 開始處理第三張關聯table【RecipeUnit】【單元食譜、食譜步驟】-start
		List<RecipeUnit> recipeUnitList = new ArrayList<RecipeUnit>();
		int recipeUnitSize = Integer.MIN_VALUE;

		// 求出總共有幾列資料「食譜步驟清單」
		if (recipeUnitForm.getExplain2().size() > recipeUnitSize) {
			recipeUnitSize = recipeUnitForm.getExplain2().size();
		}
		if (recipeUnitForm.getUnit_image2().size() > recipeUnitSize) {
			recipeUnitSize = recipeUnitForm.getUnit_image2().size();
		}
//		recipeUnitForm
		RecipeUnit recipeUnit = null;
		for (int i = 0; i < recipeUnitSize; i++) {
			recipeUnit = new RecipeUnit();
			recipeUnit.setStepNo(i);
			recipeUnit.setExplain(recipeUnitForm.getExplain2().get(i));

			MultipartFile imageFile2 = recipeUnitForm.getUnit_image2().get(i);
			// 建立Blob物件，交由 Hibernate 寫入資料庫
			if (imageFile2 != null && !imageFile2.isEmpty()) {
				try {
					byte[] byteArray2 = imageFile2.getBytes();
					Blob unit_image = new SerialBlob(byteArray2);
					recipeUnit.setUnit_image(unit_image);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("圖片上傳發生異常：" + e);
				}
			}
			recipeUnitList.add(recipeUnit);
			recipeUnit = null;
		}
		recipeBean.setRecipeUnit(recipeUnitList);
		// 開始處理第三張關聯table【RecipeUnit】【單元食譜、食譜步驟】-end

		recipeService.insertRecipe(recipeBean);

//		System.out.println("recipeService.insertRecipe(recipe);");
//		System.out.println("recipe.getPk_recipe_id() -> " + recipeBean.getPk_recipe_id());
		// redirectAttribute.addAttribute()方法無法成功使用
		// model.addAttribute("recipe", recipe);
		// model.addAttribute("pageSubject", "新增成功");
		// redirectAttribute.addAttribute("pageSubject", "新增成功");//addAttribute方法無法成功使用
		redirectAttribute.addFlashAttribute("pageSubject", "新增成功");
		redirectAttribute.addFlashAttribute("recipe", recipeBean);
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
		// TODO 刪除完資料後必須讓瀏覽器重新發送請求
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