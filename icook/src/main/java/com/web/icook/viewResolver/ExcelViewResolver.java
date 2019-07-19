package com.web.icook.viewResolver;

import java.util.Locale;

import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;

import com.web.icook.controller.OrdersExcelView;
import com.web.icook.controller.ProductsByCategoryExcelView;
import com.web.icook.view.AllProductsExcelView;

public class ExcelViewResolver implements ViewResolver{

	@Override
	public View resolveViewName(String viewName, Locale locale) throws Exception {
		
		View view = null;
		if (viewName.startsWith("products/allProducts")) {
			view = new AllProductsExcelView();
		} 
		else if (viewName.startsWith("products/productsByCategory"))  {
			view = new ProductsByCategoryExcelView();
		}else if(viewName.startsWith("orders/allOrders")) {
			view = new OrdersExcelView();

		}
		//System.out.println("ExcelViewResolver, viewName=" + viewName + ", return value=" + view);
		return view;
      }
	
	
}