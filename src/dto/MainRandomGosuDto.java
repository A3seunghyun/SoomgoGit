package dto;

public class MainRandomGosuDto {
	private String gosuImg;
	private int gosuIdx;
	private String gosuName;
	private String serviceTitle;
	private double avgScore;
	private String reviewContents;
	private String userName;
	
	public MainRandomGosuDto(String gosuImg, int gosuIdx, String gosuName, String serviceTitle, double avgScore,
			String reviewContents, String userName) {
		this.gosuImg = gosuImg;
		this.gosuIdx = gosuIdx;
		this.gosuName = gosuName;
		this.serviceTitle = serviceTitle;
		this.avgScore = avgScore;
		this.reviewContents = reviewContents;
		this.userName = userName;
	}
	
	public String getGosuImg() {
		return gosuImg;
	}
	public void setGosuImg(String gosuImg) {
		this.gosuImg = gosuImg;
	}
	public int getGosuIdx() {
		return gosuIdx;
	}
	public void setGosuIdx(int gosuIdx) {
		this.gosuIdx = gosuIdx;
	}
	public String getGosuName() {
		return gosuName;
	}
	public void setGosuName(String gosuName) {
		this.gosuName = gosuName;
	}
	public String getServiceTitle() {
		return serviceTitle;
	}
	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}
	public double getAvgScore() {
		return avgScore;
	}
	public void setAvgScore(double avgScore) {
		this.avgScore = avgScore;
	}
	public String getReviewContents() {
		return reviewContents;
	}
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
