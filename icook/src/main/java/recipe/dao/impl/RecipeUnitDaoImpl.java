package recipe.dao.impl;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.dao.IRecipeUnitDao;
import recipe.model.RecipeUnitBean;

@Repository
public class RecipeUnitDaoImpl implements IRecipeUnitDao {
	private SessionFactory sessionFactory = null;

	@Autowired
	public RecipeUnitDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Blob> getRecipeUnitImageByFk(Integer fk) {
		Session session = sessionFactory.getCurrentSession();
		List<Blob> image = new ArrayList<Blob>();
		if (fk != null) {
			// unit_image
			String hql = "SELECT unit_image FROM RecipeUnitBean WHERE fk_recipe_id = :fk";
			image = session.createQuery(hql).setParameter("fk", fk).getResultList();
		}
		return image;
	}

	// stepNo
	@Override
	public RecipeUnitBean getRecipeUnitByFkAndStepNo(Integer fk, Integer stepNo) {
		Session session = sessionFactory.getCurrentSession();
		RecipeUnitBean recipeUnit = null;
		if (fk != null && stepNo != null) {
			String hql = "FROM RecipeUnitBean WHERE (fk_recipe_id = :fk AND stepNo = :stepNo)";
			recipeUnit = (RecipeUnitBean) session.createQuery(hql).setParameter("fk", fk).setParameter("stepNo", stepNo)
					.getSingleResult();
		}
		return recipeUnit;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RecipeUnitBean> getRecipeUnitBeanByFk(Integer fk) {
		Session session = sessionFactory.getCurrentSession();
		List<RecipeUnitBean> unitBeanList = new ArrayList<RecipeUnitBean>();
		if (fk != null) {
			String hql = "FROM RecipeUnitBean WHERE fk_recipe_id = :fk";
			unitBeanList = session.createQuery(hql).setParameter("fk", fk).getResultList();
		}
		return unitBeanList;
	}

	@Override
	public void deleteRecipeUnitByFk(Integer fk) {
		// 刪除多筆資料
		Session session = sessionFactory.getCurrentSession();
		if (fk != null) {
			String hql = "DELETE FROM RecipeUnitBean WHERE fk_recipe_id = :fk";
			session.createQuery(hql).setParameter("fk", fk).executeUpdate();
		}
	}

	@Override
	public void insertRecipeUnit(RecipeUnitBean recipeUnitBean) {
		Session session = sessionFactory.getCurrentSession();
		if (recipeUnitBean != null) {
			session.save(recipeUnitBean);
		}
	}
}