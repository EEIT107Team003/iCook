package com.web.icook.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
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
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import org.hibernate.annotations.Cascade;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "Product")
public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pk_product_id", nullable = false)
	private Integer product_id;
	@Column(name = "product_name")
	private String name;
	@Column(name = "product_status")
	private Integer status;
	@JsonIgnore
	@Column(name = "product_image")
	private Blob image;
	@Column(name = "product_description")
	private String description;
	@Column(name = "product_unit_size")
	private String unit_size;
	@Column(name = "product_color")
	private String color;
	@Column(name = "product_price")
	private Double price;
	@Column(name = "product_stock")
	private Integer stock;
	@Column(name = "product_fileName")
	private String fileName;
	@Column(name = "product_remark")
	private String remark;
	@JsonBackReference(value="COproductBean")
	@OneToMany(mappedBy = "COproductBean",orphanRemoval = true ,fetch = FetchType.EAGER )
	@Cascade(value= {org.hibernate.annotations.CascadeType.SAVE_UPDATE,
			         org.hibernate.annotations.CascadeType.DELETE})
	private Set<CollectiontBean> collections = new HashSet<CollectiontBean>(0);
	@JsonBackReference(value="productBean")
	@OneToMany(fetch=FetchType.EAGER, mappedBy = "productBean"
	        , cascade = CascadeType.ALL)
	private List<OrderItemBean> carts = new ArrayList<OrderItemBean>(0);

	
     public List<OrderItemBean> getCarts() {
		return carts;
	}

	public void setCarts(List<OrderItemBean> carts) {
		this.carts = carts;
	}

	//	@JsonIgnoreProperties("productBean")
//	@JsonBackReference(value="categoriesbean")
	@ManyToOne
	@JoinColumn(name="fk_product_categories",referencedColumnName="name")	
	private CategoriesBean categoriesbean=new CategoriesBean();
	
	@JsonIgnore
	@XmlTransient
	@Transient
	private MultipartFile productImage;
	

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public ProductBean() {
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public Set<CollectiontBean> getCollections() {
		return collections;
	}

	public void setCollections(Set<CollectiontBean> collections) {
		this.collections = collections;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUnit_size() {
		return unit_size;
	}

	public void setUnit_size(String unit_size) {
		this.unit_size = unit_size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public CategoriesBean getCategoriesbean() {
		return categoriesbean;
	}

	public void setCategoriesbean(CategoriesBean categoriesbean) {
		this.categoriesbean = categoriesbean;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}



}
