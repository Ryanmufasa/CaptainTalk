package follow.followDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FollowDAO {
	
	private static Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private static FollowDAO instance;
	
	private FollowDAO() {}
	
	public static FollowDAO getInstance() {
		if(instance == null) {
			instance = new FollowDAO();
		}
		return instance;
	}
	
	private static DataSource ds;
	
	static {
		try {

			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	
	

}
