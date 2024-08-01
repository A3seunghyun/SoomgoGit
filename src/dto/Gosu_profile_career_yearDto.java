package dto;

public class Gosu_profile_career_yearDto {
	private int users_idx;
	private int career;
	
	public Gosu_profile_career_yearDto(int users_idx, int career) {
		this.users_idx = users_idx;
		this.career = career;
	}

	public int getUsers_idx() {
		return users_idx;
	}

	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}

	public int getCareer() {
		return career;
	}

	public void setCareer(int career) {
		this.career = career;
	}
	
	
}
