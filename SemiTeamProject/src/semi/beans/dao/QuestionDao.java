package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import semi.beans.dto.QuestionDto;

public class QuestionDao {
	
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
	
	// 문의 리스트
	public List<QuestionDto> getlist() throws Exception {
		Connection con = getConnection();
		
		String sql ="select * from question";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<QuestionDto> list = new ArrayList<>();
		while(rs.next()) {
			QuestionDto qdto = new QuestionDto(rs);
			
			list.add(qdto);
		}
		
		con.close();
		return list;
	}
	
	// 문의 검색 리스트
	public List<QuestionDto> search(String type, String keyword) throws Exception {
		Connection con = getConnection();
		
		String sql ="select * from question where instr(#1, ?) > 0";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<QuestionDto> list = new ArrayList<>();
		while(rs.next()) {
			QuestionDto qdto = new QuestionDto(rs);
			
			list.add(qdto);
		}
		
		con.close();
		return list;
		
	}
	
	
	// 문의번호 시퀀스 생성 메소드
	public int getSequance() throws Exception {
		Connection con = getConnection();
		
		String sql = "select que_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		int seq = rs.getInt(1);
		
		con.close();
		return seq;		
	}
	
	// 단일 조회
	public QuestionDto get(int que_no) throws Exception {
		Connection con = getConnection();
		
		String sql = "select * from question where que_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, que_no);
		ResultSet rs = ps.executeQuery();
		
		QuestionDto qdto = rs.next() ? new QuestionDto(rs) : null;
		
		
		con.close();
		return qdto;
	}
	
	
	// 문의 등록 메소드
	public void write(QuestionDto qdto) throws Exception {
		
		// 새 문의 글이라면 그룹에 문의 번호를 설정
		if (qdto.getSuper_no() == 0) {
			qdto.setGroup_no(qdto.getQue_no());
		}
		else {
			QuestionDto que_super = this.get(qdto.getSuper_no());
			
			qdto.setGroup_no(que_super.getGroup_no());
			qdto.setDepth(que_super.getDepth() + 1);;
		}
		
		Connection con = getConnection();
		
		String sql = "insert into question(que_no, que_head, que_title, que_content, que_write, super_no, group_no, depth) values (?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qdto.getQue_no());
		ps.setString(2, qdto.getQue_head());
		ps.setString(3, qdto.getQue_title());
		ps.setString(4, qdto.getQue_content());
		ps.setInt(5, qdto.getQue_write());
		
		if(qdto.getSuper_no() == 0) {
			ps.setNull(6, Types.INTEGER);
		}
		else {
			ps.setInt(6, qdto.getSuper_no());
		}
		
		ps.setInt(7, qdto.getGroup_no());
		ps.setInt(8, qdto.getDepth());
		ps.execute();

		con.close();
	}
	
	
	// 문의 삭제
	public void delete(int que_no) throws Exception {
		Connection con = getConnection();
		
		String sql = "delete question where que_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, que_no);
		ps.execute();
		
		con.close();		
	}
	

}
	
	
	
	
	
	
	
	
	
	
	
