package com.web.icook.service;

import java.util.List;

import com.web.icook.model.ArticleBean;

public interface IcookService {
	List<ArticleBean> getAllArticles();

	List<ArticleBean> getThreeArticles();

	public void insertIcookArticle(ArticleBean articlebean);// 新增一筆資料

	public void updateIcookArticle(ArticleBean articlebean);// 修改一筆資料

	public void deleteIcookArticle(ArticleBean articlebean);// 刪除一筆資料

	public ArticleBean getIcookArticle(int article_num);// 查詢單筆資料

	List<ArticleBean> getByArticle_Title(String article_title);// 依標題搜尋

}
