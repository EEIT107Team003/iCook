package recipe.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.dao.IRecipeIngredientsDao;
//import recipe.model.RecipeBean;
import recipe.model.RecipeIngredientsBean;

@Repository
public class RecipeIngredientsDaoImpl implements IRecipeIngredientsDao {
	private SessionFactory sessionFactory = null;

	@Autowired
	public RecipeIngredientsDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RecipeIngredientsBean> getRecipeIngredientsByFk(Integer fk) {
		Session session = sessionFactory.getCurrentSession();
		List<RecipeIngredientsBean> ingredientsBeanList = new ArrayList<RecipeIngredientsBean>();
		if (fk != null) {
			String hql = "FROM RecipeIngredientsBean WHERE fk_recipe_id = :fk";
			ingredientsBeanList = session.createQuery(hql).setParameter("fk", fk).getResultList();
		}
		return ingredientsBeanList;
	}

//	@Override
//	public void deleteRecipeIngredientsByFk(Integer fk) {
//		// 刪除多筆資料
//		Session session = sessionFactory.getCurrentSession();
//		if (fk != null) {
//			String hql = "DELETE FROM RecipeIngredientsBean WHERE fk_recipe_id = :fk";
//			session.createQuery(hql).setParameter("fk", fk).executeUpdate();
//		}
//	}

	@Override
	public void insertRecipeIngredients(RecipeIngredientsBean recipeIngredientsBean) {
		Session session = sessionFactory.getCurrentSession();
		if (recipeIngredientsBean != null) {
			session.save(recipeIngredientsBean);
		}
	}
}