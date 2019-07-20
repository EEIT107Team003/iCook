package com.web.icook.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//單筆所有細項
//@Data
@Entity
@Table(name = "OrderItem")
public class OrderItemBean  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer OrderItemId;
	private Double discount;
	private Integer quantity;
	private Double subtotal;

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name ="FK_OrderBean_orderNo")
	private OrderBean orderBean;
	@ManyToOne
	@JoinColumn(name = "fk_product_id") 
	private ProductBean productBean;
//覺得只要OrderBean跟會員連結就好了
//
	@ManyToOne
	@JoinColumn(name="fk_member_seqNo")
	private MemberBean OTmemberBean;
	
	//測試,OrderController會用到
//			@Override
//			public String toString() {
//				return "OrderItemBean [OrderItemId=" + OrderItemId + ", discount=" + discount + ", quantity=" + quantity
//						+ ", subtotal=" + subtotal + ", orderBean=" + orderBean + ", productBean=" + productBean
//						+ ", memberBean=" + memberBean + "]";
//			}
		
	
	
	public MemberBean getMemberBean() {
		return OTmemberBean;
	}
	public void setMemberBean(MemberBean memberBean) {
		this.OTmemberBean = memberBean;
	}
	public Integer getOrderItemId() {
		return OrderItemId;
	}
	@Override
	public String toString() {
		return "OrderItemBean [OrderItemId=" + OrderItemId + ", discount=" + discount + ", quantity=" + quantity
				+ ", subtotal=" + subtotal + ", orderBean=" + orderBean + ", productBean=" + productBean + "]";
	}
	public void setId(Integer OrderItemId) {
		this.OrderItemId = OrderItemId;
	}

	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public ProductBean getProductBean() {
		return productBean;
	}
	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}

//	public MemberBean getMemberBean() {
//		return memberBean;
//	}
//	public void setMemberBean(MemberBean memberBean) {
//		this.memberBean = memberBean;
//	}
	public OrderBean getOrderBean() {
		return orderBean;
	}
	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public Double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	public void setOrderItemId(Integer orderItemId) {
		OrderItemId = orderItemId;
	}
	
	
	
	
}
