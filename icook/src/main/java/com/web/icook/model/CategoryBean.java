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
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "Category")
@JsonIgnoreProperties(value= {"categorybean"},allowSetters = true)
public class CategoryBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(unique = true)
	private String name;

//	@JsonManagedReference
	@JsonBackReference(value="categorybean")
	@OneToMany(fetch=FetchType.LAZY)
	private Set<CategoriesBean> categories = new HashSet<CategoriesBean>(0);


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<CategoriesBean> getCategories() {
		return categories;
	}

	public void setCategories(Set<CategoriesBean> categories) {
		this.categories = categories;
	}
}
