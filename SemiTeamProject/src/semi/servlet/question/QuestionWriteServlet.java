package semi.servlet.question;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.QuestionDao;
import semi.beans.dto.MemberDto;
import semi.beans.dto.QuestionDto;
import semi.beans.dto.SellerDto;

@WebServlet (urlPatterns = "/question/question_write.do")
public class QuestionWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 입력
			QuestionDto qdto = new QuestionDto();
			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
			SellerDto sdto = (SellerDto) req.getSession().getAttribute("sellerinfo");
			
			if (mdto != null) {
				qdto.setQue_write(mdto.getMember_no());
			}
			else {
				qdto.setQue_write(sdto.getSeller_no());
			}
			
			qdto.setQue_head(req.getParameter("que_head"));
			qdto.setQue_title(req.getParameter("que_title"));
			qdto.setQue_content(req.getParameter("que_content"));
			
			if (req.getParameter("que_no") != null) {
				qdto.setSuper_no(Integer.parseInt(req.getParameter("que_no")));
			}
			
			// 처리
			QuestionDao qdao = new QuestionDao();
			int que_no = qdao.getSequance();
			qdto.setQue_no(que_no);
			qdao.write(qdto);
			
			
			// 출력
			System.out.println("등록 완료");
			 resp.sendRedirect("question_content.jsp?que_no=" + que_no);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
		
	}
}
