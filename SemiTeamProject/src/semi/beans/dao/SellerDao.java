package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	// 단일 조회 메소드
	public SellerDto get(String seller_id) throws Exception {
		Connection con = getConnection();
		
		String sql = "select * from seller where seller_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, seller_id);
		ResultSet rs = ps.executeQuery();
		
		SellerDto seller = null;
		if (rs.next()) {
			seller = new SellerDto(rs);
		}
		
		con.close();
		return seller;
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
	
	//판매자 정보변경
	
	public void changeInfo(SellerDto mdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "UPDATE seller SET"
				+"seller_id=?, seller_name=?, seller_birth=?,seller_email=?, seller_basic_addr=?, seller_detail_addr=?, cmpany_no=? "
				+"WHERE member_id";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getSeller_name());
		ps.setString(2, mdto.getSeller_email());
		ps.setString(3, mdto.getSeller_phone());
		ps.setString(4, mdto.getSeller_basic_addr());
		ps.setString(5, mdto.getSeller_detail_addr());
		ps.setString(6, mdto.getCompany_no());
		
		ps.execute();
		
	
		con.close();
	}
	
	//(관리자) 판매자 리스트 기능 (모든 판매자 보기)
	public List<SellerDto> search() throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM seller ORDER BY seller_no DESC";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<SellerDto> list = new ArrayList<>();
		while(rs.next()) {
			SellerDto sdto = new SellerDto(rs);
			list.add(sdto);
		}
		con.close();
		return list;
	}
	
	// (관리자) 판매자 검색 기능 (타입추가)
	public List<SellerDto> search(String type, String keyword) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM seller WHERE instr(#1 , ?) > 0 ORDER BY #1 DESC";
		sql = sql.replace("#1", type);
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<SellerDto> list = new ArrayList<>();
		while(rs.next()) {
			SellerDto sdto = new SellerDto(rs);
			list.add(sdto);
		}
		
		con.close();
		return list;
	}

}














