package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import semi.beans.dto.ReviewFileDto;

public class ReviewFileDao {
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
	
	//리뷰파일 시퀀스 미리 생성
	public int getSequence() throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT review_file_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		int seq = rs.getInt(1);
		
		con.close();
		return seq;
	}
	
	//리뷰파일 저장
	public void save(ReviewFileDto rfdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "INSERT INTO review_file VALUES(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, rfdto.getReview_file_no());
		ps.setInt(2, rfdto.getReview_origin());
		ps.setString(3, rfdto.getReview_file_name());
		ps.setLong(4, rfdto.getReview_file_size());
		ps.setString(5, rfdto.getReview_file_type());
		
	}


}
