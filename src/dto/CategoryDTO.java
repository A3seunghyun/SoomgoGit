package dto;

public class CategoryDTO {
	private int categoryIdx;
	private String categoryTitle;
	
	public CategoryDTO(int categoryIdx, String categoryTitle) {
		this.categoryIdx = categoryIdx;
		this.categoryTitle = categoryTitle;
	}
	public int getCategoryIdx() {
		return categoryIdx;
	}
	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}
	public String getCategoryTitle() {
		return categoryTitle;
	}
	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}
	
}
