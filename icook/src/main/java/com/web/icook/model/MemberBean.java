package com.web.icook.model;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "members")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;

	// 會員編號(不重複)*
	private Integer member_id;
	// 電子郵件(不重複)*
	private String username;
	// 密碼(不重複)*
	private String password;
	// 暱稱(不重複)*
	private String nickname;
	// 大頭貼
	private Blob member_photo;
	// 被追蹤數
	private Integer tracked_num;
	// 發表食譜數量
	private Integer recipe_num;
	// 封面圖片
	private Blob cover_photo;
	// 註冊時間
	private Date register_date;
	// 是否水桶(0.公開 1.隱藏)
	private Boolean enabled;
	// 大頭貼檔名
	private String fileName_member;
	// 個人封面檔名
	private String fileName_cover;
	// 發文篇數
	private Integer forum_num;
	// 權限
	private String role;

	private MultipartFile member_photo_tr;
	private MultipartFile cover_photo_tr;

	// ------------------------------------------------------------------------
	private Set<MyTrackBean> tracker = new LinkedHashSet<>();
	private Set<MyTrackBean> tracked = new LinkedHashSet<>();

//	private Set<RecipeBean> recipe = new LinkedHashSet<>();
//	private Set<CollectRecipe> recipe_Collecter = new LinkedHashSet<>();

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

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	@Column(unique = true)
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(unique = true)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(unique = true)
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

	@OneToMany(mappedBy = "memberId")
	public Set<MyTrackBean> getTracker() {
		return tracker;
	}

	public void setTracker(Set<MyTrackBean> tracker) {
		this.tracker = tracker;
	}

	@OneToMany(mappedBy = "trackedId")
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

	@Transient
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

	@Transient
	public MultipartFile getCover_photo_tr() {
		return cover_photo_tr;
	}

	public void setCover_photo_tr(MultipartFile cover_photo_tr) {
		this.cover_photo_tr = cover_photo_tr;
	}
}
