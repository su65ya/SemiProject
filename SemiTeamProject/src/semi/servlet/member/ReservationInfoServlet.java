package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.ReservationInfoDao;
import semi.beans.dao.ReservationOptionInfoDao;
import semi.beans.dto.ReservationInfoDto;
import semi.beans.dto.ReservationOptionInfoDto;
@WebServlet(urlPatterns="/member/save_reservation_info.do")
public class ReservationInfoServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	try {
		//입력
		ReservationInfoDao redao = new ReservationInfoDao();
//		redao.create();
		
		String[] info = req.getParameterValues("res_info");
		for(int i = 0;i<info.length;i++) {
			String info_str = info[i];
			if(info_str.length()>0) {
				String info_split[] = info[i].split("/");
				int pension_no = Integer.parseInt(info_split[0]);
				int member_no = Integer.parseInt(info_split[1]);
				String member_id = info_split[2];
				int res_room_no = Integer.parseInt(info_split[3]);
				String res_room_name = info_split[4];
				String res_year = info_split[5];
				String res_month = info_split[6];
				String res_day = info_split[7];
				String res_room_price = info_split[8];
				System.out.println(info_split[0]);
				System.out.println(info_split[1]);
				System.out.println(info_split[2]);
				System.out.println(info_split[3]);
				System.out.println(info_split[4]);
				System.out.println(info_split[5]);
				System.out.println(info_split[6]);
				System.out.println(info_split[7]);
				
				ReservationInfoDto rdto = new ReservationInfoDto();
				rdto.setPension_no(pension_no);
				rdto.setMember_no(member_no);
				rdto.setMember_id(member_id);
				rdto.setRes_room_no(res_room_no);
				rdto.setRes_room_name(res_room_name);
				rdto.setRes_date(res_year+"-"+res_month+"-"+res_day);
				rdto.setRes_room_price(res_room_price);
				
				redao.save(rdto);
			}
			ReservationOptionInfoDao ridao = new ReservationOptionInfoDao();
			ReservationOptionInfoDto ridto = new ReservationOptionInfoDto();
			ridto.setPension_no(Integer.parseInt(req.getParameter("pension_no")));
			ridto.setRes_room_no(Integer.parseInt(req.getParameter("res_room_no")));
			ridto.setRes_room_name(req.getParameter("res_room_name"));
			ridto.setFire(req.getParameter("fire"));
			ridto.setAdult(req.getParameter("adult"));
			ridto.setChildren(req.getParameter("children"));
			
			ridao.save(ridto);
			
			 	
		}
		//처리
		//출력
		
		System.out.println("입력성공");
	} catch (Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
