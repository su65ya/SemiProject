package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import semi.beans.dto.SellerDto;

public class SellerDao {
	
	private static DataSource src;
	
	static {
		try {
			Context ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:/comp/env");
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception {
		return src.getConnection();
	}
	
	// 판매자 가입
	public void join(SellerDto sdto) throws Exception {
		Connection con = getConnection();
		
		String sql ="insert into seller values (seller_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, sdto.getSeller_id());
		ps.setString(2, sdto.getSeller_pw());
		ps.setString(3, sdto.getSeller_name());
		ps.setString(4, sdto.getSeller_birth());
		ps.setString(5, sdto.getSeller_phone());
		ps.setString(6, sdto.getSeller_email());
		ps.setString(7, sdto.getSeller_post());
		ps.setString(8, sdto.getSeller_basic_addr());
		ps.setString(9, sdto.getSeller_detail_addr());
		ps.setString(10, sdto.getCompany_no());
		ps.execute();
		
		
		con.close();
	}
	
	
	// 판매자 로그인
	public SellerDto login(SellerDto sdto) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM seller WHERE seller_id = ? AND seller_pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, sdto.getSeller_id());
		ps.setString(2, sdto.getSeller_pw());
		
		ResultSet rs = ps.executeQuery();
		
		SellerDto seller;
		if (rs.next()) {
			seller = new SellerDto(rs);
		}
		else {
			seller = null;
		}
		
		con.close();
		return seller;
	}
	
	

}














