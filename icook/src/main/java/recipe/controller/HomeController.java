package recipe.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.icook.model.MemberBean;
import com.web.icook.service.MemberService;

import recipe.model.RecipeBean;
import recipe.model.RecipeIngredientsBean;
import recipe.model.RecipeUnitBean;
import recipe.service.IRecipeIngredientsService;
import recipe.service.IRecipeService;
import recipe.service.IRecipeUnitService;

@Controller
public class HomeController {
	private IRecipeService recipeService = null;
	private IRecipeIngredientsService recipeIngredientsService = null;
	private IRecipeUnitService recipeUnitService = null;
	private MemberService memberService = null;

	@Autowired
	public HomeController(IRecipeService recipeService, IRecipeIngredientsService recipeIngredientsService,
			IRecipeUnitService recipeUnitService, MemberService memberService) {
		this.recipeService = recipeService;
		this.recipeIngredientsService = recipeIngredientsService;
		this.recipeUnitService = recipeUnitService;
		this.memberService = memberService;
	}

	@RequestMapping(value = "/recipe/search2", method = RequestMethod.POST)
	public String recipeSearch2(Model model, HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		// searchTwo
		// recipeSearch
		// name食譜、author作者名稱
		String searchTwo = request.getParameter("searchTwo");// 食譜搜尋 或 作者搜尋
		String recipeSearch = request.getParameter("recipeSearch2");// 搜尋名稱
//		System.out.println("searchTwo -> " + searchTwo);
//		System.out.println("recipeSearch -> " + recipeSearch);
		if (searchTwo.equals("name")) {
			// 食譜名稱搜尋
			List<RecipeBean> recipeBeanList = recipeService.searchRecipe(recipeSearch);
			model.addAttribute("recipeBeans", recipeBeanList);
		}
		if (searchTwo.equals("author")) {
			// 作者名稱搜尋
			// TODO 尚未完成
			List<RecipeBean> recipeBeanList = recipeService.searchRecipe(recipeSearch);
			model.addAttribute("recipeBeans", recipeBeanList);
		}
		return "recipe/recipeSelect";
	}

	@RequestMapping(value = "/recipe/search", method = RequestMethod.POST)
	public String recipeSearch(Model model, HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
//		System.out.println("@RequestMapping(value = \"/recipe/search\", method = RequestMethod.POST)");
		String recipe_name = request.getParameter("recipeSearch");
//		System.out.println("recipe_name -> " + recipe_name);
		List<RecipeBean> recipeBeanList = recipeService.searchRecipe(recipe_name);
//		System.out.println("recipeBeanList -> " + recipeBeanList);
		model.addAttribute("recipeBeans", recipeBeanList);
		return "recipe/recipeSelect";
	}

	// TODO 能夠從首頁食物圖片點進去食譜結果頁面
	@RequestMapping(value = "/recipe/recipeSuccessPage/two/{pk_recipe_id}")
	public String successPageTwo(@PathVariable("pk_recipe_id") Integer pk_recipe_id,
			RedirectAttributes redirectAttribute) {
		// 能夠從首頁食物圖片點進去食譜結果頁面
//		System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
//		System.out.println("recipeService.searchRecipeByMemberId(13) -> " + recipeService.searchRecipeByMemberId(13));
//		System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");

		RecipeBean recipe = recipeService.getRecipeById(pk_recipe_id);
		List<RecipeIngredientsBean> recipeIngredients = recipeIngredientsService.getRecipeIngredientsByFk(pk_recipe_id);
		List<RecipeUnitBean> recipeUnitBean = recipeUnitService.getRecipeUnitBeanByFk(pk_recipe_id);

		redirectAttribute.addFlashAttribute("recipe", recipe);
		redirectAttribute.addFlashAttribute("recipeIngredients", recipeIngredients);
		redirectAttribute.addFlashAttribute("recipeUnitBean", recipeUnitBean);

		String currentUser = this.getPrincipal();
		String recipeUser = null;
		MemberBean memberBean2 = recipe.getMemberbean();
		System.out.println("recipe.getMemberbean() -> " + recipe.getMemberbean());
		recipeUser = memberBean2.getUsername();
		redirectAttribute.addFlashAttribute("currentUser", currentUser);
		redirectAttribute.addFlashAttribute("recipeUser", recipeUser);
		redirectAttribute.addFlashAttribute("memberBean", memberBean2);
//		System.out.println("currentUser -> " + currentUser);
//		System.out.println("recipeUser -> " + recipeUser);
		return "redirect:/recipe/recipeSuccessPage";
	}

	@RequestMapping("/user/recipe/recipeDelete")
	public String delete(Model model) {
		// 刪除
		List<RecipeBean> recipeBeanList = recipeService.getAllRecipe();
		model.addAttribute("recipeBeans", recipeBeanList);
		// return "user/recipe/recipeDelete";
		return "recipe/recipeDelete";// 呼叫.jsp檔案
	}

	@RequestMapping(value = "/user/deleteTwo/{pk_recipe_id}", method = RequestMethod.GET)
	public String deleteTwoGet(@PathVariable("pk_recipe_id") Integer pk_recipe_id) {
//		System.out.println("deleteTwoGet");
		RecipeBean recipeBean = recipeService.getRecipeById(pk_recipe_id);
		if (recipeBean != null) {
//			System.out.println("before recipeIngredientsService.deleteRecipeIngredientsByFk(pk_recipe_id);");
			recipeIngredientsService.deleteRecipeIngredientsByFk(pk_recipe_id);
//			System.out.println("after recipeIngredientsService.deleteRecipeIngredientsByFk(pk_recipe_id);");
//			System.out.println("before recipeUnitService.deleteRecipeUnitByFk(pk_recipe_id);");
			recipeUnitService.deleteRecipeUnitByFk(pk_recipe_id);// TODO 方法已經被移除
//			System.out.println("after recipeUnitService.deleteRecipeUnitByFk(pk_recipe_id);");
//			System.out.println("before recipeService.deleteRecipe(recipeBean);");
			recipeService.deleteRecipe(recipeBean);// TODO 方法已經被移除
//			System.out.println("after recipeService.deleteRecipe(recipeBean);");
		}
		// 刪除完資料後必須讓瀏覽器重新發送請求
		// return "redirect:/user/recipe/recipeDelete";// 瀏覽器再次發送請求的網址
		return "index2";
	}

	@RequestMapping("/recipe/recipeSelect")
	public String select(Model model) {
//		System.out.println("@RequestMapping(\"/select\")");
		// 查詢
		List<RecipeBean> recipeBeanList = recipeService.getAllRecipe();
		model.addAttribute("recipeBeans", recipeBeanList);
		return "recipe/recipeSelect";
	}

	@RequestMapping("/recipe/recipeSelectTwo/{pk_recipe_id}")
	public String selectTwo(@PathVariable("pk_recipe_id") Integer pk_recipe_id, RedirectAttributes redirectAttribute) {
		// 查詢頁面導向完整食譜頁面。
//		System.out.println("查詢頁面導向完整食譜頁面。");
//		System.out.println("@RequestMapping(\"/recipe/recipeSelectTwo/{pk_recipe_id}\")");
		RecipeBean recipeBean = recipeService.getRecipeById(pk_recipe_id);
		List<RecipeIngredientsBean> recipeIngredients = recipeIngredientsService.getRecipeIngredientsByFk(pk_recipe_id);
		List<RecipeUnitBean> recipeUnitBean = recipeUnitService.getRecipeUnitBeanByFk(pk_recipe_id);
		// 因為 LazyInitializationException 的問題，
		// 所以必須要事先設定好資料。
//		List<RecipeIngredientsBean> ingredientsBeanList = recipeIngredientsService
//				.getRecipeIngredientsByFk(pk_recipe_id);
//		recipeBean.setRecipeIngredients(ingredientsBeanList);

		// 因為 LazyInitializationException 的問題，
		// 所以必須要事先設定好資料。
//		List<RecipeUnitBean> unitBeanList = recipeUnitService.getRecipeUnitBeanByFk(pk_recipe_id);
//		recipeBean.setRecipeUnit(unitBeanList);

		String currentUser = this.getPrincipal();
		String recipeUser = null;
		MemberBean memberBean2 = recipeBean.getMemberbean();
		System.out.println("recipe.getMemberbean() -> " + recipeBean.getMemberbean());
		recipeUser = memberBean2.getUsername();

		redirectAttribute.addFlashAttribute("pageSubject", "查詢完整食譜");
		redirectAttribute.addFlashAttribute("recipe", recipeBean);
		redirectAttribute.addFlashAttribute("recipeIngredients", recipeIngredients);
		redirectAttribute.addFlashAttribute("recipeUnitBean", recipeUnitBean);
		redirectAttribute.addFlashAttribute("currentUser", currentUser);
		redirectAttribute.addFlashAttribute("recipeUser", recipeUser);
		redirectAttribute.addFlashAttribute("memberBean", memberBean2);
		return "redirect:/recipe/recipeSuccessPage";
	}

	@RequestMapping(value = "/recipe/recipeSuccessPage")
	public String successPage() {
		return "recipe/recipeSuccessPage";
	}

	@RequestMapping("/recipe/recipeIndex")
	public String recipeHome(Model model) {
		// 這是食譜首頁
//		System.out.println("食譜首頁");
		String userName = getPrincipal();
//		System.out.println("userName = " + userName);
		@SuppressWarnings("unused")
		MemberBean memberBean = null;
		memberBean = memberService.selectByUsername(userName);
//		System.out.println("memberBean = " + memberBean);
//		return "recipe/recipeIndex";
		return "index2";
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