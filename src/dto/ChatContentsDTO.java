package dto;

public class ChatContentsDTO {
	
	private int chat_idx;
	private int chatRoom_idx;
	private int users_idx;
	private String contents;
	private int file_idx;
	private String con_date;
	private int estimate_idx;
	
	public ChatContentsDTO(int chat_idx, int chatRoom_idx, int users_idx, String contents, int file_idx,
			String con_date, int estimate_idx) {
		this.chat_idx = chat_idx;
		this.chatRoom_idx = chatRoom_idx;
		this.users_idx = users_idx;
		this.contents = contents;
		this.file_idx = file_idx;
		this.con_date = con_date;
		this.estimate_idx = estimate_idx;
	}
	
	public int getChat_idx() {
		return chat_idx;
	}
	public void setChat_idx(int chat_idx) {
		this.chat_idx = chat_idx;
	}
	public int getChatRoom_idx() {
		return chatRoom_idx;
	}
	public void setChatRoom_idx(int chatRoom_idx) {
		this.chatRoom_idx = chatRoom_idx;
	}
	public int getUsers_idx() {
		return users_idx;
	}
	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getFile_idx() {
		return file_idx;
	}
	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}
	public String getCon_date() {
		return con_date;
	}
	public void setCon_date(String con_date) {
		this.con_date = con_date;
	}
	public int getEstimate_idx() {
		return estimate_idx;
	}
	public void setEstimate_idx(int estimate_idx) {
		this.estimate_idx = estimate_idx;
	}
	
	

}
