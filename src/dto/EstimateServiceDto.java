package dto;

public class EstimateServiceDto {
	private int categoryIdx;
	private int serviceIdx;
	private String title;
	private String serviceThumbnail;
	private int midCategoryIdx;
	
	public EstimateServiceDto(int categoryIdx, int serviceIdx, String title, String serviceThumbnail, int midCategoryIdx) {
		this.categoryIdx = categoryIdx;
		this.serviceIdx = serviceIdx;
		this.title = title;
		this.serviceThumbnail = serviceThumbnail;
		this.midCategoryIdx = midCategoryIdx;
	}
	
	public int getCategoryIdx() {
		return categoryIdx;
	}

	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}

	public int getServiceIdx() {
		return serviceIdx;
	}

	public void setServiceIdx(int serviceIdx) {
		this.serviceIdx = serviceIdx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getServiceThumbnail() {
		return serviceThumbnail;
	}

	public void setServiceThumbnail(String serviceThumbnail) {
		this.serviceThumbnail = serviceThumbnail;
	}

	public int getMidCategoryIdx() {
		return midCategoryIdx;
	}

	public void setMidCategoryIdx(int midCategoryIdx) {
		this.midCategoryIdx = midCategoryIdx;
	}

	
}
