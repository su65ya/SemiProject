package semi.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SellerDto {

	private int seller_no;
	private String seller_id, seller_pw, seller_name, seller_birth, seller_phone, seller_mail,
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
		this.setSeller_mail(rs.getString("seller_mail"));
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

	public void setSeller_birth(String seller_birth) {
		this.seller_birth = seller_birth;
	}

	public String getSeller_phone() {
		return seller_phone;
	}

	public void setSeller_phone(String seller_phone) {
		this.seller_phone = seller_phone;
	}

	public String getSeller_mail() {
		return seller_mail;
	}

	public void setSeller_mail(String seller_mail) {
		this.seller_mail = seller_mail;
	}

	public String getSeller_post() {
		return seller_post;
	}

	public void setSeller_post(String seller_post) {
		this.seller_post = seller_post;
	}

	public String getSeller_basic_addr() {
		return seller_basic_addr;
	}

	public void setSeller_basic_addr(String seller_basic_addr) {
		this.seller_basic_addr = seller_basic_addr;
	}

	public String getSeller_detail_addr() {
		return seller_detail_addr;
	}

	public void setSeller_detail_addr(String seller_detail_addr) {
		this.seller_detail_addr = seller_detail_addr;
	}

	public String getSeller_join() {
		return seller_join;
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
