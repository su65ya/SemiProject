package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import semi.beans.dto.PensionImageDto;

public class PensionImageDao {
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
	
	//펜션이미지 시퀀스 미리 생성 메소드
	public int getSequence() throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT pen_img_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		
		con.close();
		
		return seq;
	}
	
	//팬션 이미지 저장 메소드
	public void save(PensionImageDto pidto) throws Exception{
		Connection con = getConnection();
		String sql = "INSERT INTO pension_image VALUES(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, pidto.getPen_image_no());
		ps.setInt(2, pidto.getPen_image_pen_no());
		ps.setString(3, pidto.getPen_image_name());
		ps.setLong(4, pidto.getPen_image_size());
		ps.setString(5, pidto.getPen_image_type());
		
		ps.execute();
		con.close();
	}
	
	//펜션 삭제 메소드
	public void delete(int pension_no)throws Exception{
		
	}
}
