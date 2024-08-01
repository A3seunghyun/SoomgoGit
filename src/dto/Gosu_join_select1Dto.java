package dto;

public class Gosu_join_select1Dto {
	private int service_idx;
	private String title;
	private int middle_category_idx;
	
	public Gosu_join_select1Dto(int service_idx, String title, int middle_category_idx) {
		this.service_idx = service_idx;
		this.title = title;
		this.middle_category_idx = middle_category_idx;
	}

	public int getService_idx() {
		return service_idx;
	}

	public void setService_idx(int service_idx) {
		this.service_idx = service_idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getMiddle_category_idx() {
		return middle_category_idx;
	}

	public void setMiddle_category_idx(int middle_category_idx) {
		this.middle_category_idx = middle_category_idx;
	}
	
	
	
}
