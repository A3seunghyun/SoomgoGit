package dto;

public class CommuPostListDto {
	private String commuName;   // 커뮤니티명
	private String serviceName; // 서비스명
	private String title;   	// 게시글 제목
	private String contents;	// 게시글 내용
	private String imgUrl;		// 게시글 이미지
	private String province_name; // 도시명
	private String town_name;	// 지역명
	private String p_date; 		// 작성일시
	private int postIdx;		// 게시글idx
	
	public CommuPostListDto(String commuName, String serviceName, String title, String contents, String imgUrl,
			String province_name, String town_name, String p_date, int postIdx) {
		this.commuName = commuName;
		this.serviceName = serviceName;
		this.title = title;
		this.contents = contents;
		this.imgUrl = imgUrl;
		this.province_name = province_name;
		this.town_name = town_name;
		this.p_date = p_date;
		this.postIdx = postIdx;
	}
	
	public String getCommuName() {
		return commuName;
	}
	public void setCommuName(String commuName) {
		this.commuName = commuName;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getProvince_name() {
		return province_name;
	}
	public void setProvince_name(String province_name) {
		this.province_name = province_name;
	}
	public String getTown_name() {
		return town_name;
	}
	public void setTown_name(String town_name) {
		this.town_name = town_name;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public int getPostIdx() {
		return postIdx;
	}
	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}
	
}
