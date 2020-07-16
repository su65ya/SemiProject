package semi.servlet.reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.ReservationFlowDao;
import semi.beans.dto.ReservationStep1Dto;
@WebServlet(urlPatterns="/member/reservation_step1.do")
public class ReservationStep1Servlet extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		ReservationFlowDao step1dao = new ReservationFlowDao();
		int seq = step1dao.getSequence();
		int pension_no = Integer.parseInt(req.getParameter("pension_no"));
		int member_no = Integer.parseInt(req.getParameter("member_no"));
		
		ReservationStep1Dto step1dto = new ReservationStep1Dto();
		step1dto.setReservation_no(seq);
		step1dto.setPension_no(pension_no);
		step1dto.setMember_no(member_no);

		
		//처리
		step1dao.regist(step1dto);
		
		resp.sendRedirect("room_list.jsp?pension_no="+pension_no+"&reservation_no="+seq);
		System.out.println("step1완료");

	} catch (Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
