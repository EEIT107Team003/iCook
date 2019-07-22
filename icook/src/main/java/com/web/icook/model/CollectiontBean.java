package com.web.icook.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;;

@Entity
@Table(name = "_collection")
public class CollectiontBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pk_id", nullable = false)
	private Integer id;
	private Date collect;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_product_id")
	private ProductBean COproductBean;

	@ManyToOne
	@JoinColumn(name = "fk_member_id")
	private MemberBean COmemberBean;

	public ProductBean getProductBean() {
		return COproductBean;
	}

	public void setProductBean(ProductBean productBean) {
		this.COproductBean = productBean;
	}

	public MemberBean getMemberBean() {
		return COmemberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.COmemberBean = memberBean;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getCollect() {
		return collect;
	}

	public void setCollect(Date collect) {
		this.collect = collect;
	}

}
