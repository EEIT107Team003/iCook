package recipe.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//recipe_ingredients
//儲存食材的表格
//「食材【已完成】」
@Entity
@Table(name = "recipe_ingredients")
public class RecipeIngredientsBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer pk_recipe_ingredients_id;// 【PK】食譜食材編號

	// TODO FetchType.EAGER 是要解決 org.hibernate.LazyInitializationException 這個問題
//	@ManyToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name = "fk_recipe_id")
//	private RecipeBean recipeBeanIngredients;// 多對一

	private String ingredients;// 食材名稱
	private String quantity;// 份量
	private Integer fk_recipe_id;// FK索引鍵

	public RecipeIngredientsBean() {
		// 空的建構子
	}

	public Integer getFk_recipe_id() {
		return fk_recipe_id;
	}

	public void setFk_recipe_id(Integer fk_recipe_id) {
		this.fk_recipe_id = fk_recipe_id;
	}

//	public RecipeBean getIngredientsRecipeBean() {
//		return recipeBeanIngredients;
//	}
//
//	public void setIngredientsRecipeBean(RecipeBean ingredientsRecipeBean) {
//		this.recipeBeanIngredients = ingredientsRecipeBean;
//	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
}