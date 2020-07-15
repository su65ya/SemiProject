package semi.serlvet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.ReviewDao;
import semi.beans.dto.ReviewDto;
import semi.beans.dto.SellerDto;

@WebServlet (urlPatterns = "/review/review_reply.do")
public class ReviewReplyWriteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 입력 - 문의 번호, 작성자, 답변 내용
			SellerDto sdto = (SellerDto) req.getSession().getAttribute("sellerinfo");			
			ReviewDto revdto = new ReviewDto();
			
			revdto.setReview_pension_no(Integer.parseInt(req.getParameter("review_pension_no")));
			revdto.setReview_no(Integer.parseInt(req.getParameter("review_no")));
			revdto.setReply_writer(sdto.getSeller_no());
			revdto.setReview_reply(req.getParameter("review_reply"));
			
			// 처리
			ReviewDao revdao = new ReviewDao();
			revdao.replywrite(revdto);
			
			
			// 출력
			resp.sendRedirect("review_content.jsp?review_pension_no="+ revdto.getReview_pension_no() +"&review_no="+revdto.getReview_no());
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
