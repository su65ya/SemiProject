package semi.servlet.question;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.QuestionDao;
import semi.beans.dto.QuestionDto;
import semi.beans.dto.QuestionViewDto;

@WebServlet (urlPatterns ="/question/question_delete.do")
public class QuestionDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			QuestionDao qdao = new QuestionDao();
			int que_no = Integer.parseInt(req.getParameter("que_no"));
			QuestionViewDto qvdto = qdao.get(que_no);
			
			qdao.delete(que_no);
			
			
			resp.sendRedirect("question_list.jsp?que_pension_no="+ qvdto.getQue_pension_no());
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
