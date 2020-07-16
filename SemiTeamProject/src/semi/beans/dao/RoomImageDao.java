package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import semi.beans.dto.RoomImageDto;

public class RoomImageDao {
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

	// 사진저장메소드
	public void save(RoomImageDto ridto) throws Exception {
		Connection con = getConnection();

		String sql = "INSERT INTO room_image VALUES(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, ridto.getRoom_image_no());
		ps.setInt(2, ridto.getRoom_image_room_no());
		ps.setString(3, ridto.getRoom_image_name());
		ps.setLong(4, ridto.getRoom_image_size());
		ps.setString(5, ridto.getRoom_image_type());
		
		ps.execute();
		con.close();
	}
	
	//객실 이미지 가져오기
	public RoomImageDto get(int room_image_no) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM room_image WHERE room_image_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, room_image_no);
		ResultSet rs = ps.executeQuery();
		RoomImageDto ridto;
		if(rs.next()) {
			ridto = new RoomImageDto(rs);
		}else {
			ridto=null;
		}
		con.close();
		return ridto;
	}

	
	public int getSequence() throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT room_image_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		
		con.close();
		return seq;
	}

	

}
