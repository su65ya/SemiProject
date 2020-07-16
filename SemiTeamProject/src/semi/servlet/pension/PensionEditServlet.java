package semi.servlet.pension;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.PensionDao;
import semi.beans.dao.PensionOptionDao;
import semi.beans.dto.PensionDto;
import semi.beans.dto.PensionOptionDto;
import semi.beans.dto.SellerDto;

@WebServlet(urlPatterns = "/seller/pension_edit.do")
public class PensionEditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 
			PensionDto pdto = new PensionDto();
			int pension_no = Integer.parseInt(req.getParameter("pension_no"));
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
			
			
			//입력
			PensionOptionDao podao = new PensionOptionDao();
			String option[] = req.getParameterValues("option");
			for(int i=0;i<option.length;i++) {
				String option_info = option[i];
				if(option_info.length()>0) {
				String option_split[] = option_info.split("-");
				String option_name = option_split[0];
				int option_price = Integer.parseInt(option_split[1]);
				
				podao.update(option_price, pension_no, option_name);
				}
			}
			
		//출력
			resp.sendRedirect("pension_detail.jsp?pension_no="+pension_no);
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
