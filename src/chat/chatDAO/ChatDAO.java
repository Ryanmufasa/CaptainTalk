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
				vo.setCh_id(rs.getInt("ch_id"));
				vo.setCh_title(rs.getString("ch_title"));
				
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
