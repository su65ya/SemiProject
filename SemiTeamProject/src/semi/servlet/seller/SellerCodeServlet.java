package semi.servlet.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/seller/code_no.do")
public class SellerCodeServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			String code_req = req.getParameter("code");
			//처리
			String code = "1234";
			boolean isRight = code.equals(code_req);
			
			//출력
			if(isRight) {
				resp.sendRedirect("seller_join.jsp");				
			}else {
				resp.sendRedirect("code_no.jsp?error");
			}
		} catch (Exception e) {
			resp.sendError(500);
			e.printStackTrace();
		}
	}
}
