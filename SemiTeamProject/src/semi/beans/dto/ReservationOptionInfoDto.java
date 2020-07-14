package semi.beans.dto;

public class ReservationOptionInfoDto {
	private int pension_no;
	private int res_room_no; 
	private String res_room_name;
	private String fire;
	private String adult;
	private String children;
	public ReservationOptionInfoDto() {
		super();
	}
	public int getPension_no() {
		return pension_no;
	}
	public void setPension_no(int pension_no) {
		this.pension_no = pension_no;
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
	public String getFire() {
		return fire;
	}
	public void setFire(String fire) {
		this.fire = fire;
	}
	public String getAdult() {
		return adult;
	}
	public void setAdult(String adult) {
		this.adult = adult;
	}
	public String getChildren() {
		return children;
	}
	public void setChildren(String children) {
		this.children = children;
	}
	
}
