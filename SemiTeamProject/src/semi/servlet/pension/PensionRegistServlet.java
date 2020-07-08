package semi.servlet.pension;

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

import semi.beans.dao.PensionDao;
import semi.beans.dto.PensionDto;
import semi.beans.dto.SellerDto;

@WebServlet(urlPatterns = "/seller/pension_regist.do")
public class PensionRegistServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
//			
//			String charset= "UTF-8";//해석할 인코딩 방식
//			int limit = 10*1024*1024;
//			File baseDir = new File("D:/semi/pension");
//			baseDir.mkdir();//없으면 만들어라
//			
//			DiskFileItemFactory factory = new DiskFileItemFactory();
//			factory.setDefaultCharset(charset);
//			factory.setSizeThreshold(limit);
//			factory.setRepository(baseDir);
//			
//			ServletFileUpload utility = new ServletFileUpload(factory);
//			
//			//전송된 데이터들을 해석하도록 지시
//			Map<String,List<FileItem>> map = utility.parseParameterMap(req);
//
			//입력
			PensionDto pdto = new PensionDto();
			SellerDto seller = (SellerDto) req.getSession().getAttribute("sellerinfo");
			pdto.setPension_seller_no(seller.getSeller_no());
			pdto.setPension_name(req.getParameter("pension_name"));
			pdto.setPension_post(req.getParameter("pension_post"));
			pdto.setPension_basic_addr(req.getParameter("pension_basic_addr"));
			pdto.setPension_detail_addr(req.getParameter("pension_detail_addr"));
			pdto.setPension_phone(req.getParameter("pension_phone"));
			pdto.setPension_intro(req.getParameter("pension_intro"));
			
			//처리
			PensionDao pdao = new PensionDao();
			pdao.regist(pdto);
			
			//출력
//			resp.sendRedirect("/pen");
			resp.sendRedirect("pension_list.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
