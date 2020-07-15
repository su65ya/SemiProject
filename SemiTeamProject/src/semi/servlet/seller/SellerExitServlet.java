package semi.servlet.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.SellerDao;
import semi.beans.dto.SellerDto;

@WebServlet(urlPatterns = "/seller/exit.do")
public class SellerExitServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			SellerDto mdto = (SellerDto) req.getSession().getAttribute("userinfo");
			String seller_id = mdto.getSeller_id();
			String seller_pw = mdto.getSeller_pw();
			
		
			SellerDao mdao = new SellerDao();
			mdao.exit(seller_id, seller_pw);
			
			req.getSession().removeAttribute("userinfo");

			
			
			resp.sendRedirect("goodbye.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}

}
