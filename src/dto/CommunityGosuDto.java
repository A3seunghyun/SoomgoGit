package dto;

public class CommunityGosuDto {
	private int idx;
	private String title;
	
	public CommunityGosuDto(int idx, String title) {
		this.idx = idx;
		this.title = title;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String toString() {
		return (idx + " " + title);
	}
}
