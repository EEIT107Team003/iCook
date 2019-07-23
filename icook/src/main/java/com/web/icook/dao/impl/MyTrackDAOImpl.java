package com.web.icook.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import com.web.icook.dao.MyTrackDAO;
import com.web.icook.model.MyTrackBean;

@Repository
public class MyTrackDAOImpl implements MyTrackDAO {
	@Autowired
	SessionFactory factory;

	// 追蹤會員
	@Override
	public void trackById(MyTrackBean bean) {
		Session session = factory.getCurrentSession();
		session.save(bean);
	}

	// 查詢 我追蹤了誰
	@Override
	public List<MyTrackBean> selectTrackerById(int member_Id) {
		String hql = "from MyTrackBean where member_Id=:member_Id order by trackTime desc";
		List<MyTrackBean> list = new ArrayList<MyTrackBean>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("member_Id", member_Id).getResultList();

		return list;
	}

	// 查詢 我被誰追蹤
	@Override
	public List<MyTrackBean> selectTrackedById(int tracked_Id) {
		String hql = "from MyTrackBean where tracked_Id=:tracked_Id";
		List<MyTrackBean> list = new ArrayList<MyTrackBean>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("tracked_Id", tracked_Id).getResultList();

		return list;
	}

	// 查詢特定追蹤者
	@Override
	public List<MyTrackBean> selectOneTrackerById(int member_Id, int tracked_id) {
		String hql = "from MyTrackBean where (member_Id=:member_Id and tracked_id=:tracked_id)";
		List<MyTrackBean> list = new ArrayList<MyTrackBean>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("member_Id", member_Id).setParameter("tracked_id", tracked_id)
				.getResultList();

		return list;
	}

	// 取消追蹤好友
	@Override
	public Integer trackCancel(int member_id, int tracked_id) {
		String hql="delete MyTrackBean where member_Id=:member_Id and tracked_id=:tracked_id";
		Session session = factory.getCurrentSession();
		int h=session.createQuery(hql).setParameter("member_Id", member_id).setParameter("tracked_id", tracked_id).executeUpdate();
		return h;
	}
}
