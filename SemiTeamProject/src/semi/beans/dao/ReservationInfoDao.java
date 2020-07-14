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

import semi.beans.dto.ReservationInfoDto;

public class ReservationInfoDao {
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
	//테이블 만드는 메소드
	public void create()throws Exception{
		Connection con = getConnection();
		String sql = "CREATE TABLE reservation_info(" + 
				"	pension_no NUMBER NOT NULL," + 
				"	member_no NUMBER NOT NULL," + 
				"	member_id varchar2(20) NOT NULL," + 
				"	res_room_no NUMBER NOT null," + 
				"	res_room_name varchar2(21) NOT null," + 
				"	res_date varchar2(10) NOT NULL," + 
				"	res_room_price varchar2(8) NOT null" + 
				")";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.execute();
		con.close();
	}
	
	//테이블 삭제하는 메소드
	public void drop() throws Exception{
		Connection con = getConnection();
		String sql = "DROP TABLE reservation_info";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.execute();
		con.close();
	}

	//체크한 예약을 저장하는 메소드
	public void save(ReservationInfoDto ridto) throws Exception {
		Connection con = getConnection();
		String sql = "INSERT INTO reservation_info VALUES(?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, ridto.getPension_no());
		ps.setInt(2, ridto.getMember_no());
		ps.setString(3, ridto.getMember_id());
		ps.setInt(4, ridto.getRes_room_no());
		ps.setString(5, ridto.getRes_room_name());
		ps.setString(6, ridto.getRes_date());
		ps.setString(7, ridto.getRes_room_price());
		
		ps.execute();
		con.close();
	}
	
	public List<ReservationInfoDto> getList()throws Exception{
		Connection con = getConnection();
		String sql = "SELECT * FROM reservation_info";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<ReservationInfoDto> list = new ArrayList<ReservationInfoDto>();
		while(rs.next()) {
			ReservationInfoDto rdto = new ReservationInfoDto();
			rdto.setPension_no(rs.getInt("pension_no"));
			rdto.setMember_no(rs.getInt("member_no"));
			rdto.setMember_id(rs.getString("member_id"));
			rdto.setRes_room_no(rs.getInt("res_room_no"));
			rdto.setRes_room_name(rs.getString("res_room_name"));
			rdto.setRes_date(rs.getString("res_date"));
			rdto.setRes_room_price(rs.getString("res_room_price"));
			
			list.add(rdto);
		}
		con.close();
		return list;
	}
	
}
