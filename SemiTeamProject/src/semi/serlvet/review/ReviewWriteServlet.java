package semi.serlvet.review;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import semi.beans.dao.ReviewDao;
import semi.beans.dao.ReviewFileDao;
import semi.beans.dto.MemberDto;
import semi.beans.dto.ReviewDto;
import semi.beans.dto.ReviewFileDto;


@WebServlet (urlPatterns = "/review/review_write.do")
public class ReviewWriteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String charset="UTF-8";
			int limit = 10*10*1024;
			File baseDir = new File("D:/upload/review_file");
			baseDir.mkdir();
			
			DiskFileItemFactory  factory = new DiskFileItemFactory();
			factory.setDefaultCharset(charset);
			factory.setSizeThreshold(limit);
			factory.setRepository(baseDir);
			
			ServletFileUpload utility = new ServletFileUpload(factory);
			Map<String,List<FileItem>>map = utility.parseParameterMap(req);

					
			
			ReviewDto revdto = new ReviewDto();
			ReviewDao revdao = new ReviewDao();
			
			int review_no = revdao.getSequence();
			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
			
			int review_pension_no=Integer.parseInt(map.get("review_pension_no").get(0).getString());
			
			revdto.setReview_writer(mdto.getMember_no());
		
			revdto.setReview_pension_no(Integer.parseInt(map.get("pension_no").get(0).getString()));
		
			revdto.setReview_title(map.get("review_title").get(0).getString());
			revdto.setReview_content(map.get("review_content").get(0).getString());
			System.out.println(map);
			revdao.write(revdto);
			
			List<FileItem> fileList = map.get("review_file");
			ReviewFileDao rfdao= new ReviewFileDao();
			for(FileItem item : fileList) {
				if(item.getSize()>0) {
					int review_file_no = rfdao.getSequence();
					ReviewFileDto rfdto = new ReviewFileDto();
					rfdto.setReview_file_no(review_file_no);
					rfdto.setReview_file_name(item.getName());
					rfdto.setReview_origin(review_no);
					rfdto.setReview_file_size(item.getSize());
					rfdto.setReview_file_type(item.getContentType());
					rfdao.save(rfdto);
					
					File target = new File(baseDir,String.valueOf(review_file_no));
					item.write(target);
				}
			}
			resp.sendRedirect("review_detail.jsp?review_pension_no="+review_pension_no);
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
