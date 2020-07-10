package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import semi.beans.dto.PensionOptionDto;

public class PensionOptionDao {
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
		return src.getConnection();
	}
	
	//옵션 등록 메소드
	public void regist(PensionOptionDto podto)throws Exception{
		Connection con = getConnection();
		String sql = "INSERT INTO pension_option VALUES(pension_option_seq.nextval,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, podto.getPension_key());
		ps.setString(2, podto.getOption_name());
		ps.setInt(3, podto.getOption_price());
		ps.setInt(4, podto.getOption_select());
		
		ps.execute();
		
		con.close();
	}
	
	//펜션 옵션 단일 조회 메소드
	public PensionOptionDto get(int pension_no) throws Exception{
		Connection con = getConnection();
		String sql = "SELECT * FROM pension_option WHERE pension_key=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, pension_no);
		
		ResultSet rs = ps.executeQuery();
		PensionOptionDto podto;
		if(rs.next()) {
			podto = new PensionOptionDto();
			podto.setOption_no(rs.getInt("option_no"));
			podto.setPension_key(pension_no);
			podto.setOption_name(rs.getString("option_name"));
			podto.setOption_price(rs.getInt("option_price"));
			podto.setOption_select(rs.getInt("option_select"));
			
		}else {
			podto = null;
		}
		
		con.close();
		return podto;
	}
}
