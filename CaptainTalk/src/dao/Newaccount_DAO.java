package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.conn;

public class Newaccount_DAO {

	private Connection con;
	int rowcnt;
	
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public Newaccount_DAO() throws ClassNotFoundException, SQLException	{
		con = new conn("Newaccunt_DAO").getConnection(); 	
	}
	
	public int new_account(String id, String pw)  {	
		String sql = "SELECT * FROM USERINFO WHERE id = ?";
				
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rowcnt = ps.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
    	}finally {
    		//try { rs.close(); } catch (Exception e) { /* ignored */ }
		    //try { ps.close(); } catch (Exception e) { /* ignored */ }
		    //try { con.close(); } catch (Exception e) { /* ignored */ }
    	}	
		if(rowcnt == 0) { // 아이디가 존재하지 않을경우
			sql = "INSERT INTO userinfo VALUES (?, ?, 0, SYSDATE + 9/24, 0, 0)";
										//서버 타이존 문제로, 9시간 더함.(GMT+9)
			try {
				ps=con.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, pw);
				rowcnt = ps.executeUpdate();
			} catch(SQLException e){
				e.printStackTrace();
				return 1;
	    	}finally {
	    		try { rs.close(); } catch (Exception e) { /* ignored */ }
			    try { ps.close(); } catch (Exception e) { /* ignored */ }
			    try { con.close(); } catch (Exception e) { /* ignored */ }
	    	}	
			return 0;
		}else {
			return 2;
		}
	}
}
