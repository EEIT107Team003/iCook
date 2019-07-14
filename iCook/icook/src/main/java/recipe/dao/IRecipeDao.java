package recipe.dao;

import java.util.List;

import recipe.model.RecipeBean;

public interface IRecipeDao {
	public void insertRecipe(RecipeBean recipeBean);// 新增一筆資料

	public void updateRecipe(RecipeBean recipeBeanNew);// 修改一筆資料

	public List<RecipeBean> getAllRecipe();// 查詢所有資料

	public void deleteRecipe(RecipeBean recipeBean);// 刪除一筆資料

	public RecipeBean getRecipeById(Integer pk_recipe_id);// 查詢單筆資料
}