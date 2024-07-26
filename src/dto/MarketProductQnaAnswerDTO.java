package dto;

public class MarketProductQnaAnswerDTO {
	private int qnaIdx;
	private String gosuname,answer_content, answer_date;
	
	public MarketProductQnaAnswerDTO(int qnaIdx, String gosuname, String answer_content, String answer_date) {
		this.qnaIdx = qnaIdx;
		this.gosuname = gosuname;
		this.answer_content = answer_content;
		this.answer_date = answer_date;
	}

	public int getQnaIdx() {
		return qnaIdx;
	}

	public void setQnaIdx(int qnaIdx) {
		this.qnaIdx = qnaIdx;
	}

	public String getGosuname() {
		return gosuname;
	}

	public void setGosuname(String gosuname) {
		this.gosuname = gosuname;
	}

	public String getAnswer_content() {
		return answer_content;
	}

	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}

	public String getAnswer_date() {
		return answer_date;
	}

	public void setAnswer_date(String answer_date) {
		this.answer_date = answer_date;
	}
	
}
