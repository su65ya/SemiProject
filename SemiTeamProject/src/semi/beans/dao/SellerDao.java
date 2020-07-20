package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



import semi.beans.dto.SellerDto;
import semi.beans.dto.SellerStatisticsDto;

public class SellerDao {
	
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
	
	// 단일 조회 메소드
	public SellerDto get(int seller_no) throws Exception {
		Connection con = getConnection();
		
		String sql = "select * from seller where seller_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, seller_no);
		ResultSet rs = ps.executeQuery();
		
		SellerDto seller = null;
		if (rs.next()) {
			seller = new SellerDto(rs);
		}
		
		con.close();
		return seller;
	}
	
	// 단일 조회 메소드
	public SellerDto get(String seller_id) throws Exception {
		Connection con = getConnection();
		
		String sql = "select * from seller where seller_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, seller_id);
		ResultSet rs = ps.executeQuery();
		
		SellerDto seller = null;
		if (rs.next()) {
			seller = new SellerDto(rs);
		}
		
		con.close();
		return seller;
	}
	
	
	// 판매자 가입
	public void join(SellerDto sdto) throws Exception {
		Connection con = getConnection();
		
		String sql ="insert into seller values (seller_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, sdto.getSeller_id());
		ps.setString(2, sdto.getSeller_pw());
		ps.setString(3, sdto.getSeller_name());
		ps.setString(4, sdto.getSeller_birth());
		ps.setString(5, sdto.getSeller_phone());
		ps.setString(6, sdto.getSeller_email());
		ps.setString(7, sdto.getSeller_post());
		ps.setString(8, sdto.getSeller_basic_addr());
		ps.setString(9, sdto.getSeller_detail_addr());
		ps.setString(10, sdto.getCompany_no());
		ps.execute();
		
		
		con.close();
	}
	
	
	// 판매자 로그인
	public SellerDto login(SellerDto sdto) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM seller WHERE seller_id = ? AND seller_pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, sdto.getSeller_id());
		ps.setString(2, sdto.getSeller_pw());
		
		ResultSet rs = ps.executeQuery();
		
		SellerDto seller;
		if (rs.next()) {
			seller = new SellerDto(rs);
		}
		else {
			seller = null;
		}
		
		con.close();
		return seller;
	}
	
	//판매자 정보변경
	public void changeInfo(SellerDto sdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "UPDATE seller SET "
				+"seller_name = ?, seller_email = ?, seller_birth = ?, seller_post = ?, seller_basic_addr = ?, seller_detail_addr = ?, seller_phone = ? "
				+"WHERE seller_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, sdto.getSeller_name());
		ps.setString(2, sdto.getSeller_email());
		ps.setString(3, sdto.getSeller_birthday());
		ps.setString(4, sdto.getSeller_post());
		ps.setString(5, sdto.getSeller_basic_addr());
		ps.setString(6, sdto.getSeller_detail_addr());
		ps.setString(7, sdto.getSeller_phone());
		ps.setInt(8, sdto.getSeller_no());
		
		ps.execute();
		
	
		con.close();
	}
	
	// pw 변경
	public void pwChange(SellerDto sdto) throws Exception {
		Connection con = getConnection();
		
		String sql = "update seller set seller_pw = ? where seller_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, sdto.getSeller_pw());
		ps.setInt(2, sdto.getSeller_no());
		ps.execute();
		
		con.close();
	}
	
	
	// 판매자 탈퇴
	public void delete(String seller_id) throws Exception {
		Connection con = getConnection();
		
		String sql = "DELETE seller WHERE seller_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, seller_id);
		ps.execute();
		
		con.close();
	}

	
	//(관리자) 판매자 리스트 기능 (모든 판매자 보기)
	public List<SellerDto> search() throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM seller ORDER BY seller_no DESC";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<SellerDto> list = new ArrayList<>();
		while(rs.next()) {
			SellerDto sdto = new SellerDto(rs);
			list.add(sdto);
		}
		con.close();
		return list;
	}
	
	// (관리자) 판매자 검색 기능 (타입추가)
	public List<SellerDto> search(String type, String keyword) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM seller WHERE instr(#1 , ?) > 0 ORDER BY #1 DESC";
		sql = sql.replace("#1", type);
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<SellerDto> list = new ArrayList<>();
		while(rs.next()) {
			SellerDto sdto = new SellerDto(rs);
			list.add(sdto);
		}
		
		con.close();
		return list;
	}
	
	// (관리자) 판매자 정보 수정
	public void editByAdmin(SellerDto sdto) throws Exception {
		Connection con = getConnection();
		
		String sql = "UPDATE seller SET "
							+ "seller_pw=?, seller_name=?, seller_birth=?, seller_email=?, seller_post=?, "
							+ "seller_basic_addr=?, seller_detail_addr=?, seller_phone=?, company_no=? "
							+ "WHERE seller_id=?";
		
//		String birth = sdto.getSeller_birth();
//
//		SimpleDateFormat original_format = new SimpleDateFormat("yyyy년 M월 d일");	
//		SimpleDateFormat new_format = new SimpleDateFormat("yyyy-MM-dd");
//		
//		Date original_birth = original_format.parse(birth);
//		String birthConvert = new_format.format(original_birth);
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, sdto.getSeller_pw());
		ps.setString(2, sdto.getSeller_name());
		ps.setString(3, sdto.getSeller_birthday());
		ps.setString(4, sdto.getSeller_email());
		ps.setString(5, sdto.getSeller_post());
		ps.setString(6, sdto.getSeller_basic_addr());
		ps.setString(7, sdto.getSeller_detail_addr());
		ps.setString(8, sdto.getSeller_phone());
		ps.setString(9, sdto.getCompany_no());
		ps.setString(10, sdto.getSeller_id());
		ps.execute();
		
		con.close();
	}
	
	// 판매자 아이디 조회 메소드
	public String findId(SellerDto sdto) throws Exception {
		Connection con = getConnection();
		
		String sql = "select seller_id from seller where seller_name = ? and seller_phone = ? and seller_birth = ? and company_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, sdto.getSeller_name());
		ps.setString(2, sdto.getSeller_phone());
		ps.setString(3, sdto.getSeller_birth());
		ps.setString(4, sdto.getCompany_no());
		ResultSet rs = ps.executeQuery();
		
		String seller_id = null;
		if(rs.next()) {
			seller_id = rs.getString("seller_id");
		}
		
		con.close();
		return seller_id;
	}
	
	// 판매자 pw 조회 메소드
	public String  findPw(SellerDto sdto) throws Exception {
		Connection con = getConnection();
		
		String sql = "select seller_pw from seller where seller_id = ? and seller_name = ? and seller_phone = ? and seller_birth = ? and company_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, sdto.getSeller_id());
		ps.setString(2, sdto.getSeller_name());
		ps.setString(3, sdto.getSeller_phone());
		ps.setString(4, sdto.getSeller_birth());
		ps.setString(5, sdto.getCompany_no());
		ResultSet rs = ps.executeQuery();
		
		String seller_pw = null;
		if (rs.next()) {
			seller_pw = rs.getString("seller_pw");
		}
		con.close();
		return seller_pw;
		
	}
	
	//펜션 별 매출 조회
	public List<SellerStatisticsDto> getMonthlyPrice(int seller_no) throws Exception {
		Connection con = getConnection();
		String sql = "SELECT DISTINCT A.PENSION_NAME, TO_CHAR(A.RES_DATE, 'YYYY-MM') RES_DATE, COUNT(*) CNT, SUM(A.RES_PRICE) SUM_PRICE FROM (SELECT p.PENSION_NO, p.PENSION_NAME ,r.ROOM_NAME ,res.RES_NO , res.RES_WRITE , res.RES_ROOM_NO , Res.RES_NAME , res.RES_DATE , res.RES_IN , res.RES_OUT , res.RES_PAYTYPE , nvl(res.RES_PRICE, 0) RES_PRICE FROM PENSION p LEFT OUTER JOIN ROOM r ON p.PENSION_NO =r.ROOM_PENSION_NO LEFT OUTER JOIN RESERVATION res ON r.ROOM_NO =res.RES_ROOM_NO WHERE res.RES_NO IS NOT NULL AND p.PENSION_SELLER_NO = ?) A GROUP BY A.PENSION_NAME, TO_CHAR(RES_DATE, 'YYYY-MM')ORDER BY PENSION_NAME";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, seller_no);
		ResultSet rs = ps.executeQuery();
		List<SellerStatisticsDto> list = new ArrayList<SellerStatisticsDto>(); 
		while(rs.next()) {
			SellerStatisticsDto ssdto = new SellerStatisticsDto();
			ssdto.setPension_name(rs.getString("pension_name"));
			ssdto.setRes_date(rs.getString("res_date"));
			ssdto.setCnt(rs.getInt("cnt"));
			ssdto.setSum_price(rs.getInt("sum_price"));
			
			list.add(ssdto);
		}
		con.close();
		return list;
	}

}









