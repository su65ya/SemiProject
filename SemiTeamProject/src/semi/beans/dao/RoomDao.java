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

import semi.beans.dto.LiveSearchDto;
import semi.beans.dto.RoomDto;
import semi.beans.dto.RoomImgViewDto;

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
		
		String sql = "INSERT INTO room values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, rdto.getRoom_no());
		ps.setInt(2,rdto.getRoom_pension_no());
		ps.setString(3,rdto.getRoom_name());
		ps.setString(4,rdto.getRoom_type());
		ps.setInt(5,rdto.getStandard_people());
		ps.setInt(6,rdto.getMax_people());
		ps.setInt(7,rdto.getRoom_width());
		ps.setInt(8,rdto.getToilet_count());
		ps.setInt(9,rdto.getOff_weekday());
		ps.setInt(10,rdto.getOff_weekend());
		ps.setInt(11,rdto.getOn_weekday());
		ps.setInt(12,rdto.getOn_weekend());
		ps.setInt(13,rdto.getAmenity());
		ps.setInt(14,rdto.getMicrowave());
		ps.setInt(15,rdto.getBed());
		ps.setInt(16,rdto.getTv());
		ps.setInt(17,rdto.getRoom_sofa());
		ps.setInt(18,rdto.getRoom_aircon());
		ps.setInt(19,rdto.getFridge());
		ps.setInt(20,rdto.getTub());
		ps.setInt(21,rdto.getHairdryer());
		ps.setInt(22,rdto.getCookoo());
		ps.setInt(23,rdto.getDog());
		
		ps.execute();

		con.close();
	}

	// 객실 리스트 메소드
	public List<RoomDto> getList(int room_pension_no) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT * FROM room WHERE  room_pension_no = ? ORDER BY room_no ASC";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, room_pension_no);
		ResultSet rs = ps.executeQuery();

		List<RoomDto> list = new ArrayList<>();
		while (rs.next()) {
			RoomDto rdto = new RoomDto(rs);
			list.add(rdto);
		}
		con.close();
		return list;
	}

	// 객실 삭제 메소드
	public void delete(int room_no) throws Exception {
		Connection con = getConnection();

		String sql = "DELETE room WHERE room_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, room_no);
		ps.execute();

		con.close();

	}
	//객실 단일조회 메소드
	public RoomDto get(int room_no) throws Exception{
		Connection con = getConnection();
		String sql = "SELECT * FROM room WHERE room_no=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, room_no);
		ResultSet rs = ps.executeQuery();
		RoomDto rdto;
		if (rs.next()) {
			rdto = new RoomDto(rs);
		} else {
			rdto = null;
		}

		con.close();
		return rdto;
	}

	// 그 펜션의 최대 가격
	public int maxPrice(int room_pension_no) throws Exception {
		Connection con = getConnection();
		String sql = "SELECT MAX(ON_WEEKEND) FROM room WHERE ROOM_PENSION_NO = ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, room_pension_no);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int price = rs.getInt(1);
		
		con.close();
		return price;

	}
	// 그 펜션의 최소 가격
	public int minPrice(int room_pension_no) throws Exception {
		Connection con = getConnection();
		String sql = "SELECT MIN(OFF_WEEKDAY) FROM room WHERE ROOM_PENSION_NO = ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, room_pension_no);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int price = rs.getInt(1);
		
		con.close();
		return price;
	}
	
	public RoomImgViewDto getImgView(int room_pension_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM room_img WHERE room_pension_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, room_pension_no);
		ResultSet rs = ps.executeQuery();
		
		RoomImgViewDto rivdto;
		if(rs.next()) {
			rivdto = new RoomImgViewDto(rs);
		}else {
			rivdto = null;
		}
		con.close();
		return rivdto;
		
		
	}
	
	public int getSequence() throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT room_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		
		con.close();
		return seq;
	}
}
