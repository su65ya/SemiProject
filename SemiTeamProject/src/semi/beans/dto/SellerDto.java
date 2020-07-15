package semi.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SellerDto {

	private int seller_no;
	private String seller_id, seller_pw, seller_name, seller_birth, seller_phone, seller_email,
						seller_post, seller_basic_addr, seller_detail_addr, seller_join, company_no;
	
	public SellerDto() {
		super();
	}
	
	public SellerDto(ResultSet rs) throws SQLException{
		this.setSeller_no(rs.getInt("seller_no"));
		this.setSeller_id(rs.getString("seller_id"));
		this.setSeller_pw(rs.getString("seller_pw"));
		this.setSeller_name(rs.getString("seller_name"));
		this.setSeller_birth(rs.getString("seller_birth"));
		this.setSeller_phone(rs.getString("seller_phone"));
		this.setSeller_email(rs.getString("seller_email"));
		this.setSeller_post(rs.getString("seller_post"));
		this.setSeller_basic_addr(rs.getString("seller_basic_addr"));
		this.setSeller_detail_addr(rs.getString("seller_detail_addr"));
		this.setSeller_join(rs.getString("seller_join"));
		this.setCompany_no(rs.getString("company_no"));
		
	}

	public int getSeller_no() {
		return seller_no;
	}

	public void setSeller_no(int seller_no) {
		this.seller_no = seller_no;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getSeller_pw() {
		return seller_pw;
	}

	public void setSeller_pw(String seller_pw) {
		this.seller_pw = seller_pw;
	}

	public String getSeller_name() {
		return seller_name;
	}

	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}

	public String getSeller_birth() {
		return seller_birth;
	}
	
	// 생일 날짜
	public String getSeller_day() {
		return seller_birth.substring(0, 10);
	}

	public String getSeller_birthdayFormat() throws ParseException {
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d = s.parse(seller_birth);
		SimpleDateFormat f = new SimpleDateFormat("y년 M월 d일");
		return f.format(d);
	}

	public void setSeller_birth(String seller_birth) {
		this.seller_birth = seller_birth;
	}

	public String getSeller_phone() {
		return seller_phone;
	}

	public void setSeller_phone(String seller_phone) {
		this.seller_phone = seller_phone;
	}

	public String getSeller_email() {
		return seller_email;
	}

	public void setSeller_email(String seller_email) {
		this.seller_email = seller_email;
	}

	public String getSeller_post() {
		if (seller_post == null) return "";
		return seller_post;
	}
	
	public String getRead_post() {
		if (seller_post == null) return "";
		return "[" + seller_post +"]";
	}

	public void setSeller_post(String seller_post) {
		this.seller_post = seller_post;
	}

	public String getSeller_basic_addr() {
		if (seller_basic_addr == null) return "";
		return seller_basic_addr;
	}

	public void setSeller_basic_addr(String seller_basic_addr) {
		this.seller_basic_addr = seller_basic_addr;
	}

	public String getSeller_detail_addr() {
		if (seller_detail_addr == null) return "";
		return seller_detail_addr;
	}

	public void setSeller_detail_addr(String seller_detail_addr) {
		this.seller_detail_addr = seller_detail_addr;
	}

	public String getSeller_join() {
		return seller_join;
	}
	
	// 가입일 날짜
	public String getJoin_day() {
		return seller_join.substring(0, 16);
	}

	public void setSeller_join(String seller_join) {
		this.seller_join = seller_join;
	}

	public String getCompany_no() {
		return company_no;
	}

	public void setCompany_no(String company_no) {
		this.company_no = company_no;
	}

	
	
	
}
