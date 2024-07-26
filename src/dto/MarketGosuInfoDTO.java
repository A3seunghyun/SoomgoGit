package dto;

//SELECT gi.name "고수 활동명",gi.f_img "프로필이미지", gi.real "본인인증 유무", gi.career  "경력"
//FROM gosu_infor gi, market m
//WHERE gi.users_idx = m.users_idx
//AND m.market_idx = 1;

public class MarketGosuInfoDTO {
	private int gosu_idx;
	private String gosuName, gosuFimg, gosuReal, gosuCareer;
	public MarketGosuInfoDTO(int gosu_idx, String gosuName, String gosuFimg, String gosuReal, String gosuCareer) {
		this.gosu_idx = gosu_idx;
		this.gosuName = gosuName;
		this.gosuFimg = gosuFimg;
		this.gosuReal = gosuReal;
		this.gosuCareer = gosuCareer;
	}
	public int getGosu_idx() {
		return gosu_idx;
	}
	public void setGosu_idx(int gosu_idx) {
		this.gosu_idx = gosu_idx;
	}
	public String getGosuName() {
		return gosuName;
	}
	public void setGosuName(String gosuName) {
		this.gosuName = gosuName;
	}
	public String getGosuFimg() {
		return gosuFimg;
	}
	public void setGosuFimg(String gosuFimg) {
		this.gosuFimg = gosuFimg;
	}
	public String getGosuReal() {
		return gosuReal;
	}
	public void setGosuReal(String gosuReal) {
		this.gosuReal = gosuReal;
	}
	public String getGosuCareer() {
		return gosuCareer;
	}
	public void setGosuCareer(String gosuCareer) {
		this.gosuCareer = gosuCareer;
	}

}
