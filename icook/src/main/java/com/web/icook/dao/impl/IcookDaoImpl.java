package com.web.icook.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.icook.controller.MemberController;
import com.web.icook.dao.IcookDao;
import com.web.icook.model.ArticleBean;
import com.web.icook.model.MemberBean;
import com.web.icook.service.MemberService;

import forum.model.ForumMainBean;

@Repository
public class IcookDaoImpl implements IcookDao {
	@Autowired
	SessionFactory factory;
	
	
	
	

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> getAllArticles() {

		String hql = "from ArticleBean as ab where ab.article_status = 1";
		// 管理員權限		
//		if (mb.getRole().equals("ROLE_ADMIN")) {
//			 hql = "FROM ArticleBean";
//		} 

		Session session = null;
		List<ArticleBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();

		return list;
	}

	@Override
	public void insertIcookArticle(ArticleBean articlebean) {
		System.out.println("bean=" + articlebean.toString());
		Session session = factory.getCurrentSession();
		session.save(articlebean);

	}

	@Override
	public void updateIcookArticle(ArticleBean articlebean) {

		ArticleBean oldBean = this.getIcookArticle(articlebean.getArticle_num());
		oldBean.setArticle_member(articlebean.getArticle_member());
		oldBean.setArticle_catergoary(articlebean.getArticle_catergoary());
		oldBean.setArticle_content(articlebean.getArticle_content());
		oldBean.setArticle_date(articlebean.getArticle_date());
		oldBean.setArticle_status(articlebean.getArticle_status());
		oldBean.setArticle_title(articlebean.getArticle_title());

		if (articlebean.getCoverImage() != null) {
			oldBean.setCoverImage(articlebean.getCoverImage());
			oldBean.setFileName(articlebean.getFileName());
		}

	}

	@Override
	public void deleteIcookArticle(ArticleBean articlebean) {
		Session session = factory.getCurrentSession();
		session.delete(articlebean);

	}

	@Override
	public ArticleBean getIcookArticle(int article_num) {
		Session session = factory.getCurrentSession();
		ArticleBean bean = session.get(ArticleBean.class, article_num);

		return bean;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> getByArticle_Title(String article_title) {
		String hql = "from ArticleBean as ab where ab.article_title like :article_title";
		Session session = factory.getCurrentSession();
		List<ArticleBean> abList = new ArrayList<>();
		abList = session.createQuery(hql).setParameter("article_title", "%" + article_title + "%").getResultList();
		return abList;
	}

}
