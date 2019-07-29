package recipe.controller;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.icook.model.MemberBean;
import com.web.icook.service.MemberService;

import recipe.model.RecipeBean;
import recipe.model.RecipeIngredientsBean;
import recipe.model.RecipeIngredientsBeanForm;
import recipe.model.RecipeUnitBean;
import recipe.model.RecipeUnitBeanForm;
import recipe.service.IRecipeIngredientsService;
import recipe.service.IRecipeService;
import recipe.service.IRecipeUnitService;

@Controller
public class RecipeUpdateController {
	private IRecipeService recipeService = null;
	private IRecipeIngredientsService recipeIngredientsService = null;
	private IRecipeUnitService recipeUnitService = null;
	private MemberService memberService = null;

	@Autowired
	public RecipeUpdateController(IRecipeService recipeService, IRecipeIngredientsService recipeIngredientsService,
			IRecipeUnitService recipeUnitService, MemberService memberService) {
		this.recipeService = recipeService;
		this.recipeIngredientsService = recipeIngredientsService;
		this.recipeUnitService = recipeUnitService;
		this.memberService = memberService;
	}

	@RequestMapping(value = "/user/recipe/recipeUpdateOne", method = RequestMethod.GET)
	public String updateOneGet(Model model) {
		// 進入修改頁面一，顯示所有資料
		System.out.println("進入修改頁面1");
		List<RecipeBean> recipeBeanList = recipeService.getAllRecipe();

		model.addAttribute("recipeBeans", recipeBeanList);
		return "recipe/recipeUpdateOne";
	}

	// 我現在要直接由食譜結果頁的「編輯按鈕」進去這一頁。
	@RequestMapping(value = "/user/recipeUpdateOne/{pk_recipe_id}", method = RequestMethod.GET)
	public String updateOneGetToRecipe(@PathVariable("pk_recipe_id") Integer pk_recipe_id, Model model) {
		System.out.println("進入修改頁面2");
		// 如果有人點擊修改頁面【updateOne.jsp】的超連結則進入這個方法。
		RecipeBean recipe = recipeService.getRecipeById(pk_recipe_id);
		List<RecipeIngredientsBean> recipeIngredients = recipeIngredientsService.getRecipeIngredientsByFk(pk_recipe_id);

		List<RecipeUnitBean> recipeUnitBean = recipeUnitService.getRecipeUnitBeanByFk(pk_recipe_id);

		model.addAttribute("RecipeBean", recipe);
		model.addAttribute("recipeIngredients", recipeIngredients);
		model.addAttribute("recipeUnitBean", recipeUnitBean);
		return "recipe/recipeUpdateTwo";
	}

	@RequestMapping(value = "/user/recipe/recipeUpdateTwo", method = RequestMethod.POST)
	public String updateTwoBackPost(@ModelAttribute("RecipeBean") RecipeBean recipe,
			RecipeIngredientsBeanForm recipeIngredientsBeanForm, RecipeUnitBeanForm recipeUnitBeanForm,
			RedirectAttributes redirectAttribute) {
		System.out.println("進入修改頁面3");
		System.out.println("recipe.getPk_recipe_id() -> " + recipe.getPk_recipe_id());

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

		// 主table-食譜table
		// recipeService.updateRecipe(recipe);// TODO 方法已被移除

		// 開始處理第二張關聯table【RecipeIngredientsBean】【食譜食材表單】-start

		int ingredientsSize = Integer.MIN_VALUE;
//		System.out.println("recipeIngredientsBeanForm -> " + recipeIngredientsBeanForm);
//		System.out.println("recipeIngredientsBeanForm.getIngredients2() -> " + recipeIngredientsBeanForm.getIngredients2());
//		System.out.println("recipeIngredientsBeanForm.getIngredients2().size() -> " + recipeIngredientsBeanForm.getIngredients2().size());
//		System.out.println("---------------------------------------");
		// 求出總共有幾列「食材清單」
		if (recipeIngredientsBeanForm.getIngredients2().size() > ingredientsSize) {
			ingredientsSize = recipeIngredientsBeanForm.getIngredients2().size();
		}
		if (recipeIngredientsBeanForm.getQuantity2().size() > ingredientsSize) {
			ingredientsSize = recipeIngredientsBeanForm.getQuantity2().size();
		}

		// 先刪除第二張table
		recipeIngredientsService.deleteRecipeIngredientsByFk(recipe.getPk_recipe_id());

		// 接著新增第二張table
		RecipeIngredientsBean ingredientsBean = null;
		for (int i = 0; i < ingredientsSize; i++) {
			ingredientsBean = new RecipeIngredientsBean();// 建一個全新的空容器JavaBean，這是即將塞入每一個 List 裡面的元素
			ingredientsBean.setIngredients(recipeIngredientsBeanForm.getIngredients2().get(i));
			ingredientsBean.setQuantity(recipeIngredientsBeanForm.getQuantity2().get(i));
			// ingredientsBean.setIngredientsRecipeBean(recipe);// 加入FK鍵【foreign key】的關聯。
			ingredientsBean.setFk_recipe_id(recipe.getPk_recipe_id());// 加入食譜FK鍵索引
			recipeIngredientsService.insertRecipeIngredients(ingredientsBean);
			ingredientsBean = null;
		}
//		recipe.setRecipeIngredients(ingredientsBeanList);// TODO 註解掉
//		recipeBeanOld.setRecipeIngredients(ingredientsBeanList);// TODO 註解掉
		// 開始處理第二張關聯table【RecipeIngredientsBean】【食譜食材表單】-end

		// 開始處理第三張關聯table【RecipeUnit】【單元食譜、食譜步驟】-start
		int recipeUnitSize = Integer.MIN_VALUE;

		// 求出總共有幾列資料「食譜步驟清單」
		if (recipeUnitBeanForm.getExplain2().size() > recipeUnitSize) {
			recipeUnitSize = recipeUnitBeanForm.getExplain2().size();
		}
		if (recipeUnitBeanForm.getUnit_image2().size() > recipeUnitSize) {
			recipeUnitSize = recipeUnitBeanForm.getUnit_image2().size();
		}

		List<Blob> oldRecipeUnitImage = new ArrayList<Blob>();
		List<String> oldRecipeImageFilename = new ArrayList<String>();
		// 先把第三張table舊資料的 圖檔、圖檔檔名 抓出來-start
		// JDBC-start
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=icook";
			connection = DriverManager.getConnection(connectionURL, "sa", "passw0rd");
			connection.setAutoCommit(false);// 關閉自動交易模式，開啟隱性交易模式。
			String qryStmt = "SELECT unit_image, file_name FROM recipe_unit WHERE fk_recipe_id = "
					+ String.valueOf(recipe.getPk_recipe_id());
			statement = connection.createStatement();
			resultSet = statement.executeQuery(qryStmt);
			while (resultSet.next()) {
				oldRecipeUnitImage.add(resultSet.getBlob("unit_image"));
				oldRecipeImageFilename.add(resultSet.getString("file_name"));
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
		// 先把第三張table舊資料的 圖檔、圖檔檔名 抓出來-end

		// 刪掉第三張table
		recipeUnitService.deleteRecipeUnitByFk(recipe.getPk_recipe_id());

		RecipeUnitBean recipeUnit = null;
		for (int i = 0; i < recipeUnitSize; i++) {
			recipeUnit = new RecipeUnitBean();
			recipeUnit.setStepNo(i);
			recipeUnit.setExplain(recipeUnitBeanForm.getExplain2().get(i));
			// recipeUnit.setRecipeBeanUnit(recipe);// 加入FK鍵【foreign key】的關聯。
			recipeUnit.setFk_recipe_id(recipe.getPk_recipe_id());// 加入FK鍵【foreign key】的關聯。
			MultipartFile imageFile2 = recipeUnitBeanForm.getUnit_image2().get(i);
			// 建立Blob物件，交由 Hibernate 寫入資料庫
			if (imageFile2 != null && !imageFile2.isEmpty()) {
//				String originalFilename = imageFile.getOriginalFilename();
//				recipeBean.setFile_name(originalFilename);
				String originalFilename3 = imageFile2.getOriginalFilename();
				recipeUnit.setFile_name(originalFilename3);
				try {
					byte[] byteArray2 = imageFile2.getBytes();
					Blob unit_image = new SerialBlob(byteArray2);
					recipeUnit.setUnit_image(unit_image);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("圖片上傳發生異常：" + e);
				}
			} else {
				// 如果使用者沒上傳圖片，塞舊資料的圖片進去。
				recipeUnit.setUnit_image(oldRecipeUnitImage.get(i));
				recipeUnit.setFile_name(oldRecipeImageFilename.get(i));
			}
			recipeUnitService.insertRecipeUnit(recipeUnit);
			recipeUnit = null;
		}
		// 開始處理第三張關聯table【RecipeUnit】【單元食譜、食譜步驟】-end

		// 查詢第二張table的資料
		List<RecipeIngredientsBean> recipeIngredients = recipeIngredientsService
				.getRecipeIngredientsByFk(recipe.getPk_recipe_id());

		// 查詢第三張table的資料
		List<RecipeUnitBean> recipeUnitBean = recipeUnitService.getRecipeUnitBeanByFk(recipe.getPk_recipe_id());

		String currentUser = this.getPrincipal();
		String recipeUser = null;
		MemberBean memberBean2 = recipe.getMemberbean();
		System.out.println("recipe.getMemberbean() -> " + recipe.getMemberbean());
		recipeUser = memberBean2.getUsername();

		redirectAttribute.addFlashAttribute("pageSubject", "修改成功");
		redirectAttribute.addFlashAttribute("recipe", recipe);
		redirectAttribute.addFlashAttribute("recipeIngredients", recipeIngredients);
		redirectAttribute.addFlashAttribute("recipeUnitBean", recipeUnitBean);

		redirectAttribute.addFlashAttribute("currentUser", currentUser);
		redirectAttribute.addFlashAttribute("recipeUser", recipeUser);
		System.out.println("currentUser -> " + currentUser);
		System.out.println("recipeUser -> " + recipeUser);
		return "redirect:/recipe/recipeSuccessPage";// 讓瀏覽器再次發出請求，呼叫recipeSuccessPage.jsp檔案
	}

	// 取得登入帳號(username)
	public String getPrincipal() {
		String userName = null;
		// 獲取當前登錄對象
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
}
