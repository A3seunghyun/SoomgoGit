package dto;

public class User_LoginDto {
	private int users_idx;
	private String email;
	private String pw;
	
	public User_LoginDto(int users_idx, String email, String pw) {
		this.users_idx = users_idx;
		this.email = email;
		this.pw = pw;
	}

	public int getUsers_idx() {
		return users_idx;
	}

	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
}
