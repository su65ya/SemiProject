package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.Format;
import java.text.SimpleDateFormat;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
			
			String sql = "INSERT INTO review_reply VALUES(review_reply_seq.nextval, ?, ?, ?, sysdate)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, rrdto.getReply_writer());
			ps.setInt(2, rrdto.getReply_origin());
			ps.setString(3, rrdto.getReply_content());
			ps.execute();
			
			con.close();
		}
		
		public List<ReviewReplyDto> getList(int reply_origin) throws Exception{
			Connection con = getConnection();

			String sql = "SELECT * FROM review_reply WHERE reply_origin=?ORDER BY reply_no DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, reply_origin);
			ResultSet rs = ps.executeQuery();

			List<ReviewReplyDto> list = new ArrayList<>();
			while (rs.next()) {
				ReviewReplyDto rrdto = new ReviewReplyDto(rs);
				list.add(rrdto);
			}

			con.close();
			return list;
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
	
	public String getReplyId(int reply_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT member_id from (SELECT * FROM member m INNER JOIN review_reply r ON m.member_no = r.reply_writer)WHERE reply_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reply_no);
		ResultSet rs = ps.executeQuery();
		String member_id;
		if(rs.next()) {
			member_id = rs.getString(1);
		}else {
			member_id = null;
		}
		
		
		con.close();
		return member_id;
	}

	public void delete(int reply_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "DELETE review_reply WHERE reply_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reply_no);
		ps.execute();
		
		con.close();
		
	}

	public void replyedit(ReviewReplyDto rrdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "update review_reply set reply_content = ? where reply_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, rrdto.getReply_content());
		ps.setInt(2, rrdto.getReply_no());
		ps.execute();
		
		con.close();		
	}
	
	
	
	
}
