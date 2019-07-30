package recipe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recipe.dao.IRecipeIngredientsDao;
import recipe.model.RecipeIngredientsBean;
import recipe.service.IRecipeIngredientsService;

@Transactional
@Service
public class RecipeIngredientsServiceImpl implements IRecipeIngredientsService {
	private IRecipeIngredientsDao recipeIngredientsDao = null;

	@Autowired
	public RecipeIngredientsServiceImpl(IRecipeIngredientsDao recipeIngredientsDao) {
		this.recipeIngredientsDao = recipeIngredientsDao;
	}

	@Override
	public List<RecipeIngredientsBean> getRecipeIngredientsByFk(Integer fk_recipe_id) {
		return recipeIngredientsDao.getRecipeIngredientsByFk(fk_recipe_id);
	}

	@Override
	public void deleteRecipeIngredientsByFk(Integer fk) {
		recipeIngredientsDao.deleteRecipeIngredientsByFk(fk);
	}

	@Override
	public void insertRecipeIngredients(RecipeIngredientsBean recipeIngredientsBean) {
		recipeIngredientsDao.insertRecipeIngredients(recipeIngredientsBean);
	}
}
