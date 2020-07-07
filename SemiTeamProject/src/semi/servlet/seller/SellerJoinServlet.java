package semi.servlet.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.SellerDao;
import semi.beans.dto.SellerDto;

@WebServlet (urlPatterns ="/seller/seller_join.do")
public class SellerJoinServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 입력
			SellerDto sdto = new SellerDto();
			sdto.setSeller_id(req.getParameter("seller_id"));
			sdto.setSeller_pw(req.getParameter("seller_pw"));
			sdto.setSeller_name(req.getParameter("seller_name"));
			sdto.setSeller_birth(req.getParameter("seller_birth"));
			sdto.setSeller_phone(req.getParameter("seller_phone"));
			sdto.setSeller_mail(req.getParameter("seller_mail"));
			sdto.setSeller_post(req.getParameter("seller_post"));
			sdto.setSeller_basic_addr(req.getParameter("seller_basic_addr"));
			sdto.setSeller_detail_addr(req.getParameter("seller_detail_addr"));
			sdto.setCompany_no(req.getParameter("company_no"));
			
			
			// 처리
			SellerDao sdao = new SellerDao();
			sdao.join(sdto);
			
			
			
			// 출럭
//			System.out.println("완료");
			resp.sendRedirect("seller_join_res.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}

}






