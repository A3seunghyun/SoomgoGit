package dto;

public class CommuPageNumDto {
	private int postIdx;
	private int commuIdx;
	private String commuTitle;
	private int serviceIdx;
	private String serviceTitle;
	private int provinceIdx;
	private String provinceName;
	private int townIdx;
	private String townName;
	private String postTitle;
	private String userName;
	private String writeDate;
	private String postContents;
	private String postImg;
	private int postCommentsCount;
	private int postLikeCount;
	private int postViewsCount;
	
	public CommuPageNumDto(int postIdx, int commuIdx, String commuTitle, int serviceIdx, String serviceTitle,
			int provinceIdx, String provinceName, int townIdx, String townName, String postTitle, String userName,
			String writeDate, String postContents, String postImg, int postCommentsCount, int postLikeCount,
			int postViewsCount) {
		this.postIdx = postIdx;
		this.commuIdx = commuIdx;
		this.commuTitle = commuTitle;
		this.serviceIdx = serviceIdx;
		this.serviceTitle = serviceTitle;
		this.provinceIdx = provinceIdx;
		this.provinceName = provinceName;
		this.townIdx = townIdx;
		this.townName = townName;
		this.postTitle = postTitle;
		this.userName = userName;
		this.writeDate = writeDate;
		this.postContents = postContents;
		this.postImg = postImg;
		this.postCommentsCount = postCommentsCount;
		this.postLikeCount = postLikeCount;
		this.postViewsCount = postViewsCount;
	}

	public int getPostIdx() {
		return postIdx;
	}

	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}

	public int getCommuIdx() {
		return commuIdx;
	}

	public void setCommuIdx(int commuIdx) {
		this.commuIdx = commuIdx;
	}

	public String getCommuTitle() {
		return commuTitle;
	}

	public void setCommuTitle(String commuTitle) {
		this.commuTitle = commuTitle;
	}

	public int getServiceIdx() {
		return serviceIdx;
	}

	public void setServiceIdx(int serviceIdx) {
		this.serviceIdx = serviceIdx;
	}

	public String getServiceTitle() {
		return serviceTitle;
	}

	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}

	public int getProvinceIdx() {
		return provinceIdx;
	}

	public void setProvinceIdx(int provinceIdx) {
		this.provinceIdx = provinceIdx;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public int getTownIdx() {
		return townIdx;
	}

	public void setTownIdx(int townIdx) {
		this.townIdx = townIdx;
	}

	public String getTownName() {
		return townName;
	}

	public void setTownName(String townName) {
		this.townName = townName;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getPostContents() {
		return postContents;
	}

	public void setPostContents(String postContents) {
		this.postContents = postContents;
	}

	public String getPostImg() {
		return postImg;
	}

	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}

	public int getPostCommentsCount() {
		return postCommentsCount;
	}

	public void setPostCommentsCount(int postCommentsCount) {
		this.postCommentsCount = postCommentsCount;
	}

	public int getPostLikeCount() {
		return postLikeCount;
	}

	public void setPostLikeCount(int postLikeCount) {
		this.postLikeCount = postLikeCount;
	}

	public int getPostViewsCount() {
		return postViewsCount;
	}

	public void setPostViewsCount(int postViewsCount) {
		this.postViewsCount = postViewsCount;
	}

}
