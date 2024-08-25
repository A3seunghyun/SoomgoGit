package dto;

public class Gosu_profile_photo_videoDto {
	private int users_idx;
	private String photo;
	
	public Gosu_profile_photo_videoDto(int users_idx, String photo) {
		this.users_idx = users_idx;
		this.photo = photo;
	}

	public int getUsers_idx() {
		return users_idx;
	}

	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	
}
