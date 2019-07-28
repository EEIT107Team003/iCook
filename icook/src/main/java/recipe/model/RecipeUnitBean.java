package recipe.model;

import java.io.Serializable;
import java.sql.Blob;

//import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

//「單元食譜、食譜步驟【已完成】」
@Entity
@Table(name = "recipe_unit")
public class RecipeUnitBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer pk_recipe_unit_id;// 多對一【PK】單元食譜、食譜步驟編號

//	@ManyToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name = "fk_recipe_id")
//	private RecipeBean recipeBeanUnit;// 多對一
	private Integer fk_recipe_id;// 對應到食譜的FK

	private Integer stepNo;// 食譜步驟編號
	private String explain;// 食譜步驟說明
	
	@JsonIgnore
	private Blob unit_image;// 食譜步驟圖片
	
	private String file_name;// 儲存使用者圖片檔案名稱，跟 unit_image 相關。

	public RecipeUnitBean() {
		// 空的建構子
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public Integer getFk_recipe_id() {
		return fk_recipe_id;
	}

	public void setFk_recipe_id(Integer fk_recipe_id) {
		this.fk_recipe_id = fk_recipe_id;
	}

	public Integer getPk_recipe_unit_id() {
		return pk_recipe_unit_id;
	}

	public void setPk_recipe_unit_id(Integer pk_recipe_unit_id) {
		this.pk_recipe_unit_id = pk_recipe_unit_id;
	}

//	public RecipeBean getRecipeBeanUnit() {
//		return recipeBeanUnit;
//	}
//
//	public void setRecipeBeanUnit(RecipeBean recipeBeanUnit) {
//		this.recipeBeanUnit = recipeBeanUnit;
//	}

	public Integer getStepNo() {
		return stepNo;
	}

	public void setStepNo(Integer stepNo) {
		this.stepNo = stepNo;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public Blob getUnit_image() {
		return unit_image;
	}

	public void setUnit_image(Blob unit_image) {
		this.unit_image = unit_image;
	}

}