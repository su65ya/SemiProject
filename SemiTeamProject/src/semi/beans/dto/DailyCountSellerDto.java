package semi.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DailyCountSellerDto {
	private String day;
	private int cnt;
	
	public DailyCountSellerDto() {
		super();
	}
	public DailyCountSellerDto(ResultSet rs) throws SQLException {
		this.setDay(rs.getString("day"));
		this.setCnt(rs.getInt("cnt"));
	}
	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
