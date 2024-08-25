package dto;

public class CommuGosuKnowhowPostDto {
	private String name;
    private String explain;
    private String img;
    private String title;
    private int postIdx;
    private String startPost;
    private int serviceIdx;
    private int mainIdx;
    private String contents;
    private String headerPost;
    private String mainImg1;
    private String mainImg2;
    private String mainImg3;
    private String serviceTitle;
    private String writeDate;
    private String commuTitle;
    private int commuIdx;
    
	public CommuGosuKnowhowPostDto(String name, String explain, String img, String title, int postIdx, String startPost,
			int serviceIdx, int mainIdx, String contents, String headerPost, String mainImg1, String mainImg2,
			String mainImg3, String serviceTitle, String writeDate, String commuTitle, int commuIdx) {
		this.name = name;
		this.explain = explain;
		this.img = img;
		this.title = title;
		this.postIdx = postIdx;
		this.startPost = startPost;
		this.serviceIdx = serviceIdx;
		this.mainIdx = mainIdx;
		this.contents = contents;
		this.headerPost = headerPost;
		this.mainImg1 = mainImg1;
		this.mainImg2 = mainImg2;
		this.mainImg3 = mainImg3;
		this.serviceTitle = serviceTitle;
		this.writeDate = writeDate;
		this.commuTitle = commuTitle;
		this.commuIdx = commuIdx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
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
	public int getPostIdx() {
		return postIdx;
	}
	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}
	public String getStartPost() {
		return startPost;
	}
	public void setStartPost(String startPost) {
		this.startPost = startPost;
	}
	public int getServiceIdx() {
		return serviceIdx;
	}
	public void setServiceIdx(int serviceIdx) {
		this.serviceIdx = serviceIdx;
	}
	public int getMainIdx() {
		return mainIdx;
	}
	public void setMainIdx(int mainIdx) {
		this.mainIdx = mainIdx;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getHeaderPost() {
		return headerPost;
	}
	public void setHeaderPost(String headerPost) {
		this.headerPost = headerPost;
	}
	public String getMainImg1() {
		return mainImg1;
	}
	public void setMainImg1(String mainImg1) {
		this.mainImg1 = mainImg1;
	}
	public String getMainImg2() {
		return mainImg2;
	}
	public void setMainImg2(String mainImg2) {
		this.mainImg2 = mainImg2;
	}
	public String getMainImg3() {
		return mainImg3;
	}
	public void setMainImg3(String mainImg3) {
		this.mainImg3 = mainImg3;
	}
	public String getServiceTitle() {
		return serviceTitle;
	}
	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getCommuTitle() {
		return commuTitle;
	}
	public void setCommuTitle(String commuTitle) {
		this.commuTitle = commuTitle;
	}
	public int getCommuIdx() {
		return commuIdx;
	}
	public void setCommuIdx(int commuIdx) {
		this.commuIdx = commuIdx;
	}
    
	

}
