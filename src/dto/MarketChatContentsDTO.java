package dto;

public class MarketChatContentsDTO {
	private int chatRoomIdx, usersIdx;
	private String contents, conDate;
	
	public MarketChatContentsDTO(int chatRoomIdx, int usersIdx, String contents, String conDate) {
		this.chatRoomIdx = chatRoomIdx;
		this.usersIdx = usersIdx;
		this.contents = contents;
		this.conDate = conDate;
	}

	public int getChatRoomIdx() {
		return chatRoomIdx;
	}

	public void setChatRoomIdx(int chatRoomIdx) {
		this.chatRoomIdx = chatRoomIdx;
	}

	public int getUsersIdx() {
		return usersIdx;
	}

	public void setUsersIdx(int usersIdx) {
		this.usersIdx = usersIdx;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getConDate() {
		return conDate;
	}

	public void setConDate(String conDate) {
		this.conDate = conDate;
	}
	
}
