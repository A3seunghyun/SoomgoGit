package dto;

public class Gosu_profile_portfolio_innerDto {
	private int portfolio_idx;
	private int users_idx;
	private String p_title;
	private int service_amount;
	private int work_year;
	private String name;
	private String f_img;
	private String s_title;
	private String town_name;
	private String province_name;
	private String contents;
	
	public Gosu_profile_portfolio_innerDto(int portfolio_idx, int users_idx, String p_title, int service_amount,
			int work_year, String name, String f_img, String s_title, String town_name, String province_name,
			String contents) {
		this.portfolio_idx = portfolio_idx;
		this.users_idx = users_idx;
		this.p_title = p_title;
		this.service_amount = service_amount;
		this.work_year = work_year;
		this.name = name;
		this.f_img = f_img;
		this.s_title = s_title;
		this.town_name = town_name;
		this.province_name = province_name;
		this.contents = contents;
	}

	public int getPortfolio_idx() {
		return portfolio_idx;
	}

	public void setPortfolio_idx(int portfolio_idx) {
		this.portfolio_idx = portfolio_idx;
	}

	public int getUsers_idx() {
		return users_idx;
	}

	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public int getService_amount() {
		return service_amount;
	}

	public void setService_amount(int service_amount) {
		this.service_amount = service_amount;
	}

	public int getWork_year() {
		return work_year;
	}

	public void setWork_year(int work_year) {
		this.work_year = work_year;
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

	public String getS_title() {
		return s_title;
	}

	public void setS_title(String s_title) {
		this.s_title = s_title;
	}

	public String getTown_name() {
		return town_name;
	}

	public void setTown_name(String town_name) {
		this.town_name = town_name;
	}

	public String getProvince_name() {
		return province_name;
	}

	public void setProvince_name(String province_name) {
		this.province_name = province_name;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
	
}
