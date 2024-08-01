package dto;

public class Gosu_zimDto {
	private int g_users_idx;
	private String name;
	private String f_img;
	private String intro;
	private int career;
	private int avg_score;
	private int review_count;
	private int transaction_count;
	
	public Gosu_zimDto(int g_users_idx, String name, String f_img, String intro, int career, int avg_score,
			int review_count, int transaction_count) {
		this.g_users_idx = g_users_idx;
		this.name = name;
		this.f_img = f_img;
		this.intro = intro;
		this.career = career;
		this.avg_score = avg_score;
		this.review_count = review_count;
		this.transaction_count = transaction_count;
	}

	public int getG_users_idx() {
		return g_users_idx;
	}

	public void setG_users_idx(int g_users_idx) {
		this.g_users_idx = g_users_idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getF_img() {
		return f_img;
	}

	public void setF_img(String f_img) {
		this.f_img = f_img;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getCareer() {
		return career;
	}

	public void setCareer(int career) {
		this.career = career;
	}

	public int getAvg_score() {
		return avg_score;
	}

	public void setAvg_score(int avg_score) {
		this.avg_score = avg_score;
	}

	public int getReview_count() {
		return review_count;
	}

	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}

	public int getTransaction_count() {
		return transaction_count;
	}

	public void setTransaction_count(int transaction_count) {
		this.transaction_count = transaction_count;
	}

	@Override
	public String toString() {
		return "Gosu_zimDto [g_users_idx=" + g_users_idx + ", name=" + name + ", f_img=" + f_img + ", intro=" + intro
				+ ", career=" + career + ", avg_score=" + avg_score + ", review_count=" + review_count
				+ ", transaction_count=" + transaction_count + "]";
	}
}
