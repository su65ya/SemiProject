package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
	//연결메소드
	public Connection getConnection() throws Exception {
		return src.getConnection();
	}
	//사진저장메소드
	public void save(RoomImageDto ridto) throws Exception{
		Connection con = getConnection();
		
		String sql="INSERT INTO room_image VALUES(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, ridto.getRoom_image_no());
		ps.setInt(2, ridto.getRoom_image_room_no());
		ps.setString(3, ridto.getRoom_image_name());
		ps.setLong(4, ridto.getRoom_image_size());
		ps.setString(5, ridto.getRoom_image_type());
		ps.execute();
		con.close();
	}
}
