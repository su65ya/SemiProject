package semi.servlet.pension;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.PensionDao;
import semi.beans.dto.PensionDto;
import semi.beans.dto.SellerDto;

@WebServlet(urlPatterns = "/seller/pension_edit.do")
public class PensionEditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 
			PensionDto pdto = new PensionDto();
			SellerDto seller = (SellerDto) req.getSession().getAttribute("sellerinfo");
			pdto.setPension_seller_no(seller.getSeller_no());
			pdto.setPension_no(Integer.parseInt(req.getParameter("pension_no")));
			pdto.setPension_name(req.getParameter("pension_name"));
			pdto.setPension_post(req.getParameter("pension_post"));
			pdto.setPension_basic_addr(req.getParameter("pension_basic_addr"));
			pdto.setPension_detail_addr(req.getParameter("pension_detail_addr"));
			pdto.setPension_phone(req.getParameter("pension_phone"));
			pdto.setPension_intro(req.getParameter("pension_intro"));
		//처리
			PensionDao pdao = new PensionDao();
			pdao.edit(pdto);
			
		//출력
			
			resp.sendRedirect("pension_detail.jsp?pension_no=" + pdto.getPension_no());

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
