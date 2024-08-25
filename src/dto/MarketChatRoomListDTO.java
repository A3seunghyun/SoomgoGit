package dto;

public class MarketChatRoomListDTO {
	
	private int chatRoomIdx, gosuIdx;
	private String gosuName, gosuFimg;
	
	public MarketChatRoomListDTO(int chatRoomIdx, int gosuIdx, String gosuName, String gosuFimg) {
		this.chatRoomIdx = chatRoomIdx;
		this.gosuIdx = gosuIdx;
		this.gosuName = gosuName;
		this.gosuFimg = gosuFimg;
	}

	public int getChatRoomIdx() {
		return chatRoomIdx;
	}

	public void setChatRoomIdx(int chatRoomIdx) {
		this.chatRoomIdx = chatRoomIdx;
	}

	public int getGosuIdx() {
		return gosuIdx;
	}

	public void setGosuIdx(int gosuIdx) {
		this.gosuIdx = gosuIdx;
	}

	public String getGosuName() {
		return gosuName;
	}

	public void setGosuName(String gosuName) {
		this.gosuName = gosuName;
	}

	public String getGosuFimg() {
		return gosuFimg;
	}

	public void setGosuFimg(String gosuFimg) {
		this.gosuFimg = gosuFimg;
	}
	
}
