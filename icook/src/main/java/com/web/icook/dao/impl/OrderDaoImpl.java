package com.web.icook.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.web.icook.dao.OrderDao;
import com.web.icook.model.OrderBean;
import com.web.icook.model.OrderItemBean;

@Transactional
@Repository
public class OrderDaoImpl implements OrderDao {
	
	private String memberId = null;
	
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public void insertOrder(OrderBean ob) {
		Session session  = factory.getCurrentSession();
		session.save(ob);	
	}
	@Override
	public void updateOrder(OrderBean ob) {
		Session session  = factory.getCurrentSession();
		session.saveOrUpdate(ob);	
	}
	
	@Override
	public OrderBean getOrder(Integer orderNo) {
		OrderBean ob = null;
		Session session = factory.getCurrentSession();
		ob = session.get(OrderBean.class , orderNo);
		return ob;
	}
	

	public  String getMemberId() {
		return memberId;
	}
	

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	

	
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getAllOrders() {
		List<OrderBean> list = null;
		String hql = "FROM OrderBean";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).list();
		return list;
	}
	
	//testOK
	@Override
	@SuppressWarnings("unchecked")
	public List<OrderBean> getOrdersbyMemberSeqNo(Integer mSeqNo){
		List<OrderBean> list = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderBean ob Where ob.memberbean.seqNo = :memberSeqNo";
		list = session.createQuery(hql).setParameter("memberSeqNo", mSeqNo).list();
		return list;
	}
	@Override
	public OrderBean get_One_Order_by_OrderNo(Integer orderNo){
		OrderBean ob = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderBean ob Where ob.orderNo = :oid";
		ob = (OrderBean) session.createQuery(hql)
				.setParameter("oid", orderNo)
				.uniqueResult();
		return ob;
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<OrderItemBean> getOrderItemsByOrderNo(Integer orderNo){
		List<OrderItemBean> order_list = null;
		Session session = factory.getCurrentSession();
		String hql =  "FROM OrderItemBean oib Where oib.orderBean = :oid";
		order_list = session.createQuery(hql).setParameter("oid", orderNo).list();
		return order_list;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<OrderItemBean> getOrderItemsByMemberSeqNo(Integer memberSeqNo){
		List<OrderItemBean> orderItem_list = null;
		Session session = factory.getCurrentSession();
		String hql =  "FROM OrderItemBean oib Where oib.memberBean.seqNo = :mseqNo";
		orderItem_list = session.createQuery(hql).setParameter("mseqNo", memberSeqNo).list();
		return orderItem_list;
	}
	
	@Override
	public boolean setPaymentOK(Integer orderNo){
		OrderBean ob = null;
		Session session = factory.getCurrentSession();
		ob = session.get(OrderBean.class , orderNo);
		if(ob==null) {
			return false;
		}
		ob.setPayment("OK");
		return true;
	}
	
	
	
	
		
//  查不到,此路不通	
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<OrderBean> getOrdersByMemberSeqNo(Long seqNo){
//		List<OrderBean> order_list = null;
//		Session session = factory.getCurrentSession();
//		String hql = "SELECT mb.orders FROM MemberBean mb WHERE mb.seqNo = :mid";
//		order_list = session.createQuery(hql).setParameter("mid", seqNo).list();
//		return order_list;
//	}
}



