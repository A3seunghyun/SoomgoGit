package dto;

public class MainPopularGosuDto {
	private int gosuIdx;
	private String gosuName;
	private String gosuImg;
	private int career;
	private int score;
	
	public MainPopularGosuDto(int gosuIdx, String gosuName, String gosuImg, int career, int score) {
		this.gosuIdx = gosuIdx;
		this.gosuName = gosuName;
		this.gosuImg = gosuImg;
		this.career = career;
		this.score = score;
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
	public String getGosuImg() {
		return gosuImg;
	}
	public void setGosuImg(String gosuImg) {
		this.gosuImg = gosuImg;
	}
	public int getCareer() {
		return career;
	}
	public void setCareer(int career) {
		this.career = career;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	
	
}
