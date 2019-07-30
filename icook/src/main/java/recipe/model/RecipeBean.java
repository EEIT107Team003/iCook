package recipe.model;

import java.io.Serializable;
import java.sql.Blob;
//import java.util.ArrayList;
import java.util.LinkedHashSet;
//import java.util.List;
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

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.web.icook.model.MemberBean;
import com.web.icook.model.MyCollectRecipeBean;

//POJO類別
//永續類別都定義在model套件裡面
// 本類別封裝單筆[DB03].[dbo].[recipe]資料
//model裡面的每個class都會對應到資料庫裡的每一張table
//【已完成】1.再加一個欄位設定是否顯示食譜
//【已完成】2.再加一個欄位儲存圖片檔案，這個欄位必須設定成@Transient，因為他只是暫時儲存圖片檔案用的，沒有跟這欄位相對應的資料庫欄位型別。
//【已完成】3.再加一個欄位計算點閱率
//4.還要加一個儲存食材的資料表【】
//【已完成】5.加上FK指向會員編號
//@Transient JPA 使用@Transient來忽略Entity類別屬性映射至資料表
//「食譜 recipe【已完成】」
@Entity
@Table(name = "recipe")
public class RecipeBean implements Serializable {
	// 食譜表格
	// 多方，多方對應一方雙向。
	// hql語法只能存取實際類別名稱 RecipeBean 跟 實際屬性名稱 pk_recipe_id。

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer pk_recipe_id;// 【PK】食譜編號

//	private Integer member_id;// 【FK】會員編號//TODO 錯誤寫法1-1

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_member_id")
	private MemberBean memberbean;// TODO 正確寫法，多中有個一。2-1

	// @JsonBackReference(value = "recipeBeanIngredients")
	// @OneToMany(mappedBy = "recipeBeanIngredients", cascade = CascadeType.ALL)
//	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
//	@JoinColumn(name = "fk_recipe_id")
//	private List<RecipeIngredientsBean> recipeIngredients = new ArrayList<RecipeIngredientsBean>();// 一對多，「食譜食材」

	// @JsonBackReference(value = "recipeBeanUnit")
	// @OneToMany(mappedBy = "recipeBeanUnit", cascade = CascadeType.ALL)
//	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
//	@JoinColumn(name = "fk_recipe_id")
//	private List<RecipeUnitBean> recipeUnit = new ArrayList<RecipeUnitBean>();// 一對多，「單元食譜、食譜步驟【已完成】」

//收藏食譜 (by江慶庭)---------------------------------------
	@JsonBackReference(value = "cr_recipeBean")
	@OneToMany(mappedBy = "cr_recipeBean", fetch = FetchType.EAGER) // EAGER防止 lazy loading的問題
	private Set<MyCollectRecipeBean> collectRecipe = new LinkedHashSet<>();
//---------------------------------------	

	private String recipe_name;// 食譜名稱
	private String recipe_quantity;// 食譜份量
	@JsonIgnore
	private Blob recipe_image;// 食譜圖片

	@Column(columnDefinition = "VARCHAR(1200)")
	private String recipe_summary;// 食譜簡介

	private String recipe_time;// 烹調時間

	@Column(columnDefinition = "VARCHAR(1200)")
	private String recipe_note;// 小撇步介紹

	private java.sql.Date recipe_date;// 新增食譜時的日期
	private Integer recipe_display;// 設定食譜是否顯示【1正常顯示，公開給大家看。】【2草稿階段尚未發布，只限本人觀看。】【3對所有人隱藏起來】

	@Transient // 食譜封面照片
	private MultipartFile image_file;// @Transient_儲存使用者上傳圖片檔案的欄位，之後再轉成 byte[]陣列 塞進 recipe_image。

	private String file_name;// 儲存使用者圖片檔案名稱，跟 recipe_image相關。
	private Integer recipe_click_rate;// 計算食譜點閱率
	private String recipe_item;// 食譜分類

	public RecipeBean() {
		// 空的建構子
	}

	public String getRecipe_item() {
		return recipe_item;
	}

	public void setRecipe_item(String recipe_item) {
		this.recipe_item = recipe_item;
	}

	public Set<MyCollectRecipeBean> getCollectRecipe() {
		return collectRecipe;
	}

	public void setCollectRecipe(Set<MyCollectRecipeBean> collectRecipe) {
		this.collectRecipe = collectRecipe;
	}

//	public List<RecipeIngredientsBean> getRecipeIngredients() {
//		return recipeIngredients;
//	}
//
//	public void setRecipeIngredients(List<RecipeIngredientsBean> recipeIngredients) {
//		this.recipeIngredients = recipeIngredients;
//	}

//	public List<RecipeUnitBean> getRecipeUnit() {
//		return recipeUnit;
//	}
//
//	public void setRecipeUnit(List<RecipeUnitBean> recipeUnit) {
//		this.recipeUnit = recipeUnit;
//	}

	public Integer getPk_recipe_id() {
		// @GeneratedValue(strategy = GenerationType.SEQUENCE)//不使用，他不會從1開始。
		// GenerationType.IDENTITY PK主鍵編號自動給定，從1開始，每新增一筆資料編號就加1。
		return pk_recipe_id;
	}

	public void setPk_recipe_id(Integer pk_recipe_id) {
		this.pk_recipe_id = pk_recipe_id;
	}

	public MemberBean getMemberbean() {
		return memberbean;// TODO 正確寫法，多中有個一。2-2
	}

	public void setMemberbean(MemberBean memberbean) {
		this.memberbean = memberbean;// TODO 正確寫法，多中有個一。2-3
	}

//	@ManyToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name = "fk_member_id")
//	public Integer getMember_id() {
//		return member_id;//TODO 錯誤寫法1-2
//	}
//
//	public void setMember_id(Integer member_id) {
//		this.member_id = member_id;//TODO 錯誤寫法1-3
//	}

	public String getRecipe_name() {
		return recipe_name;
	}

	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}

	public String getRecipe_quantity() {
		return recipe_quantity;
	}

	public void setRecipe_quantity(String recipe_quantity) {
		this.recipe_quantity = recipe_quantity;
	}

	public Blob getRecipe_image() {
		return recipe_image;
	}

	public void setRecipe_image(Blob recipe_image) {
		this.recipe_image = recipe_image;
	}

	public String getRecipe_summary() {
		return recipe_summary;
	}

	public void setRecipe_summary(String recipe_summary) {
		this.recipe_summary = recipe_summary;
	}

	public String getRecipe_time() {
		return recipe_time;
	}

	public void setRecipe_time(String recipe_time) {
		this.recipe_time = recipe_time;
	}

	public String getRecipe_note() {
		return recipe_note;
	}

	public void setRecipe_note(String recipe_note) {
		this.recipe_note = recipe_note;
	}

	public java.sql.Date getRecipe_date() {
		return recipe_date;
	}

	public void setRecipe_date(java.sql.Date recipe_date) {
		this.recipe_date = recipe_date;
	}

	public Integer getRecipe_display() {
		return recipe_display;
	}

	public void setRecipe_display(Integer recipe_display) {
		this.recipe_display = recipe_display;
	}

	public MultipartFile getImage_file() {
		// JPA 使用@Transient來忽略Entity屬性映射至資料表
		return image_file;
	}

	public void setImage_file(MultipartFile image_file) {
		this.image_file = image_file;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public Integer getRecipe_click_rate() {
		return recipe_click_rate;
	}

	public void setRecipe_click_rate(Integer recipe_click_rate) {
		this.recipe_click_rate = recipe_click_rate;
	}

//	public MemberBean getMemberbean() {
//		return memberbean;
//	}
//
//	public void setMemberbean(MemberBean memberbean) {
//		this.memberbean = memberbean;
//	}
}