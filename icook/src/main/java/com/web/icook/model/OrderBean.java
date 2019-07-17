package com.web.icook.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


//顯示多筆訂單(不重複)
//@Data
@Entity
@Table(name="Orders")
public class OrderBean {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer orderNo;
	//加的
	private String description_all;
	///////////////////////////////
	@ManyToOne
	//@JoinColumn(name="fk_MemberId")
	@JoinColumn(name="fk_MemberId",referencedColumnName="member_id" )
	private MemberBean memberbean;
	/////////////////////////////
	private String payment;
	private Double	totalAmount;
	private String	shippingAddress; 
	private String  invoiceTitle;
	private Date  orderDate;
	private Date  shippingDate;//預計發貨日
	
	private String receiver;
	private String receiver_email;
	private String receiver_tel;
	//加了就部會噴lazy的錯了...雙邊要加,因為我要抓OrderItemBean.product,但是我沒加他就醫直lazy
	@OneToMany(mappedBy="orderBean",fetch=FetchType.EAGER)
	private List<OrderItemBean> items = new ArrayList<>();
	
	
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getReceiver_email() {
		return receiver_email;
	}
	public void setReceiver_email(String receiver_email) {
		this.receiver_email = receiver_email;
	}
	public String getReceiver_tel() {
		return receiver_tel;
	}
	public void setReceiver_tel(String receiver_tel) {
		this.receiver_tel = receiver_tel;
	}

	
	

	
	public OrderBean() {
		super();
	}
	public OrderBean(Integer orderNo, String description_all, MemberBean memberbean, String payment, Double totalAmount,
			String shippingAddress, String invoiceTitle, Date orderDate, Date shippingDate) {
		super();
		this.orderNo = orderNo;
		this.description_all = description_all;
		this.memberbean = memberbean;
		this.payment = payment;
		this.totalAmount = totalAmount;
		this.shippingAddress = shippingAddress;
		this.invoiceTitle = invoiceTitle;
		this.orderDate = orderDate;
		this.shippingDate = shippingDate;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public OrderBean(Object object, MemberBean mb, String receiver_Address, String invoiceTitle2, Date today,
			Date today2) {
		// TODO Auto-generated constructor stub
	}
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	
	
	public String getDescription_all() {
		return description_all;
	}
	public void setDescription_all(String description_all) {
		this.description_all = description_all;
	}
	
	
	public MemberBean getMemberbean() {
		return memberbean;
	}
	public void setMemberbean(MemberBean memberbean) {
		this.memberbean = memberbean;
	}
	public Double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	public String getInvoiceTitle() {
		return invoiceTitle;
	}
	public void setInvoiceTitle(String invoiceTitle) {
		this.invoiceTitle = invoiceTitle;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Date getShippingDate() {
		return shippingDate;
	}
	public void setShippingDate(Date shippingDate) {
		this.shippingDate = shippingDate;
	}
	public List<OrderItemBean> getItems() {
		return items;
	}
	public void setItems(List<OrderItemBean> items) {
		this.items = items;
	}
	
}
