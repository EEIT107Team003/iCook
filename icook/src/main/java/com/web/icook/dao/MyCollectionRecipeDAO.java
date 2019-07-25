package com.web.icook.dao;

import java.util.List;

import com.web.icook.model.MyCollectRecipeBean;
import com.web.icook.model.MyTrackBean;

public interface MyCollectionRecipeDAO {
	// 收藏食譜
	void collectByRecipeId(MyCollectRecipeBean bean);

	// 查詢 我收藏的食譜
	List<MyCollectRecipeBean> selectCollectRecipeById(int cr_member_id);

	// 查詢 這篇食譜被誰收藏
	List<MyCollectRecipeBean> selectCollectedRecipeById(int cr_reciept_id);

	// 查詢特定收藏食譜
	List<MyTrackBean> selectOneCollectRecipeById(int cr_member_id, int cr_reciept_id);

	// 取消收藏食譜
	Integer CollectRecipeCancel(int cr_member_id, int cr_reciept_id);
}
