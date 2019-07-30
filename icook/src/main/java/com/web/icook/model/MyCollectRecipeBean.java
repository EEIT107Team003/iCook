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
	private MemberBean cr_memberBean;
	// 被收藏食譜
	private RecipeBean cr_recipeBean;
	// 收藏時間
	private Timestamp collectTime;

	@Id
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="cr_member_id")
	public MemberBean getCr_memberBean() {
		return cr_memberBean;
	}

	public void setCr_memberBean(MemberBean cr_memberBean) {
		this.cr_memberBean = cr_memberBean;
	}

	@Id
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="cr_recipe_id")
	public RecipeBean getCr_recipeBean() {
		return cr_recipeBean;
	}

	public void setCr_recipeBean(RecipeBean cr_recipeBean) {
		this.cr_recipeBean = cr_recipeBean;
	}

	public Timestamp getCollectTime() {
		return collectTime;
	}

	public void setCollectTime(Timestamp collectTime) {
		this.collectTime = collectTime;
	}
	
}
