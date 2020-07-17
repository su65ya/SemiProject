package semi.servlet.pension;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.PensionImageDao;

@WebServlet(urlPatterns = "/seller/pension_image_delete.do")
public class PensionimageDeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//pension_image_no를 불러와서 삭제한다
			int pension_no = Integer.parseInt(req.getParameter("pension_no"));
			int pen_image_no = Integer.parseInt(req.getParameter("pen_image_no"));
			PensionImageDao pdao = new PensionImageDao();
			pdao.delete(pen_image_no);
			System.out.println("삭제완료");
			
			resp.sendRedirect(req.getContextPath()+"/seller/pension_edit.jsp?pension_no="+pension_no);
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
