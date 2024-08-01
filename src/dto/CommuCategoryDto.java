package dto;

public class CommuCategoryDto {
	private int categoryIdx;
	private String categoryTitle;
	private String thumbnail;
	
	public CommuCategoryDto(int categoryIdx, String categoryTitle, String thumbnail) {
		this.categoryIdx = categoryIdx;
		this.categoryTitle = categoryTitle;
		this.thumbnail = thumbnail;
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
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	
}
