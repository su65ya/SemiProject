package semi.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.SellerDao;

@WebServlet(urlPatterns = "/admin/sellerDrop.do")
public class AdminSellerDropServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String seller_id = req.getParameter("seller_id");
			
			SellerDao sdao = new SellerDao();
			sdao.delete(seller_id);
			
			resp.sendRedirect("admin_seller_list.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
