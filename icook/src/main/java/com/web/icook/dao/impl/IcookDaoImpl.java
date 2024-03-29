package com.web.icook.dao.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.icook.controller.MemberController;
import com.web.icook.controller.securityController;
import com.web.icook.dao.IcookDao;
import com.web.icook.model.ArticleBean;
import com.web.icook.model.MemberBean;

import org.hibernate.query.Query;

@Repository
public class IcookDaoImpl implements IcookDao {
	@Autowired
	SessionFactory factory;
//	@Autowired
//	MemberBean mb ;
	@Autowired
	securityController c;
	@Autowired
	MemberController mc;

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> getAllArticles() {

		String hql = "from ArticleBean as ab where ab.article_status = 1 order by ab.article_date desc";
		
		if (c.getPrincipal() != "anonymousUser") {

			MemberBean mb = new MemberBean();
			mb = mc.getMemberBean(c.getPrincipal());
			if (mb.getRole().equals("ROLE_ADMIN")) {
				hql = "FROM ArticleBean as ab order by ab.article_date desc";
				System.out.println("mb.getRole()=="+mb.getRole());
				Session session = null;
				List<ArticleBean> list = new ArrayList<>();
				session = factory.getCurrentSession();
				list = session.createQuery(hql).getResultList();

				return list;
			}else {
				Session session = null;
				List<ArticleBean> list = new ArrayList<>();
				session = factory.getCurrentSession();
				list = session.createQuery(hql).getResultList();

				return list;
			}
		}

		// 管理員權限
//		if (mb.getRole().equals("ROLE_ADMIN")) {
//			hql = "FROM ArticleBean";
//		}
//		System.out.println("mb.getRole()=="+mb.getRole());

		Session session = null;
		List<ArticleBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();

		return list;
	}

	@Override
	public void insertIcookArticle(ArticleBean articlebean) {
//		System.out.println("bean=" + articlebean.toString());
		Session session = factory.getCurrentSession();
		articlebean.setArticle_date(new Timestamp(System.currentTimeMillis()));
		session.save(articlebean);

	}

	@Override
	public void updateIcookArticle(ArticleBean articlebean) {

		ArticleBean oldBean = this.getIcookArticle(articlebean.getArticle_num());
		oldBean.setArticle_member(articlebean.getArticle_member());
		oldBean.setArticle_catergoary(articlebean.getArticle_catergoary());
		oldBean.setArticle_content(articlebean.getArticle_content());
//		oldBean.setArticle_date(new Timestamp(System.currentTimeMillis()));
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
		String hql = "from ArticleBean as ab where ab.article_title like :article_title order by ab.article_date desc";
		Session session = factory.getCurrentSession();
		List<ArticleBean> abList = new ArrayList<>();
		abList = session.createQuery(hql).setParameter("article_title", "%" + article_title + "%").getResultList();
		return abList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> getThreeArticles() {
		String hql = "from ArticleBean as ab where ab.article_status = 1 order by ab.article_date desc";

		Session session = null;
		List<ArticleBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setMaxResults(3).getResultList();

		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> getByArticle_Catergory(String article_catergoary) {
		String hql = "from ArticleBean as ab where ab.article_catergoary = :article_catergoary order by ab.article_date desc";
		Session session = factory.getCurrentSession();
		List<ArticleBean> abList = new ArrayList<>();
		abList = session.createQuery(hql).setParameter("article_catergoary", article_catergoary).getResultList();
		return abList;
	}

	@Override
	public List<ArticleBean> SelectByPages(int page) {
		String hql = "from ArticleBean as ab where ab.article_status = 1 order by ab.article_date desc";

		Session session = null;
		List<ArticleBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		int pageSize = 9;
		int firstResult = (page - 1) * pageSize;
		Query query = session.createQuery(hql);
		query.setFetchSize(firstResult);
		query.setMaxResults(pageSize);

		list = query.list();
		return list;
	}

}
