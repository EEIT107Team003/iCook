package com.web.icook.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

import forum.model.ForumMainBean;
import recipe.model.RecipeBean;

@Entity
@Table(name = "members")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;

	// 會員編號(不重複)*
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "generatorName")
	@GenericGenerator(name = "generatorName", strategy = "native")
	private Integer member_id;
	// 帳號(不重複)*
	@Column(unique = true)
	private String username;
	// 密碼
	private String password;
	// 暱稱
	private String nickname;
	// 會員電話
	private String member_phone_num;
	// 收貨地址
	private String address;
	// 會員簡介
	@Column(columnDefinition = "varchar(100)")
	private String resume;

	// 大頭貼
	@JsonIgnore
	private Blob member_photo;
	// 封面圖片
	@JsonIgnore
	private Blob cover_photo;
	// 大頭貼檔名
	private String fileName_member;
	// 個人封面檔名
	private String fileName_cover;

	// 被追蹤數
	private Integer tracked_num;
	// 發文篇數
	private Integer forum_num;
	// 發表食譜數量
	private Integer recipe_num;

	// 註冊時間
	private Date register_date;
	// 是否可用(0.公開 1.隱藏)
	private Boolean enabled;
	// 權限
	private String role;

	@XmlTransient
	@Transient
	private MultipartFile member_photo_tr;

	@JsonIgnore
	@XmlTransient
	@Transient
	private MultipartFile cover_photo_tr;

	@JsonBackReference(value = "ODmemberbean")
	@OneToMany(mappedBy = "ODmemberbean", fetch = FetchType.EAGER)
	private Set<OrderBean> orders;
	@JsonBackReference(value = "OTmemberBean")
	@OneToMany(mappedBy = "OTmemberBean", fetch = FetchType.EAGER)
	private List<OrderItemBean> orderitems;

	// ------------------------------------------------------------------------

	@OneToMany(mappedBy = "memberId", fetch = FetchType.LAZY)
	@JsonIgnore
	private Set<MyTrackBean> tracker = new LinkedHashSet<>();

	@OneToMany(mappedBy = "trackedId", fetch = FetchType.LAZY)
	@JsonIgnore
	private Set<MyTrackBean> tracked = new LinkedHashSet<>();

	@OneToMany(mappedBy = "memberBean")
	@JsonIgnore
	private Set<ForumMainBean> article = new LinkedHashSet<>();

	@OneToMany(mappedBy = "memberbean", cascade = CascadeType.ALL)
	@JsonIgnore
	private Set<RecipeBean> recipe = new LinkedHashSet<RecipeBean>();// 一中有個多，【一方】。

//	private Set<CollectRecipe> recipe_Collecter = new LinkedHashSet<>();
	@JsonBackReference(value = "article_member")
	@OneToMany(mappedBy = "article_member", fetch = FetchType.EAGER)
	private Set<ArticleBean> Act = new LinkedHashSet<>();
	@JsonBackReference(value = "memberid_in_msgs")
	@OneToMany(mappedBy = "memberid_in_msgs", fetch = FetchType.EAGER)
	private Set<MsgBoardBean> Msg = new LinkedHashSet<>();

	////////
//	@JsonBackReference(value = "cr_memberBean")
	@OneToMany(mappedBy = "cr_memberBean", fetch = FetchType.EAGER)
	private Set<MyCollectRecipeBean> collectRecipe = new LinkedHashSet<>();

	public Set<MyCollectRecipeBean> getCollectRecipe() {
		return collectRecipe;
	}

	public void setCollectRecipe(Set<MyCollectRecipeBean> collectRecipe) {
		this.collectRecipe = collectRecipe;
	}

	public Set<ArticleBean> getAct() {
		return Act;
	}

	public void setAct(Set<ArticleBean> act) {
		Act = act;
	}

	public Set<MsgBoardBean> getMsg() {
		return Msg;
	}

	public void setMsg(Set<MsgBoardBean> msg) {
		Msg = msg;
	}

	public Set<RecipeBean> getRecipe() {
		return recipe;
	}

	public void setRecipe(Set<RecipeBean> recipe) {
		this.recipe = recipe;
	}


	public MemberBean() {

	}

//
//	public MemberBean(Integer member_id, String username, String password, String nickname, Blob member_photo,
//			Integer tracked_num, Integer recipe_num, Blob cover_photo, Date register_date, Boolean enabled,
//			String fileName_member, String fileName_cover, Integer forum_num, String role,
//			MultipartFile member_photo_tr, Set<MyTrackBean> tracker, Set<MyTrackBean> tracked, Set<RecipeBean> recipe,
//			Set<CollectRecipe> recipe_Collecter) {
//		super();
//		this.member_id = member_id;
//		this.username = username;
//		this.password = password;
//		this.nickname = nickname;
//		this.member_photo = member_photo;
//		this.tracked_num = tracked_num;
//		this.recipe_num = recipe_num;
//		this.cover_photo = cover_photo;
//		this.register_date = register_date;
//		this.enabled = enabled;
//		this.fileName_member = fileName_member;
//		this.fileName_cover = fileName_cover;
//		this.forum_num = forum_num;
//		this.role = role;
//		this.member_photo_tr = member_photo_tr;
//		this.tracker = tracker;
//		this.tracked = tracked;
//		this.recipe = recipe;
//		this.recipe_Collecter = recipe_Collecter;
//	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Blob getMember_photo() {
		return member_photo;
	}

	public void setMember_photo(Blob member_photo) {
		this.member_photo = member_photo;
	}

	public Integer getTracked_num() {
		return tracked_num;
	}

	public void setTracked_num(Integer tracked_num) {
		this.tracked_num = tracked_num;
	}

	public Integer getRecipe_num() {
		return recipe_num;
	}

	public void setRecipe_num(Integer recipe_num) {
		this.recipe_num = recipe_num;
	}

	public Blob getCover_photo() {
		return cover_photo;
	}

	public void setCover_photo(Blob cover_photo) {
		this.cover_photo = cover_photo;
	}

	public Date getRegister_date() {
		return register_date;
	}

	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}

	public Set<MyTrackBean> getTracker() {
		return tracker;
	}

	public void setTracker(Set<MyTrackBean> tracker) {
		this.tracker = tracker;
	}

	public Set<MyTrackBean> getTracked() {
		return tracked;
	}

	public void setTracked(Set<MyTrackBean> tracked) {
		this.tracked = tracked;
	}

//	@OneToMany(mappedBy = "memberId")
//	public Set<CollectRecipe> getRecipe_Collecter() {
//		return recipe_Collecter;
//	}
//
//	public void setRecipe_Collecter(Set<CollectRecipe> recipe_Collecter) {
//		this.recipe_Collecter = recipe_Collecter;
//	}
//
//	@OneToMany(mappedBy = "recipe_member")
//	public Set<RecipeBean> getRecipe() {
//		return recipe;
//	}
//
//	public void setRecipe(Set<RecipeBean> recipe) {
//		this.recipe = recipe;
//	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public MultipartFile getMember_photo_tr() {
		return member_photo_tr;
	}

	public void setMember_photo_tr(MultipartFile member_photo_tr) {
		this.member_photo_tr = member_photo_tr;
	}

	public String getFileName_member() {
		return fileName_member;
	}

	public void setFileName_member(String fileName_member) {
		this.fileName_member = fileName_member;
	}

	public String getFileName_cover() {
		return fileName_cover;
	}

	public void setFileName_cover(String fileName_cover) {
		this.fileName_cover = fileName_cover;
	}

	public Integer getForum_num() {
		return forum_num;
	}

	public void setForum_num(Integer forum_num) {
		this.forum_num = forum_num;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public MultipartFile getCover_photo_tr() {
		return cover_photo_tr;
	}

	public void setCover_photo_tr(MultipartFile cover_photo_tr) {
		this.cover_photo_tr = cover_photo_tr;
	}

	public Set<ForumMainBean> getArticle() {
		return article;
	}

	public void setArticle(Set<ForumMainBean> article) {
		this.article = article;
	}

	public String getMember_phone_num() {
		return member_phone_num;
	}

	public void setMember_phone_num(String member_phone_num) {
		this.member_phone_num = member_phone_num;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public Set<OrderBean> getOrders() {
		return orders;
	}

	public void setOrders(Set<OrderBean> orders) {
		this.orders = orders;
	}

	public List<OrderItemBean> getOrderitems() {
		return orderitems;
	}

	public void setOrderitems(List<OrderItemBean> orderitems) {
		this.orderitems = orderitems;
	}

}
