package dto;

public class Search_emailDto {
	private int users_idx;
	private String name;
	private String phone;
	private int verification;
	private String email;
	
	public Search_emailDto(int users_idx, String name, String phone, int verification, String email) {
		this.users_idx = users_idx;
		this.name = name;
		this.phone = phone;
		this.verification = verification;
		this.email = email;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getVerification() {
		return verification;
	}

	public void setVerification(int verification) {
		this.verification = verification;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	
}
