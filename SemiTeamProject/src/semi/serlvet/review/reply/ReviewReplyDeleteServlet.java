package semi.serlvet.review.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.ReviewReplyDao;
import semi.beans.dto.ReviewReplyDto;

@WebServlet(urlPatterns = "/review/reply_delete.do")
public class ReviewReplyDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
try {
			int reply_no = Integer.parseInt(req.getParameter("reply_no"));
			int reply_origin = Integer.parseInt(req.getParameter("reply_origin"));
			int review_pension_no = Integer.parseInt(req.getParameter("review_pension_no"));
			ReviewReplyDao rrdao = new ReviewReplyDao();

			rrdao.delete(reply_no);
			
			
			resp.sendRedirect("review_detail.jsp?review_pension_no="+review_pension_no+"&review_no="+reply_origin);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
