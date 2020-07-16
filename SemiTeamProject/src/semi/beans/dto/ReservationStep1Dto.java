package semi.beans.dto;

public class ReservationStep1Dto {
	private int reservation_no;
	private int pension_no;
	private int member_no;
	private String reservation_date;

	public ReservationStep1Dto() {
		super();
	}

	public int getReservation_no() {
		return reservation_no;
	}

	public void setReservation_no(int reservation_no) {
		this.reservation_no = reservation_no;
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

	public String getReservation_date() {
		return reservation_date;
	}

	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}

}
