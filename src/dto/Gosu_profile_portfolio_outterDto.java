package dto;

public class Gosu_profile_portfolio_outterDto {
	private int portfolio_idx;
	private String p_title;
	private String img;
	private String s_title;
	
	public Gosu_profile_portfolio_outterDto(int portfolio_idx, String p_title, String img, String s_title) {
		this.portfolio_idx = portfolio_idx;
		this.p_title = p_title;
		this.img = img;
		this.s_title = s_title;
	}

	public int getPortfolio_idx() {
		return portfolio_idx;
	}

	public void setPortfolio_idx(int portfolio_idx) {
		this.portfolio_idx = portfolio_idx;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getS_title() {
		return s_title;
	}

	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	
	
	
	
}
