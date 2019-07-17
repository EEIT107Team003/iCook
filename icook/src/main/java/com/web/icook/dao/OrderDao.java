package com.web.icook.dao;

import java.util.List;

import com.web.icook.model.OrderBean;
import com.web.icook.model.OrderItemBean;

public interface OrderDao {

	void insertOrder(OrderBean ob);

	void updateOrder(OrderBean ob);
	
	OrderBean getOrder(Integer orderNo);

	List<OrderBean> getAllOrders();

	List<OrderItemBean> getOrderItemsByOrderNo(Integer orderNo);

	List<OrderItemBean> getOrderItemsByMemberSeqNo(Integer memerSeqNo);

	List<OrderBean> getOrdersbyMemberSeqNo(Integer integer);

	OrderBean get_One_Order_by_OrderNo(Integer orderNo);

	boolean setPaymentOK(Integer orderNo);
	

}