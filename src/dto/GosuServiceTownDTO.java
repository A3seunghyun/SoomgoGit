package dto;

public class GosuServiceTownDTO {
	private String service_title;
	private String town_name;
	private String province_name;
	
	public GosuServiceTownDTO(String service_title, String town_name, String province_name) {
		this.service_title = service_title;
		this.town_name = town_name;
		this.province_name = province_name;
	}

	public String getService_title() {
		return service_title;
	}

	public void setService_title(String service_title) {
		this.service_title = service_title;
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
	
}
