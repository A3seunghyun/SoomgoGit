package dto;

public class CommuServiceCountDto {
	private Integer categoryIdx;   // 카테고리idx
	private String categoryTitle; // 대주제
	private Integer serviceIdx;		// 소주제idx
	private String serviceTitle;  // 소주제
	private Integer cnt;			// 게시글의 개수
	
	public CommuServiceCountDto(Integer categoryIdx, String categoryTitle, Integer serviceIdx, String serviceTitle,
			Integer cnt) {
		this.categoryIdx = categoryIdx;
		this.categoryTitle = categoryTitle;
		this.serviceIdx = serviceIdx;
		this.serviceTitle = serviceTitle;
		this.cnt = cnt;
	}
	
	public Integer getCategoryIdx() {
		return categoryIdx;
	}
	public void setCategoryIdx(Integer categoryIdx) {
		this.categoryIdx = categoryIdx;
	}
	public String getCategoryTitle() {
		return categoryTitle;
	}
	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}
	public Integer getServiceIdx() {
		return serviceIdx;
	}
	public void setServiceIdx(Integer serviceIdx) {
		this.serviceIdx = serviceIdx;
	}
	public String getServiceTitle() {
		return serviceTitle;
	}
	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}
	public Integer getCnt() {
		return cnt;
	}
	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "ServiceCountDto [categoryIdx=" + categoryIdx + ", categoryTitle=" + categoryTitle + ", serviceIdx="
				+ serviceIdx + ", serviceTitle=" + serviceTitle + ", cnt=" + cnt + "]";
	}
	
}
