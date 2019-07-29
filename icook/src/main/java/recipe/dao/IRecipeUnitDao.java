package recipe.dao;

import java.sql.Blob;
import java.util.List;

import recipe.model.RecipeUnitBean;

public interface IRecipeUnitDao {
	List<RecipeUnitBean> getRecipeUnitBeanByFk(Integer fk_recipe_id);// 查詢資料

	void deleteRecipeUnitByFk(Integer fk);// 刪除資料

	void insertRecipeUnit(RecipeUnitBean recipeUnitBean);// 新增資料

	List<Blob> getRecipeUnitImageByFk(Integer fk);//先把舊資料的影像檔案撈出來

	RecipeUnitBean getRecipeUnitByFkAndStepNo(Integer fk, Integer stepNo);//使用fk鍵跟食譜編號把單一一筆紀錄搜尋出來。
}
