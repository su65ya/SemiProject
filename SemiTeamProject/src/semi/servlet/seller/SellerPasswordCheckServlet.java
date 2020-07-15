package semi.servlet.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.SellerDao;
import semi.beans.dto.SellerDto;

@WebServlet(urlPatterns = "/seller/password_check.do")
public class SellerPasswordCheckServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 입력

			String go = req.getParameter("go");// 목적지 주소

			SellerDto seller = new SellerDto();
			String seller_pw = req.getParameter("seller_pw");
			seller = (SellerDto) req.getSession().getAttribute("sellerinfo");//khseller
			String seller_id = seller.getSeller_id();//khseller

			// 처리
			SellerDao sdao = new SellerDao();//dao생성(로그인하기위해)
			SellerDto sdto = new SellerDto();//새로운 dto생성
			sdto.setSeller_id(seller_id);//khseller
			sdto.setSeller_pw(seller_pw);//khseller
			SellerDto result = sdao.login(sdto);//성공?실패?

			if (result == null) {// 로그인 실패
				resp.sendRedirect("password_check.jsp?error&go="+go);
			} else {// 로그인 성공
				resp.sendRedirect(go);
			}
			// 출력
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
