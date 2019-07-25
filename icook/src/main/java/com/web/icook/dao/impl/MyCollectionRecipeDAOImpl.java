package com.web.icook.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.icook.dao.CollectionDao;
import com.web.icook.dao.MyCollectionRecipeDAO;
import com.web.icook.model.CollectiontBean;
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
	public List<MyCollectRecipeBean> selectCollectRecipeById(int cr_member_id) {
		String hql = "from MyCollectRecipeBean where cr_member_id=:cr_member_id order by collectTime desc";
		List<MyCollectRecipeBean> list = new ArrayList<MyCollectRecipeBean>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("cr_member_id", cr_member_id).getResultList();

		return list;
	}

	// 查詢 這篇食譜被誰收藏
	@Override
	public List<MyCollectRecipeBean> selectCollectedRecipeById(int cr_reciept_id) {
		String hql = "from MyCollectRecipeBean where cr_reciept_id=:cr_reciept_id";
		List<MyCollectRecipeBean> list = new ArrayList<MyCollectRecipeBean>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("cr_reciept_id", cr_reciept_id).getResultList();

		return list;
	}

	// 查詢特定收藏食譜
	@Override
	public List<MyTrackBean> selectOneCollectRecipeById(int cr_member_id, int cr_reciept_id) {
		String hql = "from MyCollectRecipeBean where (cr_member_id=:cr_member_id and cr_reciept_id=:cr_reciept_id)";
		List<MyTrackBean> list = new ArrayList<MyTrackBean>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("cr_member_id", cr_member_id).setParameter("cr_reciept_id", cr_reciept_id)
				.getResultList();

		return list;
	}

	// 取消收藏食譜
	@Override
	public Integer CollectRecipeCancel(int cr_member_id, int cr_reciept_id) {
		String hql="delete MyCollectRecipeBean where cr_member_id=:cr_member_id and cr_reciept_id=:cr_reciept_id";
		Session session = factory.getCurrentSession();
		int h=session.createQuery(hql).setParameter("cr_member_id", cr_member_id).setParameter("tracked_id", cr_reciept_id).executeUpdate();
		return h;
	}
}
