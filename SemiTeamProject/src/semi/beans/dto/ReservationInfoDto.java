package semi.beans.dto;

public class ReservationInfoDto {
	private int pension_no;
	private int member_no;
	private String member_id;
	private int res_room_no;
	private String res_room_name;
	private String res_date;
	private String res_room_price;
	

	public String getRes_room_price() {
		return res_room_price;
	}

	public void setRes_room_price(String res_room_price) {
		this.res_room_price = res_room_price;
	}

	public ReservationInfoDto() {
		super();
	}

	public int getPension_no() {
		return pension_no;
	}

	public void setPension_no(int pension_no) {
		this.pension_no = pension_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}
	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getRes_room_no() {
		return res_room_no;
	}

	public void setRes_room_no(int res_room_no) {
		this.res_room_no = res_room_no;
	}

	public String getRes_room_name() {
		return res_room_name;
	}

	public void setRes_room_name(String res_room_name) {
		this.res_room_name = res_room_name;
	}

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
}
