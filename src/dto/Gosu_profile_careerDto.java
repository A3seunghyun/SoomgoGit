package dto;

public class Gosu_profile_careerDto {
	private int users_idx;
	private String title;
	private String st_career;
	private String ed_career;
	private String intro;
	
	public Gosu_profile_careerDto(int users_idx, String title, String st_career, String ed_career, String intro) {
		this.users_idx = users_idx;
		this.title = title;
		this.st_career = st_career;
		this.ed_career = ed_career;
		this.intro = intro;
	}

	public int getUsers_idx() {
		return users_idx;
	}

	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSt_career() {
		return st_career;
	}

	public void setSt_career(String st_career) {
		this.st_career = st_career;
	}

	public String getEd_career() {
		return ed_career;
	}

	public void setEd_career(String ed_career) {
		this.ed_career = ed_career;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}
	
	
	
	
}
