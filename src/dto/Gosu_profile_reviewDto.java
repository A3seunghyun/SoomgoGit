package dto;

public class Gosu_profile_reviewDto {
	private int g_users_idx;
	private int score;
	private String contents;
	private String r_date;
	private String img1_url;
	private String img2_url;
	private String img3_url;
	private String title;
	private String name;
	
	public Gosu_profile_reviewDto(int g_users_idx, int score, String contents, String r_date, String img1_url,
			String img2_url, String img3_url, String title, String name) {
		this.g_users_idx = g_users_idx;
		this.score = score;
		this.contents = contents;
		this.r_date = r_date;
		this.img1_url = img1_url;
		this.img2_url = img2_url;
		this.img3_url = img3_url;
		this.title = title;
		this.name = name;
	}

	public int getG_users_idx() {
		return g_users_idx;
	}

	public void setG_users_idx(int g_users_idx) {
		this.g_users_idx = g_users_idx;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public String getImg1_url() {
		return img1_url;
	}

	public void setImg1_url(String img1_url) {
		this.img1_url = img1_url;
	}

	public String getImg2_url() {
		return img2_url;
	}

	public void setImg2_url(String img2_url) {
		this.img2_url = img2_url;
	}

	public String getImg3_url() {
		return img3_url;
	}

	public void setImg3_url(String img3_url) {
		this.img3_url = img3_url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
