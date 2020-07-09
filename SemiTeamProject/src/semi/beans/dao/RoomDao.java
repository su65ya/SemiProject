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

import semi.beans.dto.RoomDto;

public class RoomDao {

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

	public void regist(RoomDto rdto) throws Exception {
		Connection con = getConnection();
		
		String sql = "INSERT INTO room values(room_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1,rdto.getRoom_pension_no());
		ps.setString(2,rdto.getRoom_name());
		ps.setString(3,rdto.getRoom_type());
		ps.setInt(4,rdto.getStandard_people());
		ps.setInt(5,rdto.getMax_people());
		ps.setInt(6,rdto.getRoom_width());
		ps.setInt(7,rdto.getToilet_count());
		ps.setInt(8,rdto.getOff_weekday());
		ps.setInt(9,rdto.getOff_weekend());
		ps.setInt(10,rdto.getOn_weekday());
		ps.setInt(11,rdto.getOn_weekend());
		ps.setInt(12,rdto.getAmenity());
		ps.setInt(13,rdto.getMicrowave());
		ps.setInt(14,rdto.getBed());
		ps.setInt(15,rdto.getTv());
		ps.setInt(16,rdto.getRoom_sofa());
		ps.setInt(17,rdto.getRoom_aircon());
		ps.setInt(18,rdto.getFridge());
		ps.setInt(19,rdto.getTub());
		ps.setInt(20,rdto.getHairdryer());
		ps.setInt(21,rdto.getCookoo());
		ps.setInt(22,rdto.getDog());
		
		ps.execute();
		
		con.close();
	}
	
	public List<RoomDto> getList() throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM room ORDER BY room_no ASC";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<RoomDto> list = new ArrayList<>();
		while(rs.next()) {
			RoomDto rdto = new RoomDto(rs);
			list.add(rdto);
		}
		con.close();
		return list;
	}
}
