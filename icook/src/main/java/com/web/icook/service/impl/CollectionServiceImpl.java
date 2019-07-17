package com.web.icook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.icook.dao.CollectionDao;
import com.web.icook.model.CollectiontBean;
import com.web.icook.service.CollectionService;

@Service
@Transactional
public class CollectionServiceImpl implements CollectionService {
    @Autowired
	CollectionDao dao;
    
    
    
    
    //================================================================================================================
    //================================================================================================================
   

    @Override
    public void deleteCollection(int CollectionId) {
    	dao.deleteCollection(CollectionId);
    }

    @Override
    public List<CollectiontBean> getAllCollections() {
    	return dao.getAllCollections();
    }
    @Override
    public CollectiontBean getCollectionById(int collectionId) {
    	System.out.println("Service :"+ collectionId);
    	return dao.getCollectionById(collectionId);
    }

   }