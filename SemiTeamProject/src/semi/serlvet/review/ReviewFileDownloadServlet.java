package semi.serlvet.review;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import semi.beans.dao.ReviewFileDao;
import semi.beans.dto.ReviewFileDto;


@WebServlet(urlPatterns = "/review/filedownload.do")
public class ReviewFileDownloadServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int review_file_no = Integer.parseInt(req.getParameter("review_file_no"));
			
			ReviewFileDao rfdao = new ReviewFileDao();
			ReviewFileDto rfdto = rfdao.get(review_file_no);
			
			resp.setHeader("Content-Type", "application/octet-stream; charset=UTF-8");			
			resp.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(rfdto.getReview_file_name(), "UTF-8")+"\"");
			resp.setHeader("Content-Length", String.valueOf(rfdto.getReview_file_size()));	
			File target = new File("D://upload/review_file", String.valueOf(rfdto.getReview_file_no()));
			byte[] data = FileUtils.readFileToByteArray(target);
			resp.getOutputStream().write(data);
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
