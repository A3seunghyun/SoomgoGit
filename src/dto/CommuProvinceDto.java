package dto;

public class CommuProvinceDto {
	Integer provenceIdx;
	String provinceName;

	
	public CommuProvinceDto(Integer provenceIdx, String provinceName) {
		this.provenceIdx = provenceIdx;
		this.provinceName = provinceName;
	}
	
	public Integer getProvenceIdx() {
		return provenceIdx;
	}
	public void setProvenceIdx(Integer provenceIdx) {
		this.provenceIdx = provenceIdx;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	
}
