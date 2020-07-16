package semi.servlet.reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.ReservationFlowDao;
import semi.beans.dto.ReservationStep3Dto;


@WebServlet(urlPatterns = "/member/reservation_step3.do")
public class ReservationStep3Servlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 입력
			String reservation_no = req.getParameter("reservation_no");
			String step2_no[] = req.getParameterValues("step2_no");
			String bbq[] = req.getParameterValues("bbq");
			String adult[] = req.getParameterValues("adult");
			String children[] = req.getParameterValues("children");
			ReservationFlowDao rdao = new ReservationFlowDao();
			
			for(int i = 0; i<step2_no.length;i++) {
				ReservationStep3Dto step3 = new ReservationStep3Dto();
					step3.setBbq(bbq[i]);
					step3.setAdult(adult[i]);
					step3.setChildren(children[i]);
					step3.setStep2_no(Integer.parseInt(step2_no[i]));
					
					rdao.save(step3);
					System.out.println("step3 완료"+i);
			}
			resp.sendRedirect("reservation.jsp?reservation_no="+reservation_no);
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
