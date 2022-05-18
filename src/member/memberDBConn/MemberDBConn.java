package member.memberDBConn;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDBConn {
	
	private static DataSource ds;
	private static Context context;
	private static Connection con;
	
	// Connection Pool 을 이용한 DB Connect
	public static Connection getConeection() {
		
		try {
			context = new InitialContext();
//			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
//			con = ds.getConnection();
			context = (Context) context.lookup("java:/comp/env");
			ds = (DataSource)context.lookup("jdbc/oracle");
			con = ds.getConnection();
		}catch(NamingException e) {
			e.printStackTrace();
		}catch(SQLException e1) {
			e1.printStackTrace();
		}

		return con;
	}

}
