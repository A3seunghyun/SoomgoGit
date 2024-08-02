package dto;

public class CommuLatestPhotoReviewsList {
	private int reviewIdx;
	private int usersIdx;
	private int gosuUsersIdx;
	private String reviewDate;
	private String contents;
	private int score;
	private String serviceTitle;
	private int serviceIdx;
	private String reviewImg1;
	private String reviewImg2;
	private String reviewImg3;
	
	public CommuLatestPhotoReviewsList(int reviewIdx, int usersIdx, int gosuUsersIdx, String reviewDate, String contents,
			int score, String serviceTitle, int serviceIdx, String reviewImg1, String reviewImg2, String reviewImg3) {
		this.reviewIdx = reviewIdx;
		this.usersIdx = usersIdx;
		this.gosuUsersIdx = gosuUsersIdx;
		this.reviewDate = reviewDate;
		this.contents = contents;
		this.score = score;
		this.serviceTitle = serviceTitle;
		this.serviceIdx = serviceIdx;
		this.reviewImg1 = reviewImg1;
		this.reviewImg2 = reviewImg2;
		this.reviewImg3 = reviewImg3;
	}
	
	public int getReviewIdx() {
		return reviewIdx;
	}
	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}
	public int getUsersIdx() {
		return usersIdx;
	}
	public void setUsersIdx(int usersIdx) {
		this.usersIdx = usersIdx;
	}
	public int getGosuUsersIdx() {
		return gosuUsersIdx;
	}
	public void setGosuUsersIdx(int gosuUsersIdx) {
		this.gosuUsersIdx = gosuUsersIdx;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getServiceTitle() {
		return serviceTitle;
	}
	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}
	public int getServiceIdx() {
		return serviceIdx;
	}
	public void setServiceIdx(int serviceIdx) {
		this.serviceIdx = serviceIdx;
	}
	public String getReviewImg1() {
		return reviewImg1;
	}
	public void setReviewImg1(String reviewImg1) {
		this.reviewImg1 = reviewImg1;
	}
	public String getReviewImg2() {
		return reviewImg2;
	}
	public void setReviewImg2(String reviewImg2) {
		this.reviewImg2 = reviewImg2;
	}
	public String getReviewImg3() {
		return reviewImg3;
	}
	public void setReviewImg3(String reviewImg3) {
		this.reviewImg3 = reviewImg3;
	}
}
