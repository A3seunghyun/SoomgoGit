package dto;

public class Gosu_profile_member_inforDto {
	private int users_idx;
	private int member;
	private String start_contact;
	private String end_contact;
	
	public Gosu_profile_member_inforDto(int users_idx, int member, String start_contact, String end_contact) {
		this.users_idx = users_idx;
		this.member = member;
		this.start_contact = start_contact;
		this.end_contact = end_contact;
	}
	public int getUsers_idx() {
		return users_idx;
	}
	public void setUsers_idx(int users_idx) {
		this.users_idx = users_idx;
	}
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
	public String getStart_contact() {
		return start_contact;
	}
	public void setStart_contact(String start_contact) {
		this.start_contact = start_contact;
	}
	public String getEnd_contact() {
		return end_contact;
	}
	public void setEnd_contact(String end_contact) {
		this.end_contact = end_contact;
	}
	
	
}
