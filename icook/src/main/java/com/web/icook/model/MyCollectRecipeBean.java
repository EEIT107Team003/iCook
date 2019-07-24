package com.web.icook.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import recipe.model.RecipeBean;

@Entity
@Table(name = "CollectRecipe")
public class MyCollectRecipeBean implements Serializable {

	private static final long serialVersionUID = 1L;
	// 收藏者(會員)
	private MemberBean cr_member_id;
	// 被收藏食譜
	private RecipeBean cr_reciept_id;
	// 收藏時間
	private Timestamp collectTime;

	@Id
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="cr_member_id")
	public MemberBean getCr_member_id() {
		return cr_member_id;
	}

	public void setCr_member_id(MemberBean cr_member_id) {
		this.cr_member_id = cr_member_id;
	}

	@Id
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="cr_reciept_id")
	public RecipeBean getCr_reciept_id() {
		return cr_reciept_id;
	}

	public void setCr_reciept_id(RecipeBean cr_reciept_id) {
		this.cr_reciept_id = cr_reciept_id;
	}

	public Timestamp getCollectTime() {
		return collectTime;
	}

	public void setCollectTime(Timestamp collectTime) {
		this.collectTime = collectTime;
	}
	
}
