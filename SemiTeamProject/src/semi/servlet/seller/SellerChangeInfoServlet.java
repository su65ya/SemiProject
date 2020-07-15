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
			
			SellerDto sdto = (SellerDto)req.getSession().getAttribute("sellerinfo");
			
			SellerDto seller = new SellerDto();
			seller.setSeller_no(sdto.getSeller_no()); 
			
			seller.setSeller_name("seller_name");
			seller.setSeller_email(req.getParameter("seller_email"));
			seller.setSeller_birth(req.getParameter("seller_birth"));
			seller.setSeller_post(req.getParameter("seller_post"));
			seller.setSeller_basic_addr(req.getParameter("seller_basic_addr"));
			seller.setSeller_detail_addr(req.getParameter("seller_detail_addr"));
			seller.setSeller_phone(req.getParameter("seller_phone"));
			
			
			SellerDao mdao = new SellerDao();
			mdao.changeInfo(seller);
			
			
			resp.sendRedirect("seller_info.jsp");
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
		
		
	}
}
