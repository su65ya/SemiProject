package semi.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDto {

	private int admin_no;
	private String admin_id; 
	private String admin_pw;
	private String admin_phone;
	private String admin_mail;
	private String admin_birth;
	
	public AdminDto() {
		super();
	}
	
	public AdminDto(ResultSet rs) throws SQLException{
		this.setAdmin_no(rs.getInt("admin_no"));
		this.setAdmin_id(rs.getString("admin_id"));
		this.setAdmin_pw(rs.getString("admin_pw"));
		this.setAdmin_phone(rs.getString("admin_phone"));
		this.setAdmin_mail(rs.getString("admin_mail"));
		this.setAdmin_birth(rs.getString("admin_birth"));
		
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pw() {
		return admin_pw;
	}

	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}

	public String getAdmin_phone() {
		return admin_phone;
	}

	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}
	
	public String getAdmin_mail() {
		return admin_mail;
	}

	public void setAdmin_mail(String admin_mail) {
		this.admin_mail = admin_mail;
	}

	public String getAdmin_birth() {
		return admin_birth;
	}

	public void setAdmin_birth(String admin_birth) {
		this.admin_birth = admin_birth;
	}
	
	// 생일 날짜
	public String getAdmin_day() {
		return admin_birth.substring(0, 10);
	}

}
