package dto;

public class Gosu_profile_service_plus_titleDto {
	private int users_idx;
	private int service_idx;
	private String title;
	
	public Gosu_profile_service_plus_titleDto(int users_idx, int service_idx, String title) {
		this.users_idx = users_idx;
		this.service_idx = service_idx;
		this.title = title;
	}

	public int getUsers_idx() {
		return users_idx;
	}

	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}

	public int getService_idx() {
		return service_idx;
	}

	public void setService_idx(int service_idx) {
		this.service_idx = service_idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
}
