package com.web.icook.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.web.icook.service.CollectionRecipeService;

import recipe.model.RecipeBean;

@Entity
@Table(name = "CollectRecipe")
public class MyCollectRecipeBean implements Serializable {

	private static final long serialVersionUID = 1L;
	// 收藏者(會員)
	@JsonBackReference(value="collectRecipe")
	private MemberBean cr_memberBean;
	@JsonBackReference(value="memberbean")
	// 被收藏食譜
	private RecipeBean cr_recipeBean;
	// 收藏時間
	private Timestamp collectTime;

	private String MemberBean_nickName;
	
	private Integer RecipeBean_id;
	
	private String RecipeBean_name;
	
	private String RecipeBean_summary;
	
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

	public String getMemberBean_nickName() {
		String MemberBean_nickName=cr_memberBean.getNickname();
		return MemberBean_nickName;
	}

	public void setMemberBean_nickName(String memberBean_nickName) {
		MemberBean_nickName = memberBean_nickName;
	}

	public Integer getRecipeBean_id() {
		int RecipeBean_id=cr_recipeBean.getPk_recipe_id();
		return RecipeBean_id;
	}

	public void setRecipeBean_id(Integer recipeBean_id) {
		RecipeBean_id = recipeBean_id;
	}

	public String getRecipeBean_name() {
		String RecipeBean_name=cr_recipeBean.getRecipe_name();
		return RecipeBean_name;
	}

	public void setRecipeBean_name(String recipeBean_name) {
		RecipeBean_name = recipeBean_name;
	}

	public String getRecipeBean_summary() {
		String RecipeBean_summary=cr_recipeBean.getRecipe_summary();
		return RecipeBean_summary;
	}

	public void setRecipeBean_summary(String recipeBean_summary) {
		RecipeBean_summary = recipeBean_summary;
	}
	
}
