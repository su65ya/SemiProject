package semi.serlvet.review.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.ReviewReplyDao;
import semi.beans.dto.MemberDto;
import semi.beans.dto.ReviewReplyDto;

@WebServlet (urlPatterns = "/review/review_reply_writer.do")
public class ReviewReplyWriteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 입력 - 리뷰 번호, 작성자, 댓글 내용
			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");			
			ReviewReplyDto rrdto = new ReviewReplyDto();
			
			rrdto.setReply_origin(Integer.parseInt(req.getParameter("reply_origin")));
			rrdto.setReply_no(Integer.parseInt(req.getParameter("reply_no")));
			rrdto.setReply_writer(mdto.getMember_no());
			rrdto.setReply_content(req.getParameter("reply_content"));
			
			// 처리
			ReviewReplyDao rrdao = new ReviewReplyDao();
			rrdao.replywrite(rrdto);
			
			
			// 출력
			resp.sendRedirect("review_content.jsp?reply_origin="+ rrdto.getReply_origin() +"&reply_no="+rrdto.getReply_no());
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
