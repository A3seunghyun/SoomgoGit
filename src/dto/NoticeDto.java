package dto;

public class NoticeDto {
//	private int userIdx;  메서드 파라미터로 받아옴 필요 x
	private int read;
	private String message;
	private int estimateIdx;
	private int commentsIdx;
	private int chatIdx;
	private String noticeDate;
	private String name;
	private String serviceName;
	
	public NoticeDto( /* int userIdx, */  int read, String message, int estimateIdx, int commentsIdx, int chatIdx,
			String noticeDate, String name, String serviceName) {
//		this.userIdx = userIdx;
		this.read = read;
		this.message = message;
		this.estimateIdx = estimateIdx;
		this.commentsIdx = commentsIdx;
		this.chatIdx = chatIdx;
		this.noticeDate = noticeDate;
		this.name = name;
		this.serviceName = serviceName;
	}
	
//	public int getUserIdx() {
//		return userIdx;
//	}
//	public void setUserIdx(int userIdx) {
//		this.userIdx = userIdx;
//	}
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getEstimateIdx() {
		return estimateIdx;
	}
	public void setEstimateIdx(int estimateIdx) {
		this.estimateIdx = estimateIdx;
	}
	public int getCommentsIdx() {
		return commentsIdx;
	}
	public void setCommentsIdx(int commentsIdx) {
		this.commentsIdx = commentsIdx;
	}
	public int getChatIdx() {
		return chatIdx;
	}
	public void setChatIdx(int chatIdx) {
		this.chatIdx = chatIdx;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	
	
	
	
	
}
