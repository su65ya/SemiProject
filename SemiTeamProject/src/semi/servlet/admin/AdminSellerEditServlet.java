package semi.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.SellerDao;
import semi.beans.dto.SellerDto;

@WebServlet(urlPatterns = "/admin/admin_seller_edit.do")
public class AdminSellerEditServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			SellerDto sdto = new SellerDto();
			sdto.setSeller_id(req.getParameter("seller_id"));
			sdto.setSeller_pw(req.getParameter("seller_pw"));
			sdto.setSeller_name(req.getParameter("seller_name"));
			sdto.setSeller_birth(req.getParameter("seller_birth"));
			sdto.setSeller_email(req.getParameter("seller_email"));
			sdto.setSeller_post(req.getParameter("seller_post"));
			sdto.setSeller_basic_addr(req.getParameter("seller_basic_addr"));
			sdto.setSeller_detail_addr(req.getParameter("seller_detail_addr"));
			sdto.setSeller_phone(req.getParameter("seller_phone"));
			sdto.setCompany_no(req.getParameter("company_no"));
			
			SellerDao sdao = new SellerDao();
			sdao.editByAdmin(sdto);
			
			resp.sendRedirect("admin_seller_detail.jsp?seller_id=" + sdto.getSeller_id());
		}
		
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
