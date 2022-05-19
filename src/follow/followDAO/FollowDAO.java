package follow.followDAO;

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

import follow.followVO.FollowVO;

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
	
	//jdbc 처리시 자바에서 db로 날짜를 저장하고자 할때 날짜 형식을 ‘220331’ 로 처리하고
	//db에 저장하기 전 to_date()를 넣어서 저장해야 한다. 
	
	// 전체 follow 테이블 목록 출력 
	public List<FollowVO> selectAll(){
		
		ArrayList<FollowVO> list = new ArrayList<FollowVO>();
		
		String sql="select * from follow";
		FollowVO vo = null;
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				vo = new FollowVO();
				vo.setFol_id(rs.getInt("fol_id"));
				vo.setMem_no(rs.getInt("mem_no"));
				vo.setTarget_mem_no(rs.getInt("target_mem_no"));
				vo.setFol_datetime(rs.getDate("fol_datetime"));
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
	
	
	// follow 테이블에서 기준이 되는 회원 번호는 target_mem_no 입니다.
	// target_mem_no 의 기준으로 팔로잉, 팔로워를 조회해야 합니다. 
	
	// 회원의 팔로워 조회 ( 팔로워의 아이디, 이름, 날짜 )
	//public ArrayList<String> 
	
	
	

}
