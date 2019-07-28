package recipe.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//import java.util.ArrayList;
//import java.util.List;

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
//import recipe.model.RecipeUnitBean;
import recipe.service.IRecipeService;
//import recipe.service.IRecipeUnitService;

//專門處理圖片
@Controller
public class RecipeImageController {
	private ServletContext servletContext = null;
	private IRecipeService recipeService = null;
//	private IRecipeUnitService recipeUnitService = null;

	@Autowired
	public RecipeImageController(ServletContext servletContext, IRecipeService recipeService) {
		this.servletContext = servletContext;
		this.recipeService = recipeService;
	}

	@RequestMapping(value = "/recipe/icookAddRecipe", method = RequestMethod.GET)
	public String insertGet(Model model) {
		return "recipe/icookAddRecipe";// 呼叫recipeInsert.jsp檔案
	}

	// 回傳圖片給網頁的函數，回傳食譜步驟圖片.
	@SuppressWarnings("null")
	@RequestMapping(value = "/getRecipePicture2/{pk_recipe_id}/{stepNo}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPictureUnit(HttpServletResponse response, @PathVariable Integer pk_recipe_id,
			@PathVariable Integer stepNo) {
		// System.out.println("資料進得去，圖片出不來，bug解不完。");
//		System.out.println("開始抓取食譜步驟圖片-start");
		String filePath = "/resources/images/NoImage.png";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		Blob blob = null;
		String filename = "";
		int len = 0;

		// JDBC-start
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=icook";
			connection = DriverManager.getConnection(connectionURL, "sa", "passw0rd");
			connection.setAutoCommit(false);// 關閉自動交易模式，開啟隱性交易模式。
			String qryStmt = "SELECT unit_image, file_name FROM recipe_unit WHERE (fk_recipe_id = "
					+ String.valueOf(pk_recipe_id) + " AND stepNo = " + String.valueOf(stepNo) + ")";
			statement = connection.createStatement();
			resultSet = statement.executeQuery(qryStmt);
			while (resultSet.next()) {
				blob = resultSet.getBlob("unit_image");
//				System.out.println("#2 blob -> " + blob);
				filename = resultSet.getString("file_name");
//				System.out.println("#2 filename -> " + filename);
			}
			connection.commit();// commit把資料 新、刪、改、查 結果送出去
		} catch (ClassNotFoundException e1) {
			try {
				connection.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			e1.printStackTrace();
		} catch (SQLException e1) {
			try {
				connection.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			e1.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					// 開啟自動交易模式，關閉隱性交易模式。
					connection.setAutoCommit(true);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (resultSet != null) {
				try {
					resultSet.close();
					resultSet = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (statement != null) {
				try {
					statement.close();
					statement = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (connection != null) {
				try {
					connection.close();
					connection = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		// JDBC-end
		// System.out.println("喔 77777， 為什麼食譜步驟圖片就是出不來？");

		if (blob != null) {
			try {
				len = (int) blob.length();
//				System.out.println("#2 blob.length() -> " + blob.length());
				media = blob.getBytes(1, len); // blob.getBytes(1, len): 是 1 開頭。Jdbc相關的類別都是1 開頭。
//				System.out.println("#2 media -> " + media);
			} catch (SQLException e) {
				throw new RuntimeException("#2 getPicture()發生SQLException：" + e);
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}

		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = servletContext.getMimeType(filename);
//		System.out.println("#2 mimeType -> " + mimeType);
		MediaType mediaType = MediaType.valueOf(mimeType);
//		System.out.println("#2 mediaType -> " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(media, headers, HttpStatus.OK);
//		System.out.println("開始抓取食譜步驟圖片-end");
		return responseEntity;
	}

//	// 回傳圖片給網頁的函數，回傳食譜步驟圖片.
//	//error-抓取資料功能失敗。
//	@RequestMapping(value = "/getRecipePicture2/{pk_recipe_id}/{stepNo}", method = RequestMethod.GET)
//	public ResponseEntity<byte[]> getPictureUnit(HttpServletResponse response, @PathVariable Integer pk_recipe_id,
//			@PathVariable Integer stepNo) throws ClassNotFoundException, SQLException {
//		// System.out.println("資料進得去，圖片出不來，bug解不完。");
//		System.out.println("開始抓取食譜步驟圖片-start");
//		String filePath = "/resources/images/NoImage.png";
//		byte[] media = null;
//		HttpHeaders headers = new HttpHeaders();
//		String filename = "";
//		int len = 0;
//		RecipeUnitBean recipeUnit = recipeUnitService.getRecipeUnitByFkAndStepNo(pk_recipe_id, stepNo);
//		// System.out.println("喔 77777， 為什麼圖片就是出不來？");
//		if (recipeUnit != null) {
//			Blob blob = recipeUnit.getUnit_image();
//			filename = recipeUnit.getFile_name();
//			if (blob != null) {
//				try {
//					len = (int) blob.length();
//					media = blob.getBytes(1, len); // blob.getBytes(1, len): 是 1 開頭。Jdbc相關的類別都是1 開頭。
//				} catch (SQLException e) {
//					throw new RuntimeException("#2 getPicture()發生SQLException：" + e);
//				}
//			} else {
//				media = toByteArray(filePath);
//				filename = filePath;
//			}
//		}
//		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//		String mimeType = servletContext.getMimeType(filename);
//		System.out.println("#2 mimeType -> " + mimeType);
//		MediaType mediaType = MediaType.valueOf(mimeType);
//		System.out.println("#2 mediaType -> " + mediaType);
//		headers.setContentType(mediaType);
//		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(media, headers, HttpStatus.OK);
//		System.out.println("開始抓取食譜步驟圖片-end");
//		return responseEntity;
//	}

	// 回傳圖片給網頁的函數，回傳食譜封面主圖片.
	@RequestMapping(value = "/getRecipePicture/{pk_recipe_id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse response, @PathVariable Integer pk_recipe_id) {
		// String filePath = "/resources/images/NoImage.jpg";
//		System.out.println("@RequestMapping(value = \"/getRecipePicture/{pk_recipe_id}\", method = RequestMethod.GET)");
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
					throw new RuntimeException("#1 getPicture()發生SQLException：" + e);
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
//		System.out.println("#1 mimeType -> " + mimeType);
		MediaType mediaType = MediaType.valueOf(mimeType);
//		System.out.println("#1 mediaType -> " + mediaType);
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
