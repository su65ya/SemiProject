package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import semi.beans.dto.ReservationOptionInfoDto;

public class ReservationOptionInfoDao {
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

	// 옵션정보 저장 메소드
	public void save(ReservationOptionInfoDto ridto) throws Exception {
		Connection con = getConnection();
		String sql = "INSERT INTO option_info VALUES(?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, ridto.getPension_no());
		ps.setInt(2, ridto.getRes_room_no());
		ps.setString(3, ridto.getRes_room_name());
		ps.setString(4, ridto.getFire());
		ps.setString(5, ridto.getAdult());
		ps.setString(6, ridto.getChildren());

		ps.execute();

		con.close();
	}

	// 옵션 정보 뽑아오는 메소드
	public ReservationOptionInfoDto get() throws Exception {
		Connection con = getConnection();
		String sql = "SELECT * FROM option_info";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		ReservationOptionInfoDto ridto = new ReservationOptionInfoDto();
		ridto.setPension_no(rs.getInt("pension_no"));
		ridto.setRes_room_no(rs.getInt("res_room_no"));
		ridto.setRes_room_name(rs.getString("res_room_name"));
		ridto.setFire(rs.getString("fire"));
		ridto.setAdult(rs.getString("adult"));
		ridto.setChildren(rs.getString("children"));
		
		con.close();
		return ridto;
	}

}
