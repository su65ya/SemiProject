package semi.servlet.reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.ReservationFlowDao;
import semi.beans.dto.ReservationStep2Dto;
@WebServlet(urlPatterns="/member/reservation_step2.do")
public class ReservationStep2Servlet extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	try {
		//입력
		int reservation_no = Integer.parseInt(req.getParameter("reservation_no"));
		
		ReservationFlowDao redao = new ReservationFlowDao();
		String[] step2 = req.getParameterValues("res_info");
		for(int i = 0;i<step2.length;i++) {
			String step2_str = step2[i];
			if(step2_str.length()>0) {
				String step2_split[] = step2[i].split("/");
				int room_no = Integer.parseInt(step2_split[0]);
				String res_date_year = step2_split[1];
				String res_date_month = step2_split[2];
				String res_date_day = step2_split[3];
				int reservation_price = Integer.parseInt(step2_split[4]);
				
				ReservationStep2Dto redto = new ReservationStep2Dto();
				redto.setRoom_no(room_no);
				redto.setReservation_date(res_date_year+"-"+res_date_month+"-"+res_date_day);
				redto.setReservation_price(reservation_price);
				redto.setReservation_no(reservation_no);
				
				redao.save(redto);
			}
		}
		
//		resp.sendRedirect("option_info.jsp");
		System.out.println("step2완료");
		
		//처리
		//출력
		resp.sendRedirect("option_info.jsp?reservation_no="+reservation_no);
		
	} catch (Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
