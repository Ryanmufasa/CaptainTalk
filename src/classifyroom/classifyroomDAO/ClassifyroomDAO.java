package classifyroom.classifyroomDAO;

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

import chat.chatVO.ChatVO;
import classifyroom.classifyroomVO.ClassifyroomVO;

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
	
	
	
	//채팅방 별 인원수 추가 
	public boolean clas_room(ClassifyroomVO vo) {
			
		boolean check = false;
		String mem = "";
		//채팅방 이름과 사용자 이름을 입력받아 채팅방을 만든다
		String sql = "";
			try {
				con = ds.getConnection();
				sql = "INSERT INTO classifyroom VALUES(?,?)";
				ps = con.prepareStatement(sql);
				System.out.println("claroom _name : " + vo.getcla_name());
				ps.setString(1, vo.getcla_name());
				System.out.println("claroom _mem : " + vo.getcla_mem());
				ps.setString(2, vo.getcla_mem());
					System.out.println("cla_room 시작");
				rs = ps.executeQuery();
					System.out.println("채팅방 분류 성공");
				check = true;  
					
			} catch(SQLException e) {
				System.out.println(e.getMessage());
		    	System.out.println("채팅방 분류 Exception");
		    	check = false;
		    } finally {
				try {
					if(ps != null) ps.close();
					if(con != null) con.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
		return check;
	}
	
	
	
	
	
	//사용자 아이디로 채팅방 이름을 구하는 함수
	public String getRoom(String name) {
		
		String sql = null;
		String roomName = null;
		
    	try {
    		con = ds.getConnection();
    		sql = "SELECT CLA_NAME FROM classifyroom WHERE CLA_MEM LIKE ?";
			ps = con.prepareStatement(sql);
			name = "%" + name +"%";
			ps.setString(1, name);
			System.out.println("getRoom 내에서의 execute 실행 전");
			rs = ps.executeQuery();
			System.out.println("getRoom 내에서의 execute 실행 후");
    		while(rs.next()) {
    			System.out.println("rs.next() 실행");
				roomName = rs.getString("CLA_NAME");
				System.out.println("getRoom 함수 내에서의 roomName : "+roomName);
				}		
	    	}catch(SQLException e) {
	    		System.out.println("getRoom 에러");
	    		e.printStackTrace();
	    	} finally {
				try {
					if(ps != null) ps.close();
					if(con != null) con.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
    	return roomName;
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

	
	//채팅방 맴버에서 사용자 이름 제거
	public boolean outRoom(String name) { 
			
		boolean check = false;	
		//사용자가 로그아웃하거나 강제로 프로그램이 종료되었을 때를 대비해 사용자가 있던 채팅방 목록 제거
		String sql = null;
			try {
				con = ds.getConnection();
				sql = "DELETE FROM classifyroom WHERE cla_mem = ?";
				System.out.println("체크지점 1");
				ps = con.prepareStatement(sql);
				System.out.println("체크지점 2");
				ps.setString(1, name);
				System.out.println("체크지점 3");
				rs = ps.executeQuery();
				System.out.println("체크지점 4");
				check = true;
			} catch(SQLException e) {
				e.printStackTrace();
			   	System.out.println("outRoom Exception");
			    check = false;
			} finally {
				try {
					if(ps != null) ps.close();
					if(con != null) con.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
		return check;
	}
	
		
}	