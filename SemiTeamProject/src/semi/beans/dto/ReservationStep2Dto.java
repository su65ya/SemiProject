package semi.beans.dto;

public class ReservationStep2Dto {
	private int step2_no;
	private int room_no;
	private String reservation_date;
	private int reservation_no;
	private int reservation_price;

	public ReservationStep2Dto() {
		super();
	}

	public int getStep2_no() {
		return step2_no;
	}

	public void setStep2_no(int step2_no) {
		this.step2_no = step2_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public String getReservation_date() {
		return reservation_date;
	}
	// yyyy-MM-dd방식
	public String getReservation_date_day() {
		return reservation_date.substring(0, 10);
	}

	// 00:00:00방식
	public String getReservation_date_time() {
		return reservation_date.substring(11, 16);
	}

	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}

	public int getReservation_no() {
		return reservation_no;
	}

	public void setReservation_no(int reservation_no) {
		this.reservation_no = reservation_no;
	}

	public int getReservation_price() {
		return reservation_price;
	}

	public void setReservation_price(int reservation_price) {
		this.reservation_price = reservation_price;
	}

}
