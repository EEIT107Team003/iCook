package com.web.icook.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.icook.dao.IcookMsgDao;
import com.web.icook.model.ArticleBean;
import com.web.icook.model.MsgBoardBean;

@Repository
public class IcookMsgDaoImpl implements IcookMsgDao {
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<MsgBoardBean> getAllMsgBoards() {
		String hql = "FROM MsgBoardBean";
		Session session = null;
		List<MsgBoardBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();

		return list;
	}

	@Override
	public void insertIcookMsgBoard(MsgBoardBean msgBoardbean) {
		Session session = factory.getCurrentSession();
		session.save(msgBoardbean);

	}

	@Override
	public void updateIcookMsgBoard(MsgBoardBean msgBoardbean) {
		MsgBoardBean oldBean = this.getIcookMsgBoard(msgBoardbean.getMsgboard_num());
		oldBean.setMsgboard_status(msgBoardbean.getMsgboard_status());
		oldBean.setMsgboard_content(msgBoardbean.getMsgboard_content());

	}

	@Override
	public void deleteIcookMsgBoard(MsgBoardBean msgBoardbean) {
		Session session = factory.getCurrentSession();
		session.delete(msgBoardbean);

	}

	@Override
	public MsgBoardBean getIcookMsgBoard(int msgboard_num) {
		Session session = factory.getCurrentSession();
		MsgBoardBean bean = session.get(MsgBoardBean.class, msgboard_num);

		return bean;
	}

}
