package recipe.service.impl;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recipe.dao.IRecipeUnitDao;
import recipe.model.RecipeUnitBean;
import recipe.service.IRecipeUnitService;

@Transactional
@Service
public class RecipeUnitServiceImpl implements IRecipeUnitService {
	IRecipeUnitDao recipeUnitDao = null;

	@Autowired
	public RecipeUnitServiceImpl(IRecipeUnitDao recipeUnitDao) {
		this.recipeUnitDao = recipeUnitDao;
	}

	@Override
	public List<RecipeUnitBean> getRecipeUnitBeanByFk(Integer fk) {
		return recipeUnitDao.getRecipeUnitBeanByFk(fk);
	}

//	@Override
//	public void deleteRecipeUnitByFk(Integer fk) {
//		recipeUnitDao.deleteRecipeUnitByFk(fk);
//	}

	@Override
	public void insertRecipeUnit(RecipeUnitBean recipeUnitBean) {
		recipeUnitDao.insertRecipeUnit(recipeUnitBean);
	}

	@Override
	public List<Blob> getRecipeUnitImageByFk(Integer fk) {
		return recipeUnitDao.getRecipeUnitImageByFk(fk);
	}

	@Override
	public RecipeUnitBean getRecipeUnitByFkAndStepNo(Integer fk, Integer stepNo) {
		return recipeUnitDao.getRecipeUnitByFkAndStepNo(fk, stepNo);
	}
}