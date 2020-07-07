package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import semi.beans.dto.PensionDto;

public class PensionDao {
	private static DataSource src;

	static {
		try {
			Context ctx = new InitialContext();// 탐색파일
			Context env = (Context) ctx.lookup("java:/comp/env");
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 연결메소드
	public Connection getConnection() throws Exception {
//		Class.forName("oracle.jdbc.OracleDriver");
//		return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","c##kh","c##kh");
		return src.getConnection();
	}

	
	//펜션 등록 메소드
	public void regist(PensionDto pdto) throws Exception{
		Connection con = getConnection();
		String sql = "INSERT INTO pension VALUES(pension_seq.nextval,?,?,?,?,?,sysdate,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, pdto.getPension_seller_no());
		ps.setString(2, pdto.getPension_name());
		ps.setString(3, pdto.getPension_post());
		ps.setString(4, pdto.getPension_basic_addr());
		ps.setString(5, pdto.getPension_detail_addr());
		ps.setString(6, pdto.getPension_phone());
		ps.setString(7, pdto.getPension_intro());
		
		ps.execute();
		con.close();
	}
	
	//펜션 시퀀스 미리 생성 메소드
	public int getSequence() throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT pension_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		
		con.close();
		
		return seq;
	}
	
	//펜션 리스트 메소드
	public List<PensionDto> getList() throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM pension";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<PensionDto> list = new ArrayList<>();
		while(rs.next()) {
			PensionDto pdto = new PensionDto();
			pdto.setPension_no(rs.getInt("pension_no"));
			pdto.setPension_seller_no(rs.getInt("pension_seller_no"));
			pdto.setPension_name(rs.getString("pension_name"));
			pdto.setPension_post(rs.getString("pension_post"));
			pdto.setPension_basic_addr(rs.getString("pension_basic_addr"));
			pdto.setPension_detail_addr(rs.getString("pension_detail_addr"));
			pdto.setPension_phone(rs.getString("pension_phone"));
			pdto.setPension_regist_date(rs.getString("pension_regist_date"));
			pdto.setPension_intro(rs.getString("pension_intro"));
			
			list.add(pdto);
		}
		
		con.close();
		return list;
		
	}
}
