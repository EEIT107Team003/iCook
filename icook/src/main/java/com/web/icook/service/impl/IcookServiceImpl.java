package com.web.icook.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.icook.dao.IcookDao;

import com.web.icook.model.ArticleBean;

import com.web.icook.service.IcookService;

@Service
public class IcookServiceImpl implements IcookService {
	@Autowired
	IcookDao dao;

	@Transactional
	@Override
	public List<ArticleBean> getAllArticles() {
		return dao.getAllArticles();

	}

	@Transactional
	@Override
	public void insertIcookArticle(ArticleBean articlebean) {
		dao.insertIcookArticle(articlebean);

	}

	@Transactional
	@Override
	public void updateIcookArticle(ArticleBean articlebean) {
		dao.updateIcookArticle(articlebean);

	}

	@Transactional
	@Override
	public void deleteIcookArticle(ArticleBean articlebean) {
		dao.deleteIcookArticle(articlebean);

	}

	@Transactional
	@Override
	public ArticleBean getIcookArticle(int article_num) {

		return dao.getIcookArticle(article_num);
	}

}
