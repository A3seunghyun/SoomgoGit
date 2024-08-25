package dto;

public class Search_profile_3Dto {
	private int rnum;
	private int users_idx;
	private String name;
	private int career;
	private String f_img;
	private String intro;
	private int score;
	private int c_review;
	private int c_transaction;
	
	public Search_profile_3Dto(int rnum, int users_idx, String name, int career, String f_img, String intro, int score,
			int c_review, int c_transaction) {
		this.rnum = rnum;
		this.users_idx = users_idx;
		this.name = name;
		this.career = career;
		this.f_img = f_img;
		this.intro = intro;
		this.score = score;
		this.c_review = c_review;
		this.c_transaction = c_transaction;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public int getCareer() {
		return career;
	}

	public void setCareer(int career) {
		this.career = career;
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

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getC_review() {
		return c_review;
	}

	public void setC_review(int c_review) {
		this.c_review = c_review;
	}

	public int getC_transaction() {
		return c_transaction;
	}

	public void setC_transaction(int c_transaction) {
		this.c_transaction = c_transaction;
	}
	
	
	
	
	
}
