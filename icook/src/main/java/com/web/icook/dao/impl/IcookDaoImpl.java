package com.web.icook.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.icook.dao.IcookDao;
import com.web.icook.model.ArticleBean;

@Repository
public class IcookDaoImpl implements IcookDao {
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> getAllArticles() {
		String hql = "FROM ArticleBean";
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
		oldBean.setArticle_author(articlebean.getArticle_author());
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

}
