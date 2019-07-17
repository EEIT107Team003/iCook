package com.web.icook.dao;

import com.web.icook.model.OrderItemBean;

public interface OrderItemDao {

	int updateProductStock(OrderItemBean oib);

	double findItemAmount(OrderItemBean oib);
	
	public void insertOrderItem(OrderItemBean oib) ;
	
	//public List<OrderItemBean> getOrderItemListByOrderItems(Integer orderId);

	//public List<OrderBean> getOrderItems(Integer orderItemNo);

//	List<OrderItemBean> getOrderItemsByOrderId();

}