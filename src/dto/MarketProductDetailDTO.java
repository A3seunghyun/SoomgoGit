package dto;

//SELECT md.untact "온라인 진행 ", md.contact "대면/비대면", t.town_name "서비스 지역" ,md.contents "상세 설명", mii.img_url "상품 상세이미지"

//FROM market m, market_detail md, market_item_img mii, town t
//WHERE m.market_idx = md.market_idx
//AND md.service_idx = t.town_idx
//AND mii.market_idx = md.market_idx;

public class MarketProductDetailDTO {

	private String img_url, untact, contact, townName, contents;

	public MarketProductDetailDTO(String img_url, String untact, String contact, String townName, String contents) {
		this.img_url = img_url;
		this.untact = untact;
		this.contact = contact;
		this.townName = townName;
		this.contents = contents;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getUntact() {
		return untact;
	}

	public void setUntact(String untact) {
		this.untact = untact;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getTownName() {
		return townName;
	}

	public void setTownName(String townName) {
		this.townName = townName;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
}
