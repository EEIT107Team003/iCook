package com.web.icook.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "Categories")
public class CategoriesBean implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(unique = true)
	private String name;

//	@JsonManagedReference
	@ManyToOne
	@JoinColumn(name = "fk_category", referencedColumnName = "name")
//	@JsonBackReference(value="categories")
	private CategoryBean categorybean;
	
//	@JsonIgnoreProperties(value= {"categoriesbean"},allowSetters = true)
//	@JsonIgnoreProperties("categoriesbean")
//	@JsonManagedReference(value="categoriesbean")
	@JsonBackReference(value="categoriesbean")
	@OneToMany(fetch=FetchType.LAZY)
	private Set<ProductBean>productBean=new HashSet<>();
	
	public CategoryBean getCategorybean() {
		return categorybean;
	}

	public void setCategorybean(CategoryBean categorybean) {
		this.categorybean = categorybean;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<ProductBean> getProductBean() {
		return productBean;
	}

	public void setProductBean(Set<ProductBean> productBean) {
		this.productBean = productBean;
	}



}
