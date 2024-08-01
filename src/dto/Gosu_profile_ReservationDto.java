package dto;

public class Gosu_profile_ReservationDto {
	private int market_idx;
	private int service_idx;
	private String name;
	private int users_idx;
	private String img_url;
	private int price;
	
	public Gosu_profile_ReservationDto(int market_idx, int service_idx, String name, int users_idx, String img_url,
			int price) {
		this.market_idx = market_idx;
		this.service_idx = service_idx;
		this.name = name;
		this.users_idx = users_idx;
		this.img_url = img_url;
		this.price = price;
	}

	public int getMarket_idx() {
		return market_idx;
	}

	public void setMarket_idx(int market_idx) {
		this.market_idx = market_idx;
	}

	public int getService_idx() {
		return service_idx;
	}

	public void setService_idx(int service_idx) {
		this.service_idx = service_idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUsers_idx() {
		return users_idx;
	}

	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
