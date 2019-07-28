package recipe.dao.impl;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.dao.IRecipeDao;
import recipe.model.RecipeBean;
import recipe.model.RecipeIngredientsBean;
import recipe.model.RecipeUnitBean;

//@Repository 是 DAO類別專用註釋。
@Repository
public class RecipeDaoImpl implements IRecipeDao {
	private SessionFactory sessionFactory = null;

	@Autowired
	public RecipeDaoImpl(SessionFactory sessionFactory) {
		// 由建構子注入sessionFactory
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void insertRecipe(RecipeBean recipeBean) {
		// 新增一筆資料
		Session session = sessionFactory.getCurrentSession();
		if (recipeBean != null) {
			session.save(recipeBean);
		}
//		session.flush();
//		session.clear();
	}

	// TODO 依組長指示，移除掉修改功能。
//	@Override
//	public void updateRecipe(RecipeBean recipeBeanNew) {
//		// 修改一筆資料
////		session.flush();
////		session.clear();
//		System.out.println("public void updateRecipe(RecipeBean recipeBeanNew) { -> #1");
//		Session session = sessionFactory.getCurrentSession();
//		if (recipeBeanNew == null) {
//			System.out.println("error! recipeBeanNew can not be null.");
//			return;
//		}
//		if (recipeBeanNew.getPk_recipe_id() == null) {
//			System.out.println("error! recipeBeanNew pk_recipe_id can not be null.");
//			return;
//		}
//		RecipeBean recipeBeanOld = this.getRecipeById(recipeBeanNew.getPk_recipe_id());
//		if (recipeBeanNew.getRecipe_name() != null) {
//			recipeBeanOld.setRecipe_name(recipeBeanNew.getRecipe_name());// 食譜名稱
//		}
//		if (recipeBeanNew.getRecipe_quantity() != null) {
//			recipeBeanOld.setRecipe_quantity(recipeBeanNew.getRecipe_quantity());// 食譜份量
//		}
//		if (recipeBeanNew.getRecipe_image() != null) {
//			// 如果使用者有上傳圖片才執行更新程式。
//			recipeBeanOld.setRecipe_image(recipeBeanNew.getRecipe_image());// 食譜圖片
//		}
//		if (recipeBeanNew.getRecipe_summary() != null) {
//			recipeBeanOld.setRecipe_summary(recipeBeanNew.getRecipe_summary());// 食譜簡介
//		}
//		if (recipeBeanNew.getRecipe_time() != null) {
//			recipeBeanOld.setRecipe_time(recipeBeanNew.getRecipe_time());// 烹調時間
//		}
//		if (recipeBeanNew.getRecipe_note() != null) {
//			recipeBeanOld.setRecipe_note(recipeBeanNew.getRecipe_note());// 小撇步介紹
//		}
//		if (recipeBeanNew.getRecipe_date() != null) {
//			recipeBeanOld.setRecipe_date(recipeBeanNew.getRecipe_date());// 食譜時間日期
//		}
//		if (recipeBeanNew.getRecipe_display() != null) {
//			recipeBeanOld.setRecipe_display(recipeBeanNew.getRecipe_display());// 是否顯示
//		}
//		System.out.println("public void updateRecipe(RecipeBean recipeBeanNew) { -> #2");
//		session.update(recipeBeanOld);
//	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RecipeBean> getAllRecipe() {
		// 查詢所有資料
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM RecipeBean";
		List<RecipeBean> recipeBeanList = session.createQuery(hql).getResultList();
		System.out.println("#1 recipeBeanList -> " + recipeBeanList);
		return recipeBeanList;
	}

	@Override
	public RecipeBean getRecipeById(Integer pk_recipe_id) {
		// 查詢單筆資料
		Session session = sessionFactory.getCurrentSession();
		RecipeBean recipeBean = null;
		if (pk_recipe_id != null) {
			recipeBean = session.get(RecipeBean.class, pk_recipe_id);
		}
		return recipeBean;
	}

	// TODO 依組長指示，移除掉刪除功能。
//	@Override
//	public void deleteRecipe(RecipeBean recipeBean) {
//		// TODO 刪除資料
//		// 刪除一筆資料
//		Session session = sessionFactory.getCurrentSession();
//		if (recipeBean != null && recipeBean.getPk_recipe_id() != null) {
//			session.delete(recipeBean);
//		}
//	}

//	@Override
//	public void deleteRecipeById(Integer id) {
//		// 刪除一筆資料
//		Session session = sessionFactory.getCurrentSession();
//		RecipeBean bean = session.get(RecipeBean.class, id);
//		session.delete(bean);
//	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RecipeBean> searchRecipe(String recipe_name) {
		Session session = sessionFactory.getCurrentSession();
		List<RecipeBean> recipeBeanList = new ArrayList<RecipeBean>();
		if (recipe_name.trim().length() != 0 && recipe_name != null) {
			String hql = "FROM RecipeBean WHERE recipe_name LIKE :recipe_name";
			recipeBeanList = session.createQuery(hql).setParameter("recipe_name", "%" + recipe_name + "%")
					.getResultList();
		}
		System.out.println("#2 recipeBeanList -> " + recipeBeanList);
		return recipeBeanList;
	}
}