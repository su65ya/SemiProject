package semi.servlet.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.SellerDao;
import semi.beans.dto.SellerDto;


@WebServlet(urlPatterns ="/seller/seller_login.do")
public class SellerLoginServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 입력
			SellerDto sdto = new SellerDto();
			sdto.setSeller_id(req.getParameter("seller_id"));
			sdto.setSeller_pw(req.getParameter("seller_pw"));
			
			// 처리
			SellerDao sdao = new SellerDao();
			SellerDto seller = sdao.login(sdto);
			
			
			// 출력
			if (seller != null) {
				req.getSession().setAttribute("sellerinfo", seller);
				resp.sendRedirect(req.getContextPath());
			}
			else {
				resp.sendRedirect("seller_login.jsp?error");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
