package recipe.dao;

import java.util.List;

import recipe.model.RecipeIngredientsBean;

public interface IRecipeIngredientsDao {
	List<RecipeIngredientsBean> getRecipeIngredientsByFk(Integer fk_recipe_id);// 查詢資料

//	void deleteRecipeIngredientsByFk(Integer fk);// 刪除資料

	void insertRecipeIngredients(RecipeIngredientsBean recipeIngredientsBean);//新增一筆資料
}