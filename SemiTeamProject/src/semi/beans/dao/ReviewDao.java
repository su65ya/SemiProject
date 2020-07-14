package semi.beans.dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDao {
	private static DataSource src;

	static {
		try {
			Context ctx = new InitialContext();// 탐색파일
			Context env = (Context) ctx.lookup("java:/comp/env");
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 연결메소드
	public Connection getConnection() throws Exception {
		return src.getConnection();
	}
	
	
	
	
	
	
}
