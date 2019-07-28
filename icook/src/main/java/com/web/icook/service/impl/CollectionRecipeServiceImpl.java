package com.web.icook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.icook.dao.MyCollectionRecipeDAO;
import com.web.icook.model.MyCollectRecipeBean;
import com.web.icook.model.MyTrackBean;
import com.web.icook.service.CollectionRecipeService;

@Service
@Transactional
public class CollectionRecipeServiceImpl implements CollectionRecipeService {
	@Autowired
	MyCollectionRecipeDAO dao;

	// 收藏食譜
	@Override
	public void collectByRecipeId(MyCollectRecipeBean bean) {
		dao.collectByRecipeId(bean);
	}

	// 查詢 我收藏的食譜
	@Override
	public List<MyCollectRecipeBean> selectCollectRecipeById(int cr_member_id) {
		return dao.selectCollectedRecipeById(cr_member_id);
	}

	// 查詢 這篇食譜被誰收藏
	@Override
	public List<MyCollectRecipeBean> selectCollectedRecipeById(int cr_reciept_id) {
		return dao.selectCollectedRecipeById(cr_reciept_id);
	}

	// 查詢特定收藏食譜
	@Override
	public List<MyTrackBean> selectOneCollectRecipeById(int cr_member_id, int cr_reciept_id) {
		return dao.selectOneCollectRecipeById(cr_member_id, cr_reciept_id);
	}

	// 取消收藏食譜
	@Override
	public Integer CollectRecipeCancel(int cr_member_id, int cr_reciept_id) {
		return dao.CollectRecipeCancel(cr_member_id, cr_reciept_id);
	}

}
