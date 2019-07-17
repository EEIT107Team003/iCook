package com.web.icook.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.web.icook.dao.OrderDao;
import com.web.icook.dao.OrderItemDao;
import com.web.icook.model.OrderItemBean;
import com.web.icook.model.ude.ProductStockException;


@Transactional
@Repository
public class OrderItemDaoImpl implements OrderItemDao {
	@Autowired
	SessionFactory factory;
	
	
	@Autowired
	OrderDao odao;
	
	@Override
	public void insertOrderItem(OrderItemBean oib) {
		Session session  = factory.getCurrentSession();
		session.save(oib);	
	}
	
	@Override
	public int updateProductStock(OrderItemBean oib) {
		
		int n = 0;
		Integer stock = 0;
		Session session = factory.getCurrentSession();
		String hql0 = "SELECT stock FROM ProductBean Where product_id = :productkkkId";
		String hql1 = "UPDATE ProductBean set stock = stock - :orderKKKAmount where product_id = :productkkkId";
		stock = (Integer) session.createQuery(hql0)
				.setParameter("productkkkId", oib.getProductBean().getProduct_id()).uniqueResult();
		if(stock ==null) {
			stock=0;
		}
		int stockLeft = stock - oib.getQuantity();
		if(stockLeft<0) {
			throw new ProductStockException("庫存數量不足:"+
		oib.getProductBean().getProduct_id()+",在庫量"+stock+",訂購量:"+oib.getQuantity());
		}
		
		n = session.createQuery(hql1).setParameter("productkkkId", oib.getProductBean().getProduct_id())
				.setParameter("orderKKKAmount", oib.getQuantity())
				.executeUpdate();
		return n;
		
	    }
	
		@Override
		public double findItemAmount(OrderItemBean oib) {
			double subtotal = oib.getQuantity()*oib.getProductBean().getPrice()*oib.getDiscount();
			return subtotal;
			
		}

}
