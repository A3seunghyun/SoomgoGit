package dto;

public class ChatRoomListDTO {
	private int chatRoomIdx;
	private String chatRoomName, gosuServiceTitle, gosuServiceTown, gosuExplain, chatDate, gosuOnOff, fImg;
	public ChatRoomListDTO(int chatRoomIdx, String chatRoomName, String gosuServiceTitle, String gosuServiceTown,
			String gosuExplain, String chatDate, String gosuOnOff, String fImg) {
		this.chatRoomIdx = chatRoomIdx;
		this.chatRoomName = chatRoomName;
		this.gosuServiceTitle = gosuServiceTitle;
		this.gosuServiceTown = gosuServiceTown;
		this.gosuExplain = gosuExplain;
		this.chatDate = chatDate;
		this.gosuOnOff = gosuOnOff;
		this.fImg = fImg;
	}
	public int getChatRoomIdx() {
		return chatRoomIdx;
	}
	public void setChatRoomIdx(int chatRoomIdx) {
		this.chatRoomIdx = chatRoomIdx;
	}
	public String getChatRoomName() {
		return chatRoomName;
	}
	public void setChatRoomName(String chatRoomName) {
		this.chatRoomName = chatRoomName;
	}
	public String getGosuServiceTitle() {
		return gosuServiceTitle;
	}
	public void setGosuServiceTitle(String gosuServiceTitle) {
		this.gosuServiceTitle = gosuServiceTitle;
	}
	public String getGosuServiceTown() {
		return gosuServiceTown;
	}
	public void setGosuServiceTown(String gosuServiceTown) {
		this.gosuServiceTown = gosuServiceTown;
	}
	public String getGosuExplain() {
		return gosuExplain;
	}
	public void setGosuExplain(String gosuExplain) {
		this.gosuExplain = gosuExplain;
	}
	public String getChatDate() {
		return chatDate;
	}
	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}
	public String getGosuOnOff() {
		return gosuOnOff;
	}
	public void setGosuOnOff(String gosuOnOff) {
		this.gosuOnOff = gosuOnOff;
	}
	public String getfImg() {
		return fImg;
	}
	public void setfImg(String fImg) {
		this.fImg = fImg;
	}
	
}
