package dto;

public class Gosu_join_selectDto {
	private int middle_category_idx;
	private int category_idx;
	private String title;
	private String c_title;
	
	public Gosu_join_selectDto(int middle_category_idx, int category_idx, String title, String c_title) {
		this.middle_category_idx = middle_category_idx;
		this.category_idx = category_idx;
		this.title = title;
		this.c_title = c_title;
	}

	public int getMiddle_category_idx() {
		return middle_category_idx;
	}

	public void setMiddle_category_idx(int middle_category_idx) {
		this.middle_category_idx = middle_category_idx;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	

	
	
}
