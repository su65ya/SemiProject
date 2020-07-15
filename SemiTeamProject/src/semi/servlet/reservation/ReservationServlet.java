package semi.servlet.reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.ReservationDao;
import semi.beans.dto.ReservationDto;
@WebServlet(urlPatterns="/member/reservation.do")
public class ReservationServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		ReservationDao rdao = new ReservationDao();
		ReservationDto rdto = new ReservationDto();
		String res_info[] = req.getParameterValues("res_info");
		int res_write = Integer.parseInt(req.getParameter("res_write"));
		for(int i=0;i<res_info.length;i++) {
			String res[] = res_info[i].split("/");
			int seq = rdao.getSequence();
			rdto.setRes_no(seq);
			for(int j=0;j<res.length;j++) {
				rdto.setRes_room_no(Integer.parseInt(res[0]));
				rdto.setRes_in(res[1]);
				rdto.setRes_out(res[1]);
				rdto.setRes_price(Integer.parseInt(res[2]));
			}
			rdto.setRes_paytpye(req.getParameter("res_payment"));
			rdto.setRes_wirte(res_write);
			rdto.setRes_name(req.getParameter("res_name"));
			
			rdao.reservation(rdto);
//			System.out.println("예약완료"+i);
		}
		resp.sendRedirect("reservation_list.jsp?res_write="+res_write);
	} catch (Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
