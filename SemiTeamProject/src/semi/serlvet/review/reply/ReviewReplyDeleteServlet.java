package semi.serlvet.review.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.ReviewReplyDao;

@WebServlet(urlPatterns = "/review/review_reply_del.do")
public class ReviewReplyDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
try {
			
			int reply_no = Integer.parseInt(req.getParameter("reply_no"));
			int reply_origin = Integer.parseInt(req.getParameter("reply_origin"));
			ReviewReplyDao rrdao = new ReviewReplyDao();
			rrdao.delete(reply_no);
			
			
			resp.sendRedirect("review_detail.jsp?reply_origin="+ reply_origin);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
