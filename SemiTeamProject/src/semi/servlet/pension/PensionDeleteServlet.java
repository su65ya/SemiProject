package semi.servlet.pension;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.PensionDao;

@WebServlet(urlPatterns = "/seller/pension_delete.do")
public class PensionDeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int pension_no = Integer.parseInt(req.getParameter("pension_no"));

//		처리 : 삭제
			PensionDao pdao = new PensionDao();
			pdao.delete(pension_no);// 삭제

//		출력 : list.jsp로 redirect
			resp.sendRedirect("pension_list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}

	}
}
