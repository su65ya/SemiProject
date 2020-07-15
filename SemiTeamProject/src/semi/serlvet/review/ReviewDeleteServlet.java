package semi.serlvet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.QuestionDao;

@WebServlet (urlPatterns ="/review/review_delete.do")
public class ReviewDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int que_no = Integer.parseInt(req.getParameter("que_no"));
			int que_pension_no = Integer.parseInt(req.getParameter("que_pension_no"));
			QuestionDao qdao = new QuestionDao();
			qdao.delete(que_no);
			
			
			resp.sendRedirect("question_list.jsp?que_pension_no="+ que_pension_no);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
