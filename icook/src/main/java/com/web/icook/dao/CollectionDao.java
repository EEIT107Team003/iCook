package com.web.icook.dao;

import java.util.List;

import com.web.icook.model.CollectiontBean;
import com.web.icook.model.ProductBean;

public interface CollectionDao {
	List<CollectiontBean> getAllCollections();

	CollectiontBean getCollectionById(int CollectiontId);

	void deleteCollection(int CollectionId);
}
