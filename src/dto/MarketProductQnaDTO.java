package dto;

public class MarketProductQnaDTO {
	private int qnaIdx;
	private String type, question, name, qna_date, answer_cnt;
	
	public MarketProductQnaDTO(int qnaIdx, String type, String question, String name, String qna_date,
			String answer_cnt) {
		this.qnaIdx = qnaIdx;
		this.type = type;
		this.question = question;
		this.name = name;
		this.qna_date = qna_date;
		this.answer_cnt = answer_cnt;
	}

	public int getQnaIdx() {
		return qnaIdx;
	}

	public void setQnaIdx(int qnaIdx) {
		this.qnaIdx = qnaIdx;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getQna_date() {
		return qna_date;
	}

	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}

	public String getAnswer_cnt() {
		return answer_cnt;
	}

	public void setAnswer_cnt(String answer_cnt) {
		this.answer_cnt = answer_cnt;
	}

	
	
}
