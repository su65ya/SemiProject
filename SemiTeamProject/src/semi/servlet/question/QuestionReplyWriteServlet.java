package semi.servlet.question;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.QuestionDao;
import semi.beans.dto.QuestionDto;
import semi.beans.dto.SellerDto;

@WebServlet (urlPatterns = "/question/question_reply.do")
public class QuestionReplyWriteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 입력 - 문의 번호, 작성자, 답변 내용
			SellerDto sdto = (SellerDto) req.getSession().getAttribute("sellerinfo");			
			QuestionDto qdto = new QuestionDto();
			
			qdto.setQue_pension_no(Integer.parseInt(req.getParameter("que_pension_no")));
			qdto.setQue_no(Integer.parseInt(req.getParameter("que_no")));
			qdto.setReply_writer(sdto.getSeller_no());
			qdto.setQue_reply(req.getParameter("que_reply"));
			
			// 처리
			QuestionDao qdao = new QuestionDao();
			qdao.replywrite(qdto);
			
			
			// 출력
			resp.sendRedirect("question_content.jsp?que_pension_no="+ qdto.getQue_pension_no() +"&que_no="+qdto.getQue_no());
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
