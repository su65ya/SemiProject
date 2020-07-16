package semi.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ReservationDto {
	
	private int res_no, res_wirte, res_room_no, res_price;
	private String res_name, res_date, res_in, res_out, res_paytype;
	
	
	public ReservationDto() {
		super();
	}
	
	public  ReservationDto(ResultSet rs) throws SQLException{
		this.setRes_no(rs.getInt("res_no"));
		this.setRes_wirte(rs.getInt("res_write"));
		this.setRes_room_no(rs.getInt("res_room_no"));
		this.setRes_name(rs.getString("res_name"));
		this.setRes_date(rs.getString("res_date"));
		this.setRes_in(rs.getString("res_in"));
		this.setRes_out(rs.getString("res_out"));
		this.setRes_paytpye(rs.getString("res_paytype"));
		this.setRes_price(rs.getInt("res_price"));
		
	}


	public final int getRes_no() {
		return res_no;
	}


	public final void setRes_no(int res_no) {
		this.res_no = res_no;
	}


	public final int getRes_wirte() {
		return res_wirte;
	}


	public final void setRes_wirte(int res_wirte) {
		this.res_wirte = res_wirte;
	}


	public final int getRes_room_no() {
		return res_room_no;
	}


	public final void setRes_room_no(int res_room_no) {
		this.res_room_no = res_room_no;
	}


	public final int getRes_price() {
		return res_price;
	}


	public final void setRes_price(int res_price) {
		this.res_price = res_price;
	}


	public final String getRes_name() {
		return res_name;
	}


	public final void setRes_name(String res_name) {
		this.res_name = res_name;
	}


	public final String getRes_date() {
		return res_date;
	}


	public final void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	// yyyy-MM-dd방식
	public String getRes_date_day() {
		return res_date.substring(0, 10);
	}

	// 00:00:00방식
	public String getRes_date_time() {
		return res_date.substring(11, 16);
	}


	public final String getRes_in() {
		return res_in;
	}


	public final void setRes_in(String res_in) {
		this.res_in = res_in;
	}
	// yyyy-MM-dd방식
	public String getRes_in_day() {
		return res_in.substring(0, 10);
	}

		// 00:00:00방식
	public String getRes_in_time() {
		return res_in.substring(11, 16);
	}

	public final String getRes_out() {
		return res_out;
	}


	public final void setRes_out(String res_out) {
		this.res_out = res_out;
	}


	public final String getRes_paytpye() {
		return res_paytype;
	}


	public final void setRes_paytpye(String res_paytype) {
		this.res_paytype = res_paytype;
	}
		
		
	
	
	

}
