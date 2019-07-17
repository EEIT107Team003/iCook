package com.web.icook.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.icook.dao.CollectionDao;
import com.web.icook.exception.ProductNotFoundException;
import com.web.icook.model.CollectiontBean;

@Repository
public class CollectionDaoImpl implements CollectionDao {
	@Autowired
	SessionFactory factory;


	
//================================================================================================================
//================================================================================================================
	
	
	@Override
	public void deleteCollection(int CollectionId) {
		System.out.println("================DAO==========================");
		Session session =factory.getCurrentSession();

		CollectiontBean bb=new CollectiontBean();
		bb.setId(CollectionId);
		session.delete(bb);
		System.out.println("================DAO==========================");
	}

	@Override
	public CollectiontBean getCollectionById(int collectionId) {
		Session session = factory.getCurrentSession();
		CollectiontBean bb = session.get(CollectiontBean.class, collectionId);
		System.out.println("DAO :"+bb +" ，"+ collectionId);
		if (bb == null)
			throw new ProductNotFoundException("Product no  " + collectionId + "not found", collectionId);
		return bb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CollectiontBean> getAllCollections() {
		String hql = "FROM CollectiontBean";
		Session session = null;
		List<CollectiontBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}



}
