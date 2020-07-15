package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import semi.beans.dto.AdminDto;

public class AdminDao {
	
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
	
	// 아이디 조회
	public AdminDto getNo(int admin_no) throws Exception{
		Connection con = getConnection();
			
		String sql = "SELECT * FROM admin WHERE admin_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, admin_no);
		ResultSet rs = ps.executeQuery();
		AdminDto adto;
		if(rs.next()) {
			adto = new AdminDto(rs);
		}else {
			adto = null;
		}
			
		con.close();
			
		return adto;
	}
	
	// 아이디 조회
	public AdminDto get(String admin_id) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM admin WHERE admin_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, admin_id);
		ResultSet rs = ps.executeQuery();
		AdminDto adto;
		if(rs.next()) {
			adto = new AdminDto(rs);
		}else {
			adto = null;
		}
		
		con.close();
		
		return adto;
	}
	//관리자 가입
	public void join(AdminDto adto) throws Exception{
		Connection con = getConnection();
		
		String sql = "INSERT into admin values(admin_seq.nextval,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, adto.getAdmin_id());
		ps.setString(2, adto.getAdmin_pw());
		ps.setString(3, adto.getAdmin_phone());
		ps.setString(4, adto.getAdmin_mail());
		ps.setString(5, adto.getAdmin_birth());
		ps.execute();
		
		con.close();	
		
	}
	
	//관리자 로그인
	public AdminDto login(AdminDto adto) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM admin WHERE admin_id = ? AND admin_pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, adto.getAdmin_id());
		ps.setString(2, adto.getAdmin_pw());
		
		ResultSet rs = ps.executeQuery();
		
		AdminDto admin;
		if (rs.next()) {
			admin = new AdminDto(rs);
		}
		else {
			admin = null;
		}
		
		con.close();
		return admin;
	}
}

