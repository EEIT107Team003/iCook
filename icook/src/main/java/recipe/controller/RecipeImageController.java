package recipe.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import recipe.model.RecipeBean;
import recipe.model.RecipeUnitBean;
import recipe.service.IRecipeService;
import recipe.service.IRecipeUnitService;

//專門處理圖片
@Controller
public class RecipeImageController {
	private ServletContext servletContext = null;
	private IRecipeService recipeService = null;
	private IRecipeUnitService recipeUnitService = null;

	@Autowired
	public RecipeImageController(ServletContext servletContext, IRecipeService recipeService,
			IRecipeUnitService recipeUnitService) {
		this.servletContext = servletContext;
		this.recipeService = recipeService;
		this.recipeUnitService = recipeUnitService;
	}

	@RequestMapping(value = "/recipe/icookAddRecipe", method = RequestMethod.GET)
	public String insertGet(Model model) {
		return "recipe/icookAddRecipe";// 呼叫recipeInsert.jsp檔案
	}

	// RecipeBean recipe
	// 回傳圖片給網頁的函數
	@RequestMapping(value = "/getRecipePicture2/{pk_recipe_id}/{stepNo}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPictureUnit(HttpServletResponse response, @PathVariable Integer pk_recipe_id,
			@PathVariable Integer stepNo) {
		String filePath = "/resources/images/NoImage.png";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		List<RecipeUnitBean> recipeUnitBean = recipeUnitService.getRecipeUnitBeanByFk(pk_recipe_id);
		RecipeUnitBean recipeUnit = recipeUnitBean.get(stepNo);
		if (recipeUnit != null) {
			Blob blob = recipeUnit.getUnit_image();
			// filename = recipe.getFile_name();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len); // blob.getBytes(1, len): 是 1 開頭。Jdbc相關的類別都是1 開頭。
				} catch (SQLException e) {
					throw new RuntimeException("RecipeImageController 的 getPicture() 發生 SQLException：" + e);
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

	// RecipeBean recipe
	// 回傳圖片給網頁的函數
	@RequestMapping(value = "/getRecipePicture/{pk_recipe_id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse response, @PathVariable Integer pk_recipe_id) {
		// String filePath = "/resources/images/NoImage.jpg";
		System.out.println("@RequestMapping(value = \"/getRecipePicture/{pk_recipe_id}\", method = RequestMethod.GET)");
		String filePath = "/resources/images/NoImage.png";
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
