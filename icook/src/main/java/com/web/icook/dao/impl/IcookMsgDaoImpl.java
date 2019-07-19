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
//TODO HQL指令

import forum.model.ForumMainBean;

@Repository
public class IcookMsgDaoImpl implements IcookMsgDao {
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MsgBoardBean> getAllMsgBoards( Integer article_num) {
//		value="SELECT new com.demo.test.Entity.ViewInfo(u,a)FROM "
//		        + " UserInfo u, com.demo.test.Entity.Address a WHERE u.addressId = a.id) ")
//		String hql = "from MsgBoardBean mb, ArticleBean ab where mb.artuclenum_in_msg = :article_num";
		System.out.println("List<MsgBoardBean> getAllMsgBoards"+article_num);
//		String hql = "FROM MsgBoardBean"; 
		String hql = "from MsgBoardBean as mb where mb.artuclenum_in_msg = "+article_num;
		Session session = null;
		session = factory.getCurrentSession();

		List<MsgBoardBean> list = new ArrayList<>();
		
//		System.out.println("art.getarticle_num1()="+article_num1);
//		list  = session.createQuery(hql).setParameter("artuclenum_in_msg",4).getResultList();
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
