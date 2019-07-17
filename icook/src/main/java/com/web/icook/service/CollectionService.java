package com.web.icook.service;

import java.util.List;

import com.web.icook.model.CollectiontBean;
import com.web.icook.model.ProductBean;

public interface CollectionService {
	public CollectiontBean getCollectionById(int CollectionId);
	List<CollectiontBean>  getAllCollections();
	void deleteCollection(int CollectionId);

}
