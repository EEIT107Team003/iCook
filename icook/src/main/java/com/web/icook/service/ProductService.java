package com.web.icook.service;

import java.util.List;

import com.web.icook.model.CategoriesBean;
import com.web.icook.model.CategoryBean;
import com.web.icook.model.ProductBean;

public interface ProductService {
	public ProductBean getProductById   (int productId);
	public void        updateProducts   (ProductBean product,String product_id);
	public void        addProduct       (ProductBean product);
	public void        addtoCollection  (int productId,int memberId);
	
	public List<ProductBean>     getAllProducts();
	public List<CategoryBean>    getAllCategory();
	public List<CategoriesBean>    getOneCategory         (String categoriesName);
	public List<CategoriesBean>  getAllCategories         (String name);
//	public List<ProductBean>     gteAllProductByCategories(String name);
	public List<ProductBean>     SelectByCategoriesAndDescription   (String remark,String name,String description);
	public List<ProductBean>     SelectByCategoriesAndDescriptionForPage   (String remark,String name,String description);
	public List<ProductBean>     SelectByCategoriesAndDescription   (String remark,String name,String description,int page);
}
