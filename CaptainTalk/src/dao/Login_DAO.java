package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.conn;


public class Login_DAO {
		
		private Connection con;
		int rowcnt;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		public Login_DAO() {
			con = new conn("Login_DAO").getConnection();
		}

		public boolean login(String id, String pw)  {	
			String sql = "SELECT * FROM USERINFO WHERE id = ? AND pw = ?";
			try {
				ps=con.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, pw);
				rowcnt = ps.executeUpdate(); // ID/PW ��ġ üũ
			} catch(SQLException e){
				System.out.println("Login_DAO.login ID/PW ��ġ üũ ����");
				return false;
	    	}finally {
	    		try { rs.close(); } catch (Exception e) { /* ignored */ }
			    try { ps.close(); } catch (Exception e) { /* ignored */ }
	    	}	

			if(rowcnt == 1) { // ID/PW�� ��ġ�� ���
				
				System.out.println("Login_DAO.login; �α��� �Ϸ�");
				return true;
			}else {
				return false;
			}
		}
}

	 
	