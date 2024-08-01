package dto;

public class Gosu_joinDto {
	private int category_idx;
	private String thumbnail;
	private String title;
	
	public Gosu_joinDto(int category_idx, String thumbnail, String title) {
		this.category_idx = category_idx;
		this.thumbnail = thumbnail;
		this.title = title;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
	
}
