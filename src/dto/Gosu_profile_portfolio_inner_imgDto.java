package dto;

public class Gosu_profile_portfolio_inner_imgDto {
	private int users_idx;
	private int portfolio_idx;
	private String img ;
	
	public Gosu_profile_portfolio_inner_imgDto(int users_idx, int portfolio_idx, String img) {
		this.users_idx = users_idx;
		this.portfolio_idx = portfolio_idx;
		this.img = img;
	}

	public int getUsers_idx() {
		return users_idx;
	}

	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}

	public int getPortfolio_idx() {
		return portfolio_idx;
	}

	public void setPortfolio_idx(int portfolio_idx) {
		this.portfolio_idx = portfolio_idx;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	
}
