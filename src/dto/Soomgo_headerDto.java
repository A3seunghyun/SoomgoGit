package dto;

public class Soomgo_headerDto {
	private int users_idx;
	private String name;
	private String f_img;
	
	public Soomgo_headerDto(int users_idx, String name, String f_img) {
		this.users_idx = users_idx;
		this.name = name;
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

	public String getF_img() {
		return f_img;
	}

	public void setF_img(String f_img) {
		this.f_img = f_img;
	}
	
	
}
