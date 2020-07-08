package semi.servlet.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dto.SellerDto;
import semi.beans.dao.SellerDao;

@WebServlet(urlPatterns = "/seller/change_info.do")
public class SellerChangeInfoServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			req.setCharacterEncoding("UTF-8");
			
			SellerDto mdto = (SellerDto)req.getSession().getAttribute("userinfo");
			String Seller_id = mdto.getSeller_id();
			
			SellerDto user = new SellerDto();
			user.setSeller_id(seller_id);
			user.setSeller_name(req.getParameter(seller_name));
			user.setSeller_birth(req.getParameter(seller_birth));
			user.setSeller_email(req.getParameter(seller_email));
			user.setSeller_basic_addr(req.getParameter(seller_basic_addr));
			user.setSeller_detail_addr(req.getParameter(seller_detail_addr);
			user.setCompany_no(req.getParameter(company_no));
			
			
			SellerDao mdao = new SellerDao();
			mdao.changeInfo(user);
			
			
			resp.sendRedirect("seller_info.jsp");
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
		
		
	}
}
