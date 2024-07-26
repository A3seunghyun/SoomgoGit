package dto;

public class MiddleCategoryDTO {
	private int middleCateIdx, CateIdx;
	private String title;
	
	public MiddleCategoryDTO(int middleCateIdx, int cateIdx, String title) {
		this.middleCateIdx = middleCateIdx;
		CateIdx = cateIdx;
		this.title = title;
	}

	public int getMiddleCateIdx() {
		return middleCateIdx;
	}

	public void setMiddleCateIdx(int middleCateIdx) {
		this.middleCateIdx = middleCateIdx;
	}

	public int getCateIdx() {
		return CateIdx;
	}

	public void setCateIdx(int cateIdx) {
		CateIdx = cateIdx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}
