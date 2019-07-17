package com.web.icook.service;

import java.util.List;

import com.web.icook.model.OrderBean;

public interface OrderService {

	OrderBean getOrder(int orderNo);

	List<OrderBean> getAllOrders();

	List<OrderBean> getOrdersByMemberId(Integer member_seqNo);

	void persistOrder(OrderBean ob);
	
	

}