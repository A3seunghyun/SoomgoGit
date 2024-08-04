package dto;

public class Search_profile_map_innerDto {
	private int users_idx;
	private String name;
	private int career;
	private String explain;
	private String f_img;
	private int r_count;
	private int r_avg;
	private int t_count;
	
	public Search_profile_map_innerDto(int users_idx, String name, int career, String explain, String f_img,
			int r_count, int r_avg, int t_count) {
		this.users_idx = users_idx;
		this.name = name;
		this.career = career;
		this.explain = explain;
		this.f_img = f_img;
		this.r_count = r_count;
		this.r_avg = r_avg;
		this.t_count = t_count;
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

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public String getF_img() {
		return f_img;
	}

	public void setF_img(String f_img) {
		this.f_img = f_img;
	}

	public int getR_count() {
		return r_count;
	}

	public void setR_count(int r_count) {
		this.r_count = r_count;
	}

	public int getR_avg() {
		return r_avg;
	}

	public void setR_avg(int r_avg) {
		this.r_avg = r_avg;
	}

	public int getT_count() {
		return t_count;
	}

	public void setT_count(int t_count) {
		this.t_count = t_count;
	}
	
	
}
