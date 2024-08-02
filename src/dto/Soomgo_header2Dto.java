package dto;

public class Soomgo_header2Dto {
	private int users_idx;
	private String name;
	private String f_img;
	private int avg_score;
	private int count_review;
	
	public Soomgo_header2Dto(int users_idx, String name, String f_img, int avg_score, int count_review) {
		this.users_idx = users_idx;
		this.name = name;
		this.f_img = f_img;
		this.avg_score = avg_score;
		this.count_review = count_review;
	}

	public int getUsers_idx() {
		return users_idx;
	}

	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
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

	public int getAvg_score() {
		return avg_score;
	}

	public void setAvg_score(int avg_score) {
		this.avg_score = avg_score;
	}

	public int getCount_review() {
		return count_review;
	}

	public void setCount_review(int count_review) {
		this.count_review = count_review;
	}
	
	
}
