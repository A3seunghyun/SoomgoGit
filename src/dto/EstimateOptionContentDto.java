package dto;

public class EstimateOptionContentDto {	
	private int optionNumber;
	private String contents;
	private int optionType;
	
	public EstimateOptionContentDto(int optionNumber, String contents, int optionType) {
		this.optionNumber = optionNumber;
		this.contents = contents;
		this.optionType = optionType;
	}

	public int getOptionNumber() {
		return optionNumber;
	}

	public void setOptionNumber(int optionNumber) {
		this.optionNumber = optionNumber;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getOptionType() {
		return optionType;
	}

	public void setOptionType(int optionType) {
		this.optionType = optionType;
	}
	
}
