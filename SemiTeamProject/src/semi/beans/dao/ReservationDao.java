package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import semi.beans.dto.ReservationDto;

public class ReservationDao {
	
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
	
	// 연결 메소드
	public Connection getConnection() throws Exception {
		return src.getConnection();
	}
	
	// 시퀀스 생성 메소드
	public int getSequence() throws Exception {
		Connection con = getConnection();
		String sql ="select res_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		con.close();
		return seq;
	}
	
	// 예약 리스트 메소드
	public List<ReservationDto> getList(int res_write) throws Exception {
		Connection con = getConnection();
		
		String sql = "select * from reservation where res_write = ? order by res_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, res_write);
		ResultSet rs = ps.executeQuery();
		
		List<ReservationDto> list = new ArrayList<>();
		while (rs.next()) {
			ReservationDto rvdto = new ReservationDto(rs);
			
			list.add(rvdto);
		}
		
		con.close();
		return list;
	}
	
	// 예약 단일 조회
	public ReservationDto get(int res_no) throws Exception {
		Connection con = getConnection();
		
		String sql = "select * from reservation where res_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, res_no);
		ResultSet rs = ps.executeQuery();

		ReservationDto rvdto = null;
		if (rs.next()) {
			rvdto = new ReservationDto(rs);
		}
		
		con.close();
		return rvdto;		
	}
	
	
	// 예약 등록 메소드
	public void reservation(ReservationDto redto)throws Exception{
		Connection con = getConnection();
		String sql = "INSERT INTO reservation VALUES(?,?,?,?,?,?,?,?,?)";
		
		con.close();
	}
	

}
