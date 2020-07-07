//package semi.filter;
//
//import java.io.IOException;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import semi.beans.dao.MemberDao;
//import semi.beans.dto.MemberDto;
//
//public class MemeberTestFilterServlet implements Filter {
//	@Override
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//			throws IOException, ServletException {
//		
//		HttpServletRequest req = (HttpServletRequest) request;
//		HttpServletResponse resp = (HttpServletResponse) response;
//		
//		try {
//			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
//			
//			if (mdto == null) {
//				MemberDao mdao = new MemberDao();
//				MemberDto user = mdao.get("khuser");
//				if (user == null) {
//					MemberDto newUser = new MemberDto();
//					newUser.setMember_id("khuser");
//					newUser.setMem
//				}
//			}
//			
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			resp.sendError(500);
//		}
//	}
//
//}
