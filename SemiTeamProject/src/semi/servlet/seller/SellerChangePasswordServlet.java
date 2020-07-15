package semi.servlet.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.SellerDao;
import semi.beans.dto.SellerDto;

@WebServlet (urlPatterns = "/seller/seller_change_password.do")
public class SellerChangePasswordServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 입력
			SellerDto sdto = (SellerDto) req.getSession().getAttribute("sellerinfo");
			
			int seller_no = sdto.getSeller_no();
			String seller_pw = req.getParameter("seller_pw");
			
			// 처리
			SellerDao sdao = new SellerDao();
			sdao.pwChange(seller_no, seller_pw);
			
			
			// 출력
			resp.sendRedirect("change_pw_result.jsp");
			
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
