package membersocket.membersocketDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.websocket.Session;

import classifyroom.classifyroomVO.ClassifyroomVO;
import member.memberVO.MemberVO;

public class ClassifyroomDAO {

	private static Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private static ClassifyroomDAO instance;
	
	private ClassifyroomDAO() {}
	
	public static ClassifyroomDAO getInstance() {
		if(instance == null) {
			instance = new ClassifyroomDAO();
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
	
	
	
	//전체 방 분류 출력
	public List<ClassifyroomVO> selectAll(){

		ArrayList<ClassifyroomVO> list = new ArrayList<ClassifyroomVO>();

		String sql = "SELECT * FROM classifyroom";
		ClassifyroomVO vo = null;

		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				vo = new ClassifyroomVO();
				vo.setCla_name(rs.getString("CLA_NAME"));
				vo.setCla_mem(rs.getString("CLA_MEM"));

				list.add(vo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();

			} catch(SQLException e) {
				e.printStackTrace();
			}

		}

		if(list.isEmpty()) {
			list = null;
		}else {
			list.trimToSize();
		}

		return list;
	}
	
	
	
	
	
	
	//사용자 아이디로 채팅방 이름을 구하는 함수
	public String getRoom(String name) {
		
		String sql = null;
		String roomName = null;
		
    	try {
    		con = ds.getConnection();
    		sql = "SELECT CLA_NAME FROM classifyroom WHERE CLA_MEM LIKE ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
    		while(rs.next()) {
				roomName = rs.getString("CLA_NAME");
				}		
	    	}catch(SQLException e) {
	    		e.printStackTrace();
	    	} finally {
				try {
					if(ps != null) ps.close();
					if(con != null) con.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			} return roomName;
		}
	
	
	
	//채팅방 이름으로 사용자 아이디 리스트를 리턴하는 함수
	public ArrayList<String> getMemIds(String room){

		ArrayList<String> list = new ArrayList<String>();

		String sql = "SELECT CLA_MEM FROM classifyroom WHERE CLA_NAME LIKE ?";
		String vo = null;

		try {
			con = ds.getConnection();
			ps.setString(1, room);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(vo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();

			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(list.isEmpty()) {
			list = null;
		}else {
			list.trimToSize();
		}
		return list;
	}

		
}	