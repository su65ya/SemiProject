package semi.serlvet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.ReviewDao;
import semi.beans.dto.ReviewDto;

@WebServlet(urlPatterns ="/review/review_edit.do")
public class ReviewEditServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 입력
			ReviewDto revdto = new ReviewDto();
			
			revdto.setReview_title(req.getParameter("review_title"));
			revdto.setReview_content(req.getParameter("review_content"));
			revdto.setReview_no(Integer.parseInt(req.getParameter("review_no")));
			
			// 처리
			ReviewDao revdao = new ReviewDao();
			revdao.edit(revdto);
			
			// 출력
			resp.sendRedirect("review_content.jsp?review_no="+ revdto.getReview_no());
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
