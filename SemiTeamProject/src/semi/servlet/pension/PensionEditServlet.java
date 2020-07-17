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
import semi.beans.dao.PensionImageDao;
import semi.beans.dao.PensionOptionDao;
import semi.beans.dto.PensionDto;
import semi.beans.dto.PensionImageDto;
import semi.beans.dto.PensionOptionDto;
import semi.beans.dto.SellerDto;

@WebServlet(urlPatterns = "/seller/pension_edit.do")
public class PensionEditServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 
			String charset= "UTF-8";//해석할 인코딩 방식
			int limit = 10*1024*1024;
			File baseDir = new File("D:/upload/pension");
			baseDir.mkdir();//없으면 만들어라
//			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setDefaultCharset(charset);
			factory.setSizeThreshold(limit);
			factory.setRepository(baseDir);
//			
			ServletFileUpload utility = new ServletFileUpload(factory);
//			
			//전송된 데이터들을 해석하도록 지시
			Map<String,List<FileItem>> map = utility.parseParameterMap(req);

			System.out.println(map);
			PensionDto pdto = new PensionDto();
			int pension_no = Integer.parseInt(map.get("pension_no").get(0).getString());
			SellerDto seller = (SellerDto) req.getSession().getAttribute("sellerinfo");
			
			pdto.setPension_seller_no(seller.getSeller_no());
			pdto.setPension_no(Integer.parseInt(map.get("pension_no").get(0).getString()));
			pdto.setPension_name(map.get("pension_name").get(0).getString());
			pdto.setPension_post(map.get("pension_post").get(0).getString());
			pdto.setPension_basic_addr(map.get("pension_basic_addr").get(0).getString());
			pdto.setPension_detail_addr(map.get("pension_detail_addr").get(0).getString());
			pdto.setPension_phone(map.get("pension_phone").get(0).getString());
			pdto.setPension_intro(map.get("pension_intro").get(0).getString());
		//처리
			PensionDao pdao = new PensionDao();
			pdao.edit(pdto);
			
			
			//입력
			PensionOptionDao podao = new PensionOptionDao();
			List<FileItem> option = map.get("option");
			for(int i =0;i<option.size();i++) {
				String option_req = option.get(i).getString();
				if(option_req.length()>0) {
					String option_split[] = option_req.split("-");
					String option_name = option_split[0];
					int option_price = Integer.parseInt(option_split[1]);
					podao.update(option_price, pension_no, option_name);
				}
			}
			List<FileItem> fileList = map.get("pension_image");
			PensionImageDao pidao = new PensionImageDao();
			for(FileItem item : fileList) {
				if(item.getSize()>0) {//파일이 있는 경우
					
					//데이터베이스에 저장
					int pension_image_no = pidao.getSequence();//image번호를 미리 추출
					
					PensionImageDto pidto = new PensionImageDto();//dto생성
					pidto.setPen_image_no(pension_image_no);//추출된 번호 저장
					pidto.setPen_image_name(item.getName());
					pidto.setPen_image_pen_no(pension_no);
					pidto.setPen_image_size(item.getSize());
					pidto.setPen_image_type(item.getContentType());
					pidao.save(pidto);
					
					//하드디스크에 저장
					File target = new File(baseDir,String.valueOf(pension_image_no));
					item.write(target);
				}
			}
		//출력
			resp.sendRedirect("pension_detail.jsp?pension_no="+pension_no);
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
