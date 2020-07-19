package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import semi.beans.dto.QuestionDto;
import semi.beans.dto.QuestionViewDto;
import semi.beans.dto.ReviewDto;
import semi.beans.dto.RoomImgViewDto;

public class ReviewDao {
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
	
	public int getSequence() throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT review_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		int seq = rs.getInt(1);
		
		con.close();
		return seq;
	}

	public void write(ReviewDto revdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "INSERT INTO review VALUES(?,?, ?,?,?,?,sysdate,0)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, revdto.getReview_no());
		ps.setInt(2, revdto.getReview_writer());
		ps.setInt(3, revdto.getReview_pension_no());
		ps.setInt(3,revdto.getReview_res_no());
		ps.setString(4, revdto.getReview_title());
		ps.setString(5, revdto.getReview_content());
		ps.execute();
		
		con.close();
	}
	
	public List<ReviewDto> getList(int review_pension_no, int start, int finish)throws Exception{
		Connection con = getConnection();
		
		String sql ="select * from (select rownum rn, T.* from ( select * from review where review_pension_no = ? order by review_no desc )T ) where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, review_pension_no);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		ResultSet rs = ps.executeQuery();
		
		List<ReviewDto> list = new ArrayList<>();
		while(rs.next()) {
			ReviewDto revdto = new ReviewDto(rs);
			
			list.add(revdto);
		}
		
		con.close();
		return list;
	}
	// 게시글 개수
		public int getCount() throws Exception {
			Connection con = getConnection();
			
			String sql ="select count(*) from review";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			int count = rs.getInt(1);
			
			con.close();
			return count;
		}
		
		public int getSearch(String type, String keyword) throws Exception {
			Connection con = getConnection();
			
			String sql ="select count(*) from review where instr(#1, ?) > 0";
			sql = sql.replace("#1", type);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, keyword);
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			int count = rs.getInt(1);
			
			con.close();
			return count;
		}
		
		// 펜션 별 리뷰 검색 리스트
		public List<ReviewDto> search(int review_pension_no, String type, String keyword, int start, int finish) throws Exception {
			Connection con = getConnection();

			String sql ="select * from (select rownum rn, T.* from (select * from review where review_pension_no = ? and instr(#1, ?) > 0 order by review_no desc)T ) where rn between ? and ?";
			sql = sql.replace("#1", type);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, review_pension_no);
			ps.setString(2, keyword);
			ps.setInt(3, start);
			ps.setInt(4, finish);
			ResultSet rs = ps.executeQuery();
			
			List<ReviewDto> list = new ArrayList<>();
			while(rs.next()) {
				ReviewDto revdto = new ReviewDto(rs);
				
				list.add(revdto);
			}
			
			con.close();
			return list;
			
		}
		
		// 단일 조회
		public ReviewDto get(int review_no) throws Exception {
			Connection con = getConnection();
			
			String sql = "select * from review where review_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, review_no);
			ResultSet rs = ps.executeQuery();
			
			ReviewDto revdto = rs.next() ? new ReviewDto(rs) : null;
			
			
			con.close();
			return revdto;
		}
		
		public String getId(int review_no) throws Exception {
			Connection con = getConnection();
			
			String sql = "SELECT member_id from (SELECT * FROM member m INNER JOIN review r ON m.member_no = r.review_writer)WHERE review_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, review_no);
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
		
		// 조회수 메소드
		public void viewCount(int review_no, int review_writer) throws Exception {
			Connection con = getConnection();
			
			String sql = "update review set review_count = review_count + 1 where review_no = ? and review_writer != ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, review_no);
			ps.setInt(2, review_writer);
			ps.execute();
			
			
			con.close();
		}
		
		// 수정 메소드
		public void edit(ReviewDto revdto) throws Exception {
			Connection con = getConnection();
			
			String sql = "update review set review_title = ?, review_content = ? where review_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, revdto.getReview_title());
			ps.setString(2, revdto.getReview_content());
			ps.setInt(3, revdto.getReview_no());
			ps.execute();
			
			con.close();
		}
	

		public void delete(int review_no) throws Exception{
			Connection con = getConnection();
			
			String sql = "DELETE review WHERE review_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, review_no);
			ps.execute();
			
			con.close();
		}
		
		
	
	
	
	
	
	
	
}
