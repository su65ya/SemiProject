package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import semi.beans.dto.AdminDto;

public class AdminDao {
	
	private static DataSource src;
	
	static {
		try {
			Context ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:/comp/env");
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception {
		return src.getConnection();
	}
	
	public AdminDto login(AdminDto adto) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM admin WHERE admin_id = ? AND admin_pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, adto.getAdmin_id());
		ps.setString(2, adto.getAdmin_pw());
		
		ResultSet rs = ps.executeQuery();
		
		AdminDto admin;
		if (rs.next()) {
			admin = new AdminDto(rs);
		}
		else {
			admin = null;
		}
		
		con.close();
		return admin;
	}

}

