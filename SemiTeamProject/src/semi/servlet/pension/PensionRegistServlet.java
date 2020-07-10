package semi.servlet.pension;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet(urlPatterns = "/seller/pension_regist.do")
public class PensionRegistServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
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

		
			// 입력
			PensionDto pdto = new PensionDto();
			PensionDao pdao = new PensionDao();
			SellerDto seller = (SellerDto) req.getSession().getAttribute("sellerinfo");

			int pension_no = pdao.getSequence();
			pdto.setPension_no(pension_no);
			pdto.setPension_seller_no(seller.getSeller_no());
			pdto.setPension_name(map.get("pension_name").get(0).getString());
			pdto.setPension_post(map.get("pension_post").get(0).getString());
			pdto.setPension_basic_addr(map.get("pension_basic_addr").get(0).getString());
			pdto.setPension_detail_addr(map.get("pension_detail_addr").get(0).getString());
			pdto.setPension_phone(map.get("pension_phone").get(0).getString());
			pdto.setPension_intro(map.get("pension_intro").get(0).getString());

//			System.out.println(pension_no);
//			System.out.println(pdto.getPension_intro());
//			System.out.println(pdto.getPension_name());
//			System.out.println(pdto.getPension_phone());
			System.out.println(map);
			pdao.regist(pdto);
//			// 펜션옵션 불러오기
			PensionOptionDao podao = new PensionOptionDao();
//			String option[] = map.get("option");
			List<FileItem> option = map.get("option");
			for(int i =0;i<option.size();i++) {//리스트 안에 있는 값을 차례대로 뽑아내기 위한 반복문
				String option_req = option.get(i).getString();//ㅇㅇ-ㅇㅇ-ㅇ
					String option_split[] = option_req.split("-");
					String option_name = option_split[0];
					int option_price = Integer.parseInt(option_split[1]);
					int option_select = Integer.parseInt(option_split[2]);
					
					PensionOptionDto podto = new PensionOptionDto();
					podto.setPension_key(pension_no);
					podto.setOption_name(option_name);
					podto.setOption_price(option_price);
					podto.setOption_select(option_select);// 선택
	
					podao.regist(podto);
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
			resp.sendError(500);
			e.printStackTrace();
		}
	}
}
