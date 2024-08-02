package dto;

public class EstimateMidCategoryDto {
	private int midCatergoryIdx;	
	private int categoryIdx;	
	private String Title;
	
	public EstimateMidCategoryDto(int midCatergoryIdx, int categoryIdx, String title) {
		this.midCatergoryIdx = midCatergoryIdx;
		this.categoryIdx = categoryIdx;
		this.Title = title;
	}
	
	public int getMidCatergoryIdx() {
		return midCatergoryIdx;
	}
	public void setMidCatergoryIdx(int midCatergoryIdx) {
		this.midCatergoryIdx = midCatergoryIdx;
	}
	public int getCategoryIdx() {
		return categoryIdx;
	}
	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
}
