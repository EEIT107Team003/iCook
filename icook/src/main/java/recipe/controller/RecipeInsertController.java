package recipe.controller;

import java.sql.Blob;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class RecipeInsertController {
	private IRecipeService recipeService = null;
	private IRecipeIngredientsService recipeIngredientsService = null;
	private IRecipeUnitService recipeUnitService = null;
	private MemberService memberService = null;

	@Autowired
	public RecipeInsertController(IRecipeService recipeService, IRecipeIngredientsService recipeIngredientsService,
			IRecipeUnitService recipeUnitService, MemberService memberService) {
		this.recipeService = recipeService;
		this.recipeIngredientsService = recipeIngredientsService;
		this.recipeUnitService = recipeUnitService;
		this.memberService = memberService;
	}

	// 跟 <a href="insert">新增</a> 有關
	@RequestMapping(value = "/user/recipe/recipeInsert", method = RequestMethod.GET)
	public String insertGet(Model model) {
		// recipeInsert-第一次呼叫
		System.out.println("recipeInsert-第一次呼叫");
		return "recipe/recipeInsert";// 呼叫recipeInsert.jsp檔案
	}

	@RequestMapping(value = "/user/recipe/recipeInsert", method = RequestMethod.POST)
	public String insertPost(RecipeBean recipeBean, RecipeIngredientsBeanForm recipeIngredientsBeanForm,
			RecipeUnitBeanForm recipeUnitForm, RedirectAttributes redirectAttribute) {
		// recipeInsert-第二次呼叫
		System.out.println("recipeInsert-第二次呼叫");
		String userName = getPrincipal();
		System.out.println("userName = " + userName);
		MemberBean memberBean = null;
		memberBean = memberService.selectByUsername(userName);
		System.out.println("memberBean = " + memberBean);
		recipeBean.setMemberbean(memberBean);// 加入會員的FK

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

		// 主table-食譜table
		recipeService.insertRecipe(recipeBean);

		// 開始處理第二張關聯table【RecipeIngredientsBean】【食譜食材表單】-start
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
			// ingredientsBean.setIngredientsRecipeBean(recipeBean);// 加入食譜FK鍵索引
			ingredientsBean.setFk_recipe_id(recipeBean.getPk_recipe_id());// 加入食譜FK鍵索引
			recipeIngredientsService.insertRecipeIngredients(ingredientsBean);
			ingredientsBean = null;
		}
		// 開始處理第二張關聯table【RecipeIngredientsBean】【食譜食材表單】-end

		// 開始處理第三張關聯table【RecipeUnit】【單元食譜、食譜步驟】-start
		int recipeUnitSize = Integer.MIN_VALUE;

		// 求出總共有幾列資料「食譜步驟清單」
		if (recipeUnitForm.getExplain2().size() > recipeUnitSize) {
			recipeUnitSize = recipeUnitForm.getExplain2().size();
		}
		if (recipeUnitForm.getUnit_image2().size() > recipeUnitSize) {
			recipeUnitSize = recipeUnitForm.getUnit_image2().size();
		}
		System.out.println("recipeUnitForm -> " + recipeUnitForm);
		System.out.println("recipeUnitForm.getUnit_image2() -> " + recipeUnitForm.getUnit_image2());
		System.out.println("recipeUnitForm.getUnit_image2().get(0) -> " + recipeUnitForm.getUnit_image2().get(0));
		RecipeUnitBean recipeUnit = null;
		for (int i = 0; i < recipeUnitSize; i++) {
			recipeUnit = new RecipeUnitBean();
			recipeUnit.setStepNo(i);
			recipeUnit.setExplain(recipeUnitForm.getExplain2().get(i));
			// recipeUnit.setRecipeBeanUnit(recipeBean);// 加入食譜FK鍵索引
			recipeUnit.setFk_recipe_id(recipeBean.getPk_recipe_id());// 加入食譜FK鍵索引
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
			recipeUnitService.insertRecipeUnit(recipeUnit);
			recipeUnit = null;
		}
		// recipeBean.setRecipeUnit(recipeUnitList);
		// 開始處理第三張關聯table【RecipeUnit】【單元食譜、食譜步驟】-end

		List<RecipeIngredientsBean> recipeIngredients = recipeIngredientsService
				.getRecipeIngredientsByFk(recipeBean.getPk_recipe_id());

		List<RecipeUnitBean> recipeUnitBean = recipeUnitService.getRecipeUnitBeanByFk(recipeBean.getPk_recipe_id());

		System.out.println("讓瀏覽器再次發出請求，呼叫recipeSuccessPage.jsp檔案");

		String currentUser = this.getPrincipal();
		String recipeUser = null;
		MemberBean memberBean2 = recipeBean.getMemberbean();
		recipeUser = memberBean2.getUsername();

		redirectAttribute.addFlashAttribute("pageSubject", "新增成功");
		redirectAttribute.addFlashAttribute("recipe", recipeBean);
		redirectAttribute.addFlashAttribute("recipeIngredients", recipeIngredients);
		redirectAttribute.addFlashAttribute("recipeUnitBean", recipeUnitBean);
		redirectAttribute.addFlashAttribute("currentUser", currentUser);
		redirectAttribute.addFlashAttribute("recipeUser", recipeUser);
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
