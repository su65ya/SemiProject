package semi.servlet.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.SellerDao;
import semi.beans.dto.SellerDto;

@WebServlet (urlPatterns ="/seller/seller_find_pw.do")
public class SellerFindPwServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			SellerDto sdto = new SellerDto();
			sdto.setSeller_id(req.getParameter("seller_id"));
			sdto.setSeller_name(req.getParameter("seller_name"));
			sdto.setSeller_phone(req.getParameter("seller_phone"));
			sdto.setSeller_birth(req.getParameter("seller_birth"));
			sdto.setCompany_no(req.getParameter("company_no"));
			
			SellerDao sdao = new SellerDao();
			String seller_pw = sdao.findPw(sdto);
			
			if (seller_pw != null) {
				req.getSession().setAttribute("seller_pw", seller_pw);
				resp.sendRedirect("seller_find_pw_res.jsp");
			}
			else {
				resp.sendRedirect("seller_find_pw.jsp?error");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
