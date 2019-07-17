package com.web.icook.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.icook.dao.ProductDao;
import com.web.icook.exception.ProductNotFoundException;
import com.web.icook.model.CategoriesBean;
import com.web.icook.model.CategoryBean;
import com.web.icook.model.CollectiontBean;
import com.web.icook.model.MemberBean;
import com.web.icook.model.ProductBean;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CategoriesBean> getOneCategory(String categoriesName) {
		System.out.println("=============getOneCategory DAO=======================");
		List<CategoriesBean> list = new ArrayList<>();
		String hql = "FROM CategoriesBean as cb where cb.name= :name order by id";
		Session session = null;
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("name", categoriesName).getResultList();
		System.out.println("list :"+list);
		for(CategoriesBean bb :list) {
			System.out.println(bb.getName());
		}
		return list;
	}

	
	
	//================================================================================================================
	//================================================================================================================

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> SelectByCategoriesAndDescription(String remark, String name, 
			String description,int page) {
		System.out.println("=============SelectByCategoriesAndDescription DAO=======================");
		String hql1 = "FROM ProductBean p where  p.categoriesbean.categorybean.name= :name "
				+ "AND p.name LIKE :description  AND p.status=1 order by id "; //有 Category
		String hql2 = "FROM ProductBean p where p.categoriesbean.name= :name "
				+ "AND p.name LIKE :description AND p.status=1 order by id"; // 有Category Categories
		String hql3="FROM ProductBean p where p.status=1";  //都沒有
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		int pageSize=18;
		int firstResult=(page-1)*pageSize;
		session = factory.getCurrentSession();
		System.out.println("name :"+name);
		if(name.trim().equals("請選擇"))
			name=null;
		if(remark.trim().equals("請選擇")) {
			remark=null;}
		System.out.println("name :"+name);
		 if (name!=null && name.length()!=0  &&remark!=null &&remark.length()!=0 ) {
			System.out.println("hql2");
			System.out.println(hql2);
			Query query=session.createQuery(hql2).setParameter("name", name).
					setParameter("description", "%" + description + "%");
			query.setFirstResult(firstResult);
			query.setMaxResults(pageSize);
			list=query.list();
		} else if(remark!=null &&remark.length()!=0 ) {
			System.out.println("hql1");
			System.out.println(hql1);
			System.out.println("remark: "+remark);
//			list = session.createQuery(hql1).setParameter("name", remark)
//					.setParameter("description", "%" + description + "%").getResultList();
			Query query=session.createQuery(hql1).setParameter("name", remark).
					setParameter("description", "%" + description + "%");
			query.setFirstResult(firstResult);
			query.setMaxResults(pageSize);
			list=query.list();
		}else {
			System.out.println("hql3");
			System.out.println("firstResult :"+firstResult+"，pageMIN :"+pageSize);
			Query query=session.createQuery(hql3);
			query.setFirstResult(firstResult);
			query.setMaxResults(pageSize);
			list=query.list();
			
			
		}
		 int count=0;
		System.out.println("list :" + list);
		for (ProductBean bb : list) {
			count++;
			System.out.println("id :" + bb.getProduct_id() );
		}
//		bb.setRemark(bb.getCategoriesbean().getName());
		return list;
	}
	
	

	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> SelectByCategoriesAndDescriptionForPage(String remark, String name, String description) {
		
		System.out.println("=============ForPage DAO=======================");
		String hql1 = "FROM ProductBean p where  p.categoriesbean.categorybean.name= :name "
				+ "AND p.description LIKE :description  AND p.status=1 order by id "; //有 Category
		String hql2 = "FROM ProductBean p where p.categoriesbean.name= :name "
				+ "AND p.description LIKE :description AND p.status=1 order by id"; // 有Category Categories
		String hql3="FROM ProductBean p where p.status=1";  //都沒有
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		if(name.trim().equals("請選擇"))
			name=null;
		if(remark.trim().equals("請選擇")) {
			remark=null;}
		
		 if (name!=null && name.length()!=0 ) {
			System.out.println("ForPage hql2 ");
			System.out.println(hql2);
			list = session.createQuery(hql2).setParameter("name", name)
					.setParameter("description", "%" + description + "%").getResultList();
		} else if(remark!=null &&remark.length()!=0 ) {
			System.out.println("ForPage hql1");
			System.out.println(hql1);
			list = session.createQuery(hql1).setParameter("name", remark)
					.setParameter("description", "%" + description + "%").getResultList();
		}else {
			System.out.println("ForPage hql3");
			list = session.createQuery(hql3).getResultList();
			
		}
		System.out.println("list :" + list);
		int count=0;
		System.out.println("PageCount :"+count);
//		for (ProductBean bb : list) {
//			System.out.println("id :" + bb.getProduct_id() );
//			count++;
//		}
	   System.out.println("PageCount :"+count);
	   return list;
	}
	
	
	

	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> SelectByCategoriesAndDescription(String remark, String name, String description) {
		System.out.println("=============SelectByCategoriesAndDescription DAO=======================");
		String hql1 = "FROM ProductBean p where  p.categoriesbean.categorybean.name= :name "
				+ "AND p.description LIKE :description  AND p.status=1 order by id "; //有 Category
		String hql2 = "FROM ProductBean p where p.categoriesbean.name= :name "
				+ "AND p.description LIKE :description AND p.status=1 order by id"; // 有Category Categories
		String hql3="FROM ProductBean p where p.status=1";  //都沒有
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		if(name.trim().equals("請選擇"))
			name=null;
		if(remark.trim().equals("請選擇")) {
			remark=null;}
		
		 if (name!=null && name.length()!=0  &&remark!=null &&remark.length()!=0 ) {
			System.out.println("hql2");
			System.out.println(hql2);
			list = session.createQuery(hql2).setParameter("name", name)
					.setParameter("description", "%" + description + "%").getResultList();
		} else if(remark!=null &&remark.length()!=0 ) {
			System.out.println("hql1");
			System.out.println(hql1);
			list = session.createQuery(hql1).setParameter("name", remark)
					.setParameter("description", "%" + description + "%").getResultList();
		}else {
			System.out.println("hql3");
			list = session.createQuery(hql3).getResultList();
			int count=0;
			for(ProductBean bb :list) {
				count++;
			}
			Query query=session.createQuery(hql3);
			query.setFirstResult(0);
			query.setMaxResults(10);
			list=query.list();
			
			
		}
		System.out.println("list :" + list);
//		for (ProductBean bb : list) {
//			System.out.println("id :" + bb.getProduct_id() );
//		}
//		bb.setRemark(bb.getCategoriesbean().getName());
		return list;
	}


//	@SuppressWarnings("unchecked")
//	@Override
//	public List<ProductBean> gteAllProductByCategories(String name) {
//		System.out.println("=============getAll Start=======================");
//		String hql = "FROM ProductBean p where p.categoriesbean.name= :name order by id";
//		Session session = null;
//		List<ProductBean> list = new ArrayList<>();
//		session = factory.getCurrentSession();
//		
//		Query query=session.createQuery(hql).setParameter("name", name);
////		query.setFirstResult(firstResult);
////		query.setMaxResults(pageSize);
//		list=query.list();
////		System.out.println("=============getAll Finish=======================");
//		return list;
//	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CategoriesBean> getAllCategories(String name) {
//		System.out.println("==========getAllCategories Start============");
		String hql = "FROM CategoriesBean as cb where cb.categorybean.name= :name order by id";
		Session session = null;
		session = factory.getCurrentSession();
		List<CategoriesBean> list = new ArrayList<CategoriesBean>();
		list = session.createQuery(hql).setParameter("name", name).getResultList();
//		for(CategoriesBean bb :list) {
//			System.out.println(bb.getName());
//		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CategoryBean> getAllCategory() {
		System.out.println("==========GetAllCategory============");
		String hql = "FROM CategoryBean order by id";
		Session session = null;
		List<CategoryBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		for (CategoryBean bb : list) {
			System.out.println(bb.getName());
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean getCollectionById(int productId, int memberId) {
		boolean bol = true;
		System.out.println("========getCollectionById  DAO Start==================");
		Session session = factory.getCurrentSession();
		List<CollectiontBean> list = new ArrayList<>();
		String hql = "FROM CollectiontBean as cb where cb.productBean.product_id= :product_id"
				+ " AND cb.memberBean.member_id=:member_id ";
		list = session.createQuery(hql).setParameter("product_id", productId).setParameter("member_id", memberId)
				.setMaxResults(1).getResultList();
		System.out.println("List :" + list);
		if (list != null && list.size() != 0)
			bol = false;
		System.out.println("========getCollectionById  DAO  Finish==================");

		return bol;
	}

	@Override
	public ProductBean getProductById(int productId) {
		Session session = factory.getCurrentSession();
		ProductBean bb = session.get(ProductBean.class, productId);
//		ProductNotFoundException obj =new ProductNotFoundException("Product no  "+productId +"not found",productId);
//      建議:() 丟出例外避免在除錯的時候永遠都錯在new物件上，所以要丟的時候再new
		if (bb == null)
//            throw  obj; 
			throw new ProductNotFoundException("Product no  " + productId + "not found", productId);
		// 自訂例外 丟到ProductNotFoundException
		return bb;
	}

	@Override
	public void addtoCollection(int productId, int memberId) {
		System.out.println("=========================addtoCollection    Start==============================");

		Session session = factory.getCurrentSession();
		java.sql.Date date = new java.sql.Date(new Date().getTime());
		ProductBean bb = session.get(ProductBean.class, productId);
		MemberBean membean = session.get(MemberBean.class, memberId);
		System.out.println("porductBean :" + productId + " : " + bb);
		System.out.println("memberBean  :" + memberId + " : " + membean);
		CollectiontBean bean = new CollectiontBean();
		boolean bol = getCollectionById(productId, memberId);
		System.out.println("Nowdate :" + date);
		System.out.println("bol :" + bol);
//		if (bol) {
//			throw new ProductNotFoundException("Product no  " + productId + "not found", productId);
//			}
		if (bol != false) {
			bean.setProductBean(bb);
			bean.setCollect(date);
			bean.setMemberBean(membean);
			session.save(bean);
			System.out.println("Bean saved");
		} else {
			System.out.println("Product is existed");
		}
		System.out.println("=========================addtoCollection   Finish==============================");
	}

	@Override
	public void updateProduct(ProductBean product, String productId) {
		Session session = factory.getCurrentSession();
		product.setProduct_id(Integer.valueOf(productId));
		session.update(product);

	}

	@Override
	public void addProduct(ProductBean product) {
		Session session = factory.getCurrentSession();
		session.save(product);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllProducts() {
//		System.out.println("=============getAll Start=======================");
		String hql = "FROM ProductBean";
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
//		System.out.println("=============getAll Finish=======================");
		return list;
	}



}
