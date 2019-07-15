package recipe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recipe.dao.IRecipeDao;
import recipe.model.RecipeBean;
import recipe.service.IProductService;

@Transactional
@Service
public class ProductServiceImpl implements IProductService {
	private IRecipeDao dao = null;

	@Autowired
	public ProductServiceImpl(IRecipeDao dao) {
		// 在建構子注入DAO物件
		this.dao = dao;
	}

	@Override
	public void insertRecipe(RecipeBean recipeBean) {
		dao.insertRecipe(recipeBean);
	}

	@Override
	public void updateRecipe(RecipeBean recipeBeanNew) {
		dao.updateRecipe(recipeBeanNew);
	}

	@Override
	public List<RecipeBean> getAllRecipe() {
		return dao.getAllRecipe();
	}

	@Override
	public void deleteRecipe(RecipeBean recipeBean) {
		dao.deleteRecipe(recipeBean);
	}

	@Override
	public RecipeBean getRecipeById(Integer pk_recipe_id) {
		return dao.getRecipeById(pk_recipe_id);
	}
}