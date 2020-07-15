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

import oracle.net.nt.ConnStrategy;
import semi.beans.dto.ReservationStep1Dto;
import semi.beans.dto.ReservationStep2Dto;
import semi.beans.dto.ReservationStep3Dto;

public class ReservationFlowDao {

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

	// step1 등록 메소드
	public void regist(ReservationStep1Dto step1dto) throws Exception {
		Connection con = getConnection();
		String sql = "INSERT INTO reservation_step1 VALUES(?,?,?,sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, step1dto.getReservation_no());
		ps.setInt(2, step1dto.getPension_no());
		ps.setInt(3, step1dto.getMember_no());
		ps.execute();
		con.close();
	}

	// step1 시퀀스 미리 생성 메소드
	public int getSequence() throws Exception {
		Connection con = getConnection();
		String sql = "select step1_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		rs.next();
		int seq = rs.getInt(1);
		con.close();
		return seq;
	}

	// step2 등록 메소드
	public void save(ReservationStep2Dto step2dto) throws Exception {
		Connection con = getConnection();
		String sql = "INSERT INTO reservation_step2 VALUES(step1_seq.nextval,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, step2dto.getRoom_no());
		ps.setString(2, step2dto.getReservation_date());
		ps.setInt(3, step2dto.getReservation_no());
		ps.setInt(4, step2dto.getReservation_price());

		ps.execute();
		con.close();

	}

	// step2의 정보 출력 메소드
	public List<ReservationStep2Dto> getList(int reservation_no) throws Exception {
		Connection con = getConnection();
		String sql = "SELECT * FROM reservation_step2 WHERE reservation_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reservation_no);
		ResultSet rs = ps.executeQuery();
		List<ReservationStep2Dto> list = new ArrayList<ReservationStep2Dto>();
		while (rs.next()) {
			ReservationStep2Dto step2dto = new ReservationStep2Dto();
			step2dto.setStep2_no(rs.getInt("step2_no"));
			step2dto.setRoom_no(rs.getInt("room_no"));
			step2dto.setReservation_date(rs.getString("reservation_date"));
			step2dto.setReservation_price(rs.getInt("reservation_price"));
			step2dto.setReservation_no(reservation_no);

			list.add(step2dto);
		}
		con.close();
		return list;
	}
	
	//step3 등록 메소드
	public void save(ReservationStep3Dto step3dto) throws Exception{
		Connection con = getConnection();
		String sql = "INSERT INTO reservation_step3 VALUES(step3_seq.nextval,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, step3dto.getBbq());
		ps.setString(2, step3dto.getAdult());
		ps.setString(3, step3dto.getChildren());
		ps.setInt(4, step3dto.getStep2_no());
		ps.execute();
		con.close();
	}
}
