package dto;

public class Gosu_zim1Dto {
	private int users_idx;
	private String name;
	private String intro;
	private int career;
	private String f_img;
	
	public Gosu_zim1Dto(int users_idx, String name, String intro, int career, String f_img) {
		this.users_idx = users_idx;
		this.name = name;
		this.intro = intro;
		this.career = career;
		this.f_img = f_img;
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

	public String getF_img() {
		return f_img;
	}

	public void setF_img(String f_img) {
		this.f_img = f_img;
	}
	
	
	
}
