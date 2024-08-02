package dto;

public class CommuTownDto {
	int townIdx;
	String townName;
	
	public CommuTownDto(int townIdx, String townName) {
		this.townIdx = townIdx;
		this.townName = townName;
	}
	public int getTownIdx() {
		return townIdx;
	}
	public void setTownIdx(int townIdx) {
		this.townIdx = townIdx;
	}
	public String getTownName() {
		return townName;
	}
	public void setTownName(String townName) {
		this.townName = townName;
	}
}
