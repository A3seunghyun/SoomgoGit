package dto;

public class EstimateCategoryDto {
	private int categoryIdx ;
	private String title;
	private String thumbnail;
	
	public int getCategoryIdx() {
		return categoryIdx;
	}

	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public EstimateCategoryDto(int categoryIdx, String title, String thumbnail) {
		this.categoryIdx = categoryIdx;
		this.title = title;
		this.thumbnail = thumbnail;
	}
	
}
