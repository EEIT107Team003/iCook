package com.web.icook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.icook.dao.OrderDao;
import com.web.icook.dao.OrderItemDao;
import com.web.icook.model.OrderBean;
import com.web.icook.model.OrderItemBean;
import com.web.icook.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderItemDao oidao;
	@Autowired
	private OrderDao odao;

	
	@Override
	@Transactional
	public OrderBean getOrder(int orderNo) {
		OrderBean bean = null;
		bean = odao.getOrder(orderNo);
		return bean;
	}
	@Override
	@Transactional
	public List<OrderBean> getAllOrders(){
		List<OrderBean> list = null;
		list = odao.getAllOrders();
		return list;
	}

	@Override
	@Transactional
	public List<OrderBean> getOrdersByMemberId(Integer member_seqNo) {
		List<OrderBean> list = null;
		list = odao.getOrdersbyMemberSeqNo(member_seqNo);
		return list;
	}
	
	
	@Transactional
	@Override 
	// 這是一個交易
	public void persistOrder(OrderBean ob) {
			// 檢查每筆訂單明細所訂購之商品的庫存數量是否足夠
			checkStock(ob);   
			// 儲存該筆訂單
			//odao.insertOrder(ob);
			odao.updateOrder(ob);
	}
	public void checkStock(OrderBean ob) {
		List<OrderItemBean> items = ob.getItems();
		for (OrderItemBean oib : items) {
			oidao.updateProductStock(oib);
		}
	}
	
	

}
