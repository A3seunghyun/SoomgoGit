package dto;

public class CommuPostDto {
	private int postIdx;
	private int commuIdx;
	private String commuTitle;
	private int serviceIdx;
	private String serviceTitle;
	private int townIdx;
	private String townName;
	private String postTitle;
	private String userName;
	private String writeDate;
	private String postContents;
	private String userImg;
	
	public CommuPostDto(int postIdx, int commuIdx, String commuTitle, int serviceIdx, String serviceTitle, int townIdx,
			String townName, String postTitle, String userName, String writeDate, String postContents, String userImg) {
		this.postIdx = postIdx;
		this.commuIdx = commuIdx;
		this.commuTitle = commuTitle;
		this.serviceIdx = serviceIdx;
		this.serviceTitle = serviceTitle;
		this.townIdx = townIdx;
		this.townName = townName;
		this.postTitle = postTitle;
		this.userName = userName;
		this.writeDate = writeDate;
		this.postContents = postContents;
		this.userImg = userImg;
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

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	

	
	
}
