package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import semi.beans.dto.ReviewReplyDto;

public class ReviewReplyDao {
	
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

	//등록
		public void replywrite(ReviewReplyDto rrdto) throws Exception{
			Connection con = getConnection();
			
			String sql = "INSERT INTO review_reply VALUES(reply_seq.nextval, ?, ?, sysdate, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, rrdto.getReply_writer());
			ps.setString(2, rrdto.getReply_content());
			ps.setInt(3, rrdto.getReply_origin());
			ps.execute();
			
			con.close();
		}
		
	public ReviewReplyDto get(int reply_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM review_reply WHERE reply_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reply_no);
		ResultSet rs = ps.executeQuery();
		ReviewReplyDto rrdto;
		if(rs.next()) {
			 rrdto = new ReviewReplyDto(rs);
		}else {
			rrdto=null;
		}
		
		con.close();
		return rrdto;
		
	}

	public void delete(int reply_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "DELETE review_reply WHERE reply_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reply_no);
		ps.execute();
		
		con.close();
		
	}
	
	
}
