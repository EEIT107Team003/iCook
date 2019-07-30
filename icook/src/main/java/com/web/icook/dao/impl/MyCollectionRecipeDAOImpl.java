package com.web.icook.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.icook.dao.MyCollectionRecipeDAO;
import com.web.icook.model.MyCollectRecipeBean;
import com.web.icook.model.MyTrackBean;

@Repository
public class MyCollectionRecipeDAOImpl implements MyCollectionRecipeDAO{

	@Autowired
	SessionFactory factory;

	// 收藏食譜
	@Override
	public void collectByRecipeId(MyCollectRecipeBean bean) {
		Session session = factory.getCurrentSession();
		session.save(bean);
	}

	// 查詢 我收藏的食譜
	@Override
	public List<MyCollectRecipeBean> selectCollectRecipeById(Integer cr_member_id) {
		String hql = "from MyCollectRecipeBean where cr_memberBean.member_id=:cr_member_id order by collectTime desc";
		List<MyCollectRecipeBean> list = new ArrayList<MyCollectRecipeBean>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("cr_member_id", cr_member_id).getResultList();

		return list;
	}

	// 查詢 這篇食譜被誰收藏
	@Override
	public List<MyCollectRecipeBean> selectCollectedRecipeById(Integer cr_recipe_id) {
		String hql = "from MyCollectRecipeBean where cr_recipeBean.pk_recipe_id=:cr_recipe_id";
		List<MyCollectRecipeBean> list = new ArrayList<MyCollectRecipeBean>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("cr_recipe_id", cr_recipe_id).getResultList();

		return list;
	}

	// 查詢特定收藏食譜
	@SuppressWarnings("unchecked")
	@Override
	public List<MyCollectRecipeBean> selectOneCollectRecipeById(Integer cr_member_id, Integer cr_recipe_id) {
		String hql = "from MyCollectRecipeBean where (cr_memberBean.member_id=:cr_member_id and cr_recipeBean.pk_recipe_id=:cr_recipe_id)";
		List<MyCollectRecipeBean> list = new ArrayList<MyCollectRecipeBean>();
		Session session = factory.getCurrentSession();	
		list = session.createQuery(hql).setParameter("cr_member_id",cr_member_id).setParameter("cr_recipe_id", cr_recipe_id).getResultList();

		return list;
	}

	// 取消收藏食譜
	@Override
	public Integer CollectRecipeCancel(Integer cr_member_id, Integer cr_recipe_id) {
		String hql="delete MyCollectRecipeBean where (cr_memberBean.member_id=:cr_member_id and cr_recipeBean.pk_recipe_id=:cr_recipe_id)";
		Session session = factory.getCurrentSession();
		int h=session.createQuery(hql).setParameter("cr_member_id", cr_member_id).setParameter("cr_recipe_id", cr_recipe_id).executeUpdate();
		return h;
	}
}
