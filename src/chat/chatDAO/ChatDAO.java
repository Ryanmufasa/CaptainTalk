package chat.chatDAO;

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

public class ChatDAO {

	private static Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public static ChatDAO instance;
	// == new ChatDAO()
	// ChateDAO클래스도 계속 지속적으로 사용해야 하므로
	// static 객체를 생성하고 호출시에는 instance로 호출

	public ChatDAO() {}

	public static ChatDAO getInstance() {
		if(instance == null) {
			instance = new ChatDAO();
		}
		return instance;
	}

	private static DataSource ds;

	static {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}

	//여기서부터 DAO작성(전체 채팅방 출력)
	public List<ChatVO> selectAll(){

		ArrayList<ChatVO> list = new ArrayList<ChatVO>();

		String sql = "SELECT * FROM CHAT";
		ChatVO vo = null;

		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				vo = new ChatVO();
				vo.setChr_name(rs.getString("CHR_NAME"));
				vo.setChr_mem(rs.getString("CHR_MEM"));

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

	public boolean make_room(ChatVO vo) {
		
		boolean check = false;
		String mem = "";
		//채팅방 이름과 사용자 이름을 입력받아 채팅방을 만든다
		String sql = "";
			try {
				con = ds.getConnection();
				sql = "INSESRT INTO chat VALUES(?,?)";
				ps = con.prepareStatement(sql);
				ps.setString(1, vo.getChr_name());
				mem = "|"+vo.getChr_mem()+"|";
				ps.setString(2, mem);
					System.out.println("make_room 시작");
				if(ps.executeUpdate() != 0) {
					System.out.println("채팅방 생성 성공");
					check = true;  
				}
			} catch(SQLException e) {
				System.out.println(e.getMessage());
		    	System.out.println("채팅방 생성 Exception");
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
	
	public boolean join_room(ChatVO vo, String room, String name) {//room-채팅방이름, name-접속할 사용자이름
		
		boolean check = false;
		
		String sql = null;
		String add_mem = null;
			
			//채팅방에 사용자를 넣는다
			try {
				con = ds.getConnection();
				sql = "UPDATE CHAT SET CHR_MEM=? WHERE CHR_NAME=?";
				ps = con.prepareStatement(sql);
				
				String chr_mem=vo.getChr_mem();
				add_mem = chr_mem+"|"+name+"|";
				
				ps.setString(1, add_mem);
				ps.setString(2, room);
				System.out.println("joinroom update 시작");
				rs = ps.executeQuery();
				System.out.println("joinroom update 성공");
				check = true;
			} catch(SQLException e) {
			   	System.out.println("join_room Exception");
			   	check = false;
			}
		return check;		
	}
	
	
	public boolean out_room(String room, String name) { 
		
		boolean check = false;	
		//사용자가 로그아웃하면 채팅방에서 이름 삭제
		String sql = null;
			try {
				con = ds.getConnection();
				sql = "UPDATE CHAT SET chr_mem=REPLACE(chr_mem,?,'') WHERE CHR_NAME=?";
				ps = con.prepareStatement(sql);
				
				//채팅방에서 나간 사용자 채팅방에서 목록에서 삭제
				System.out.println("out_room 에 들어온 name:"+name);
				ps.setString(1, '|'+name+'|');
				ps.setString(2, room);
				System.out.println("out_room 시작");
				rs = ps.executeQuery();
				System.out.println("out_room 완료");
				check = true;
			} catch(SQLException e) {
				e.printStackTrace();
			   	System.out.println("out_room Exception");
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
	
	public boolean delete_room() { 
		
		boolean check = false;
		String sql = null;
		//프로그램 종료시 or 로그아웃 시마다 채팅방에 사용자가 없으면 채팅방 삭제
    	try {
    		con = ds.getConnection();
    		sql = "DELETE FROM CHAT WHERE CHR_MEM is null";
			ps = con.prepareStatement(sql);
			System.out.println("delete_room 시작");
    		ps.executeUpdate();
    		System.out.println("delete_room 종료");
    	}catch(SQLException e) {
    		System.out.println("Delect Exception");
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
	
	
	//현재 채팅방의 맴버들을 리턴하는 함수
	public String get_mem(String room) {
		
		String sql = null;
		String roomMem = null;
		
    	try {
    		con = ds.getConnection();
    		sql = "SELECT CHR_MEM FROM CHAT WHERE CHR_NAME=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, room);
			rs = ps.executeQuery();
    		while(rs.next()) {
				roomMem = rs.getString("CHR_MEM");
				}		
	    	}catch(SQLException e) {
	    		System.out.println("get_mem 에러");
	    		e.printStackTrace();
	    	} finally {
				try {
					if(ps != null) ps.close();
					if(con != null) con.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			} return roomMem;
		}

}