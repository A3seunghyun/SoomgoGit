package dto;

public class MarketGosuReviewDTO {
	private int score;
	private String content, writer;
	
	public MarketGosuReviewDTO(int score, String content, String writer) {
		this.score = score;
		this.content = content;
		this.writer = writer;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
}
