package dto;

public class GosuInforDTO {
	private int users_idx;
	private String name;
	private int real;
	private String last_login;
	private int career;
	private int member;
	private String explain;
	private int onoff;
	private String f_img;
	
	public GosuInforDTO(int users_idx, String name, int real, String last_login, int career, int member, String explain,
			int onoff, String f_img) {
		this.users_idx = users_idx;
		this.name = name;
		this.real = real;
		this.last_login = last_login;
		this.career = career;
		this.member = member;
		this.explain = explain;
		this.onoff = onoff;
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

	public int getReal() {
		return real;
	}

	public void setReal(int real) {
		this.real = real;
	}

	public String getLast_login() {
		return last_login;
	}

	public void setLast_login(String last_login) {
		this.last_login = last_login;
	}

	public int getCareer() {
		return career;
	}

	public void setCareer(int career) {
		this.career = career;
	}

	public int getMember() {
		return member;
	}

	public void setMember(int member) {
		this.member = member;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public int getOnoff() {
		return onoff;
	}

	public void setOnoff(int onoff) {
		this.onoff = onoff;
	}

	public String getF_img() {
		return f_img;
	}

	public void setF_img(String f_img) {
		this.f_img = f_img;
	} 
	
}
