package semi.servlet.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.SellerDao;
import semi.beans.dto.SellerDto;

@WebServlet (urlPatterns ="/seller/seller_find_id.do")
public class SellerFindIdServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			SellerDto sdto = new SellerDto();
			sdto.setSeller_name(req.getParameter("seller_name"));
			sdto.setSeller_phone(req.getParameter("seller_phone"));
			sdto.setSeller_birth(req.getParameter("seller_birth"));
			sdto.setCompany_no(req.getParameter("company_no"));
			
			SellerDao sdao = new SellerDao();
			String seller_id = sdao.findId(sdto);
			
			if (seller_id != null) {
				req.getSession().setAttribute("seller_id", seller_id);
				resp.sendRedirect("seller_find_id_res.jsp");
			}
			else {
				resp.sendRedirect("seller_find_id.jsp?error");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
