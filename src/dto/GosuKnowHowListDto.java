package dto;

public class GosuKnowHowListDto {
	private String img;
	private int postIdx;
	private String title;
	private String gosuName;
	private String startPost;
	
	public GosuKnowHowListDto( String img, int postIdx,String title, String gosuName, String startPost) {
		this.postIdx = postIdx;
		this.img = img;
		this.title = title;
		this.gosuName = gosuName;
		this.startPost = startPost;
	}
	
	public int getPostIdx() {
		return postIdx;
	}
	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGosuName() {
		return gosuName;
	}
	public void setGosuName(String gosuName) {
		this.gosuName = gosuName;
	}
	public String getStartPost() {
		return startPost;
	}
	public void setStartPost(String startPost) {
		this.startPost = startPost;
	}
	
	
	
}
