package semi.servlet.question;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.QuestionDao;
import semi.beans.dto.QuestionDto;

@WebServlet(urlPatterns ="/question/qeustion_edit.do")
public class QuestionEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 입력
			QuestionDto qdto = new QuestionDto();
			
			qdto.setQue_head(req.getParameter("que_head"));
			qdto.setQue_title(req.getParameter("que_title"));
			qdto.setQue_content(req.getParameter("que_content"));
			qdto.setQue_no(Integer.parseInt(req.getParameter("que_no")));
			
			// 처리
			QuestionDao qdao = new QuestionDao();
			qdao.edit(qdto);
			
			// 출력
			resp.sendRedirect("question_content.jsp?que_no="+ qdto.getQue_no());
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
