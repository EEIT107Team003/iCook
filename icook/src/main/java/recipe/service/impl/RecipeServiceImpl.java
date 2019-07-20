package recipe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recipe.dao.IRecipeDao;
import recipe.model.RecipeBean;
import recipe.service.IRecipeService;

@Transactional
@Service
public class RecipeServiceImpl implements IRecipeService {
	private IRecipeDao recipeDao = null;

	@Autowired
	public RecipeServiceImpl(IRecipeDao recipeDao) {
		// 在建構子注入DAO物件
		this.recipeDao = recipeDao;
	}

	@Override
	public void insertRecipe(RecipeBean recipeBean) {
		recipeDao.insertRecipe(recipeBean);
	}

	@Override
	public void updateRecipe(RecipeBean recipeBeanNew) {
		recipeDao.updateRecipe(recipeBeanNew);
	}

	@Override
	public List<RecipeBean> getAllRecipe() {
		return recipeDao.getAllRecipe();
	}

	@Override
	public void deleteRecipe(RecipeBean recipeBean) {
		recipeDao.deleteRecipe(recipeBean);
	}

	@Override
	public RecipeBean getRecipeById(Integer pk_recipe_id) {
		return recipeDao.getRecipeById(pk_recipe_id);
	}

	@Override
	public List<RecipeBean> searchRecipe(String recipe_name) {
		return recipeDao.searchRecipe(recipe_name);
	}
}