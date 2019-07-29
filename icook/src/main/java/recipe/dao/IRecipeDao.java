package recipe.dao;

import java.util.List;

import recipe.model.RecipeBean;

public interface IRecipeDao {
	void insertRecipe(RecipeBean recipeBean);// 新增一筆資料

	void updateRecipe(RecipeBean recipeBeanNew);// 修改一筆資料

	List<RecipeBean> getAllRecipe();// 查詢所有資料

	void deleteRecipe(RecipeBean recipeBean);// 刪除一筆資料

	RecipeBean getRecipeById(Integer pk_recipe_id);// 查詢單筆資料
	
	List<RecipeBean> searchRecipe(String recipe_name);// 查詢搜尋資料
	
	void deleteRecipeById(Integer id);//用id刪除資料

	List<RecipeBean> searchRecipeByMemberId(Integer member_id);//幫組長寫，用會員id查詢食譜
}