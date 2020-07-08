package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import semi.beans.dto.MemberDto;

public class MemberDao {
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

	// 회원 가입 메소드
	public void join(MemberDto mdto) throws Exception {
		Connection con = getConnection();

		String sql = "INSERT INTO member VALUES(member_seq.nextval,?,?,?,?,?,?,?,?,?,'일반',sysdate)";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getMember_id());
		ps.setString(2, mdto.getMember_pw());
		ps.setString(3, mdto.getMember_name());
		ps.setString(4, mdto.getMember_birth());
		ps.setString(5, mdto.getMember_mail());
		ps.setString(6, mdto.getMember_post());
		ps.setString(7, mdto.getMember_basic_addr());
		ps.setString(8, mdto.getMember_detail_addr());
		ps.setString(9, mdto.getMember_phone());

		ps.execute();

		con.close();
	}

	// 회원 로그인 메소드
	public MemberDto login(MemberDto mdto) throws Exception {
		Connection con = getConnection();

		String sql = "select * from member where member_id = ? and member_pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getMember_id());
		ps.setString(2, mdto.getMember_pw());
		ResultSet rs = ps.executeQuery();

		MemberDto user = null;
		if (rs.next()) {
			user = new MemberDto(rs);
		}

		con.close();
		return user;
	}
	

	//사용자 비밀번호 변경
	public void changePassword(MemberDto mdto) throws Exception {
		Connection con = getConnection();
		
		String sql = "UPDATE member SET member_pw=? WHERE member_id=?";
		 PreparedStatement ps = con.prepareStatement(sql);
		 ps.setString(1, mdto.getMember_pw());
		 ps.setString(2, mdto.getMember_id());
		 ps.execute();
		 
		con.close();
	}

	// 사용자 정보 변경
	public void changeINfo(MemberDto mdto) throws Exception {
		Connection con = getConnection();
		
		String sql = "UPDATE member SET "
				+ "member_birth=?, member_mail=?, member_post=?, member_basic_addr=? member_detail_addr=? "
				+ "WHETE member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getMember_birth());
		ps.setString(2, mdto.getMember_mail());
		ps.setString(3, mdto.getMember_post());
		ps.setString(4, mdto.getMember_basic_addr());
		ps.setString(5, mdto.getMember_detail_addr());
		ps.setString(6, mdto.getMember_id());
				
		con.close();
	}

	//아이디 찾기 메소드
	
	public String findId(MemberDto mdto) throws Exception{
		Connection con = getConnection();

		String sql = "SELECT member_id FROM member WHERE member_name=? and member_phone=? and member_birth=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getMember_name());
		ps.setString(2, mdto.getMember_phone());
		ps.setString(3, mdto.getMember_birth());
		ResultSet rs = ps.executeQuery();
		
//		String member_id = 추출한 아이디 or null;
		String member_id;
		if(rs.next()) {
			member_id = rs.getString("member_id");
		}
		else {
			member_id = null;
		}
		
		con.close();
		
		return member_id;

	}
	


	// 맴버 탈퇴 메소드
	public void delete(String member_id) throws Exception {
		Connection con = getConnection();

		String sql = "DELETE member WHERE member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, member_id);
		ps.execute();

		con.close();

	}


}
