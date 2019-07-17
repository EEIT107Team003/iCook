package com.web.icook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.icook.dao.ProductDao;
import com.web.icook.model.CategoriesBean;
import com.web.icook.model.CategoryBean;
import com.web.icook.model.ProductBean;
import com.web.icook.service.ProductService;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
    @Autowired
	ProductDao dao;
    

	@Override
	public List<CategoriesBean> getOneCategory(String categoriesName) {
		return dao.getOneCategory(categoriesName);
	}

    
    //================================================================================================================
    //================================================================================================================
    @Override
    public List<ProductBean> SelectByCategoriesAndDescription(String remark, String name, String description,
    		int page) {
    	return dao.SelectByCategoriesAndDescription(remark,name,description,page);
    }
    
    @Override
    public List<ProductBean>  SelectByCategoriesAndDescriptionForPage(String remark, String name, String description) {
    	return dao.SelectByCategoriesAndDescriptionForPage(remark, name, description);
    }
	@Override
	public List<ProductBean> SelectByCategoriesAndDescription(String remark,String name, String description) {
		System.out.println("====service== :"+remark);
		return dao.SelectByCategoriesAndDescription(remark,name,description);
	}
    

	
//	@Override
//	public List<ProductBean> gteAllProductByCategories(String name) {
//		return dao.gteAllProductByCategories(name);
//	}
    @Override
    public List<CategoriesBean> getAllCategories(String name) {
    	return dao.getAllCategories(name);
    }
   
	@Override
	public void addtoCollection(int productId, int memberId) {
		dao.addtoCollection(productId, memberId);		
	}
	
    @Override
    public void updateProducts(ProductBean product,String productId) {
    	dao.updateProduct(product,productId);
    }
    
    @Override
    public void addProduct(ProductBean product) {
    	dao.addProduct(product);
    }
    @Override
    public List<ProductBean> getAllProducts() {
    	return dao.getAllProducts();
    }
    @Override
    public ProductBean getProductById(int productId) {
    	return dao.getProductById(productId);
    }

	@Override
	public List<CategoryBean> getAllCategory() {
	
		return dao.getAllCategory();
	}





   }