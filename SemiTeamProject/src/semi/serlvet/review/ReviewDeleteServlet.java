package semi.serlvet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.ReviewDao;


@WebServlet (urlPatterns ="/review/review_delete.do")
public class ReviewDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int review_no = Integer.parseInt(req.getParameter("review_no"));
			int review_pension_no = Integer.parseInt(req.getParameter("review_pension_no"));
			ReviewDao revdao = new ReviewDao();
			revdao.delete(review_no);
			
			
			resp.sendRedirect("review_list.jsp?review_pension_no="+review_pension_no);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
