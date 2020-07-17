package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import oracle.jdbc.proxy.annotation.Pre;
import semi.beans.dto.PenImgViewDto;
import semi.beans.dto.PensionDto;
import semi.beans.dto.PensionInfoDto;
import semi.beans.dto.SellerDto;

public class PensionDao {
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

	// 펜션 등록 메소드
	public void regist(PensionDto pdto) throws Exception {
		Connection con = getConnection();
		String sql = "INSERT INTO pension VALUES(?,?,?,?,?,?,sysdate,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, pdto.getPension_no());
		ps.setInt(2, pdto.getPension_seller_no());
		ps.setString(3, pdto.getPension_name());
		ps.setString(4, pdto.getPension_post());
		ps.setString(5, pdto.getPension_basic_addr());
		ps.setString(6, pdto.getPension_detail_addr());
		ps.setString(7, pdto.getPension_phone());
		ps.setString(8, pdto.getPension_intro());

		ps.execute();
		con.close();
	}

	// 펜션 시퀀스 미리 생성 메소드
	public int getSequence() throws Exception {
		Connection con = getConnection();

		String sql = "SELECT pension_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);

		con.close();

		return seq;
	}
	
	// 전체 펜션 리스트 메소드
	public List<PensionDto> getTotalList() throws Exception {
		Connection con = getConnection();

		String sql = "SELECT * FROM pension ORDER BY pension_no desc";

		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<PensionDto> list = new ArrayList<>();
		while (rs.next()) {
			PensionDto pdto = new PensionDto();
			pdto.setPension_no(rs.getInt("pension_no"));
			pdto.setPension_seller_no(rs.getInt("pension_seller_no"));
			pdto.setPension_name(rs.getString("pension_name"));
			pdto.setPension_post(rs.getString("pension_post"));
			pdto.setPension_basic_addr(rs.getString("pension_basic_addr"));
			pdto.setPension_detail_addr(rs.getString("pension_detail_addr"));
			pdto.setPension_phone(rs.getString("pension_phone"));
			pdto.setPension_regist_date(rs.getString("pension_regist_date"));
			pdto.setPension_intro(rs.getString("pension_intro"));

			list.add(pdto);
		}

		con.close();
		return list;

	}

	// 판매자 별 펜션 리스트 메소드
	public List<PensionDto> getList(int pension_seller_no) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT * FROM pension WHERE pension_seller_no =? ORDER BY pension_no ASC";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, pension_seller_no);
		ResultSet rs = ps.executeQuery();

		List<PensionDto> list = new ArrayList<>();
		while (rs.next()) {
			PensionDto pdto = new PensionDto();
			pdto.setPension_no(rs.getInt("pension_no"));
			pdto.setPension_seller_no(rs.getInt("pension_seller_no"));
			pdto.setPension_name(rs.getString("pension_name"));
			pdto.setPension_post(rs.getString("pension_post"));
			pdto.setPension_basic_addr(rs.getString("pension_basic_addr"));
			pdto.setPension_detail_addr(rs.getString("pension_detail_addr"));
			pdto.setPension_phone(rs.getString("pension_phone"));
			pdto.setPension_regist_date(rs.getString("pension_regist_date"));
			pdto.setPension_intro(rs.getString("pension_intro"));

			list.add(pdto);
		}

		con.close();
		return list;

	}
	
	// 펜션 리스트 메소드
	public List<PensionDto> getList() throws Exception {
		Connection con = getConnection();

		String sql = "SELECT * FROM pension ORDER BY pension_no ASC";

		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<PensionDto> list = new ArrayList<>();
		while (rs.next()) {
			PensionDto pdto = new PensionDto();
			pdto.setPension_no(rs.getInt("pension_no"));
			pdto.setPension_seller_no(rs.getInt("pension_seller_no"));
			pdto.setPension_name(rs.getString("pension_name"));
			pdto.setPension_post(rs.getString("pension_post"));
			pdto.setPension_basic_addr(rs.getString("pension_basic_addr"));
			pdto.setPension_detail_addr(rs.getString("pension_detail_addr"));
			pdto.setPension_phone(rs.getString("pension_phone"));
			pdto.setPension_regist_date(rs.getString("pension_regist_date"));
			pdto.setPension_intro(rs.getString("pension_intro"));

			list.add(pdto);
		}

		con.close();
		return list;

	}
	
	//펜션 이미지뷰 포함 목록 메소드
	public PenImgViewDto getListWithImg(int pension_no)throws Exception{
		Connection con = getConnection();
		String sql = "SELECT * FROM pen_img WHERE pension_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, pension_no);
		ResultSet rs = ps.executeQuery();

		PenImgViewDto viewDto;
		if(rs.next()) {
			viewDto  = new PenImgViewDto();
			viewDto.setPension_seller_no(rs.getInt("pension_seller_no"));
			viewDto.setPension_no(rs.getInt("pension_no"));
			viewDto.setPension_name(rs.getString("pension_name"));
			viewDto.setPension_regist_date(rs.getString("pension_regist_date"));
			viewDto.setPen_img_no(rs.getInt("pen_image_no"));
			viewDto.setPen_image_pen_no(rs.getInt("pen_image_pen_no"));
			viewDto.setPen_image_name(rs.getString("pen_image_name"));
			viewDto.setPen_image_size(rs.getLong("pen_image_size"));
			viewDto.setPen_image_type(rs.getString("pen_image_type"));

		}else {
			viewDto = null;
		}
		con.close();
		return viewDto;
		
	}

	// 펜션 삭제
	public void delete(int pension_no) throws Exception {
		Connection con = getConnection();
		String sql = "DELETE pension WHERE pension_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, pension_no);
		ps.execute();

		con.close();
	}

	// 펜션 단일조회 메소드
//	public PensionDto get(int pension_no) throws Exception {
//		Connection con = getConnection();
//		
//		String sql = "select * from pension where pension_no = ?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setInt(1, pension_no);
//		ResultSet rs = ps.executeQuery();
//		
//		PensionDto pdto;
//		if (rs.next()) {
//			pdto = new PensionDto(rs);
//		}else {
//			pdto=null;
//		}
//		
//		con.close();
//		return pdto;
//	}

	
	public PensionInfoDto get(int pension_no) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT * FROM pension_info WHERE pension_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, pension_no);
		ResultSet rs = ps.executeQuery();
		
		PensionInfoDto pidto;
		if(rs.next()) {
			pidto = new PensionInfoDto();
			pidto.setPension_no(pension_no);
			pidto.setPension_seller_no(rs.getInt("pension_seller_no"));
			pidto.setSeller_id(rs.getString("seller_id"));
			pidto.setPension_name(rs.getString("pension_name"));
			pidto.setPension_post(rs.getString("pension_post"));
			pidto.setPension_basic_addr(rs.getString("pension_basic_addr"));
			pidto.setPension_detail_addr(rs.getString("pension_detail_addr"));
			pidto.setPension_intro(rs.getString("pension_intro"));
			pidto.setPension_phone(rs.getString("pension_phone"));
			pidto.setPension_regist_date(rs.getString("pension_regist_date"));
			
		}else {
			pidto = null;
		}
		con.close();
		return pidto;
	}

	// 펜션 정보 수정
	public void edit(PensionDto pdto) throws Exception {
		Connection con = getConnection();
		String sql = "UPDATE pension SET pension_name=? , pension_post=?, pension_basic_addr=?,pension_detail_addr=?,pension_phone=?,pension_intro=? WHERE pension_no=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, pdto.getPension_name());
		ps.setString(2, pdto.getPension_post());
		ps.setString(3, pdto.getPension_basic_addr());
		ps.setString(4, pdto.getPension_detail_addr());
		ps.setString(5, pdto.getPension_phone());
		ps.setString(6, pdto.getPension_intro());
		ps.setInt(7, pdto.getPension_no());

		ps.execute();
		con.close();
	}

	//펜션 검색 메소드
	public List<PensionDto> getList(String location) throws Exception{
		Connection con = getConnection();
		String sql = "SELECT * FROM pension WHERE instr(pension_basic_addr,? ) > 0 ORDER BY pension_no DESC";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, location);
		ResultSet rs = ps.executeQuery();
		List<PensionDto> list = new ArrayList<PensionDto>();
		while(rs.next()) {
			PensionDto pdto = new PensionDto(rs);
			list.add(pdto);
		}
		con.close();
		return list;
	
	}
}
	
