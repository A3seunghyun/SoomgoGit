package dto;

public class Gosu_profile_header_inforDto {
	private int users_idx;
	private String f_img;
	private String name;
	private String title;
	private String province_name;
	private String town_name;
	private int distance;
	private String intro;
	private int real;
	
	public Gosu_profile_header_inforDto(int users_idx, String f_img, String name, String title, String province_name,
			String town_name, int distance, String intro, int real) {
		this.users_idx = users_idx;
		this.f_img = f_img;
		this.name = name;
		this.title = title;
		this.province_name = province_name;
		this.town_name = town_name;
		this.distance = distance;
		this.intro = intro;
		this.real = real;
	}

	public int getUsers_idx() {
		return users_idx;
	}

	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}

	public String getF_img() {
		return f_img;
	}

	public void setF_img(String f_img) {
		this.f_img = f_img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getProvince_name() {
		return province_name;
	}

	public void setProvince_name(String province_name) {
		this.province_name = province_name;
	}

	public String getTown_name() {
		return town_name;
	}

	public void setTown_name(String town_name) {
		this.town_name = town_name;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getReal() {
		return real;
	}

	public void setReal(int real) {
		this.real = real;
	}
	
	
	
		
}
