package dto;

public class Search_profile_mapDto {
	private int users_idx;
	private double latitude;
	private double hardness;
	private String name;
	private String f_img;
	private String intro;
	
	public Search_profile_mapDto(int users_idx, double latitude, double hardness, String name, String f_img,
			String intro) {
		this.users_idx = users_idx;
		this.latitude = latitude;
		this.hardness = hardness;
		this.name = name;
		this.f_img = f_img;
		this.intro = intro;
	}

	public int getUsers_idx() {
		return users_idx;
	}

	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getHardness() {
		return hardness;
	}

	public void setHardness(double hardness) {
		this.hardness = hardness;
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
	
	
	
	
}
