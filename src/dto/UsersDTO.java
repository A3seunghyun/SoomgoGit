package dto;

public class UsersDTO {
	private int users_idx;
	private String alias;
	private String pw;
	private String phone;
	private String name;
	private String email;
	private String f_img;
	private String gender;
	private String birth;
	private int cash;
	private int town_idx;
	private int verification;
	
	public UsersDTO(int users_idx, String alias, String pw, String phone, String name, String email, String f_img,
			String gender, String birth, int cash, int town_idx, int verification) {
		this.users_idx = users_idx;
		this.alias = alias;
		this.pw = pw;
		this.phone = phone;
		this.name = name;
		this.email = email;
		this.f_img = f_img;
		this.gender = gender;
		this.birth = birth;
		this.cash = cash;
		this.town_idx = town_idx;
		this.verification = verification;
	}

	public int getUsers_idx() {
		return users_idx;
	}

	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getF_img() {
		return f_img;
	}

	public void setF_img(String f_img) {
		this.f_img = f_img;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getTown_idx() {
		return town_idx;
	}

	public void setTown_idx(int town_idx) {
		this.town_idx = town_idx;
	}

	public int getVerification() {
		return verification;
	}

	public void setVerification(int verification) {
		this.verification = verification;
	}
}
