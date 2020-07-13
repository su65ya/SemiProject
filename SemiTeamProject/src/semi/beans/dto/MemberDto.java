package semi.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberDto {
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_birth;
	private String member_mail;
	private String member_post;
	private String member_basic_addr;
	private String member_detail_addr;
	private String member_phone;
	private String member_rate;
	private String member_join;
	
	public MemberDto() {
		super();
	}
	
	public MemberDto(ResultSet rs) throws SQLException {
		this.setMember_no(rs.getInt("member_no"));
		this.setMember_id(rs.getString("member_id"));
		this.setMember_pw(rs.getString("member_pw"));
		this.setMember_name(rs.getString("member_name"));
		this.setMember_birth(rs.getString("member_birth"));
		this.setMember_mail(rs.getString("member_mail"));
		this.setMember_post(rs.getString("member_post"));
		this.setMember_basic_addr(rs.getString("member_basic_addr"));
		this.setMember_detail_addr(rs.getString("member_detail_addr"));
		this.setMember_phone(rs.getString("member_phone"));
		this.setMember_rate(rs.getString("member_rate"));
		this.setMember_join(rs.getString("member_join"));
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

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_birth() {
		return member_birth;
	}
	
	public String getMember_birthdayFormat() throws ParseException{
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d = s.parse(member_birth);
		SimpleDateFormat f = new SimpleDateFormat("y년 M월 d일");
		return f.format(d);
	}
	

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_mail() {
		return member_mail;
	}

	public void setMember_mail(String member_mail) {
		this.member_mail = member_mail;
	}

	public String getMember_post() {
		return member_post;
	}

	public void setMember_post(String member_post) {
		this.member_post = member_post;
	}

	public String getMember_basic_addr() {
		return member_basic_addr;
	}

	public void setMember_basic_addr(String member_basic_addr) {
		this.member_basic_addr = member_basic_addr;
	}

	public String getMember_detail_addr() {
		return member_detail_addr;
	}

	public void setMember_detail_addr(String member_detail_addr) {
		this.member_detail_addr = member_detail_addr;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_rate() {
		return member_rate;
	}

	public void setMember_rate(String member_rate) {
		this.member_rate = member_rate;
	}

	public String getMember_join() {
		return member_join;
	}

	public void setMember_join(String member_join) {
		this.member_join = member_join;
	}
	
}
