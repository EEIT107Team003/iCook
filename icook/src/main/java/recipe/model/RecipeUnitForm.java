package recipe.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class RecipeUnitForm {
	private List<String> explain2;// 食譜步驟說明
	private List<MultipartFile> unit_image2;// 食譜步驟圖片

	public RecipeUnitForm() {
	}

	@Override
	public String toString() {
		return "RecipeUnitForm [explain2=" + explain2 + ", unit_image2=" + unit_image2 + "]";
	}

	public List<String> getExplain2() {
		return explain2;
	}

	public void setExplain2(List<String> explain2) {
		this.explain2 = explain2;
	}

	public List<MultipartFile> getUnit_image2() {
		return unit_image2;
	}

	public void setUnit_image2(List<MultipartFile> unit_image2) {
		this.unit_image2 = unit_image2;
	}
}