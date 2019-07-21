package recipe.model;

import java.util.List;

//recipe_ingredients
//儲存食材的表格
//「食材【已完成】」
//這是專門儲存「RecipeIngredientsBean」表格內容用的，算是中繼資料，資料從前端網頁傳送到這個物件，接著再由Controller解析他，取出資料。
public class RecipeIngredientsBeanForm {
	private List<String> ingredients2;// 食材名稱
	private List<String> quantity2;// 份量

	public RecipeIngredientsBeanForm() {
	}

	@Override
	public String toString() {
		return "RecipeIngredientsBeanForm [ingredients2=" + ingredients2 + ", quantity2=" + quantity2 + "]";
	}

	public List<String> getIngredients2() {
		return ingredients2;
	}

	public void setIngredients2(List<String> ingredients2) {
		this.ingredients2 = ingredients2;
	}

	public List<String> getQuantity2() {
		return quantity2;
	}

	public void setQuantity2(List<String> quantity2) {
		this.quantity2 = quantity2;
	}
}