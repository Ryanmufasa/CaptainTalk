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
	
	
	// follow 테이블에서 회원의 팔로워 조회시 기준이 되는 회원 번호는 target_mem_no 입니다.
	// 회원의 팔로워 목록 조회 ( 팔로워의 아이디, 이름, 날짜 )
	public List<Object> myfollower(FollowVO vo){
		
		ArrayList<Object> list = new ArrayList<Object>();
		
		String sql = "select m.mem_id, m.mem_name, f.fol_date " 
				+ "from member m, follow f "
				+ "where f.target_mem_no = ? "
				+ "and m.mem_no = f.mem_no"; 
				// 팔로우 한 회원의 회원번호 가 member 테이블의 회원번호와 같을 때 
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getTarget_mem_no());
			rs = ps.executeQuery();
			while(rs.next()) {
				Map<String,String> fr = new HashMap<>();
				// while문 밖에서 선언하면 key가 동일하기 때문에 value만 바뀝니다
				fr.put("mem_id", rs.getString("m.mem_id"));
				fr.put("mem_name", rs.getString("m.mem_name"));
				fr.put("fol_date", (rs.getDate("f.fol_date")).toString());
				list.add(fr);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null) ps.close();
				if(con!=null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(list.isEmpty()) {
			list = null;
		}else {
			list.trimToSize();
		}
		
		return list;
		// list 에 들어간 데이터는 <key,value> 형태의 HashMap 입니다
	}
	
	// follow 테이블에서 회원의 팔로잉 목록 조회시 기준이 되는 회원 번호는 mem_no 입니다.
	// 회원의 팔로잉 목록 조회
	public List<Object> myfollowing(FollowVO vo){
		
		ArrayList<Object> list = new ArrayList<Object>();
		
		String sql = "select m.mem_id, m.mem_name, f.fol_date " 
				+ "from member m, follow f "
				+ "where f.mem_no = ? "
				+ "and m.mem_no = f.target_mem_no";
		// f.mem_no : 팔로우 신청한 회원 
		// 팔로우한 회원의 회원번호가 member 테이블의 회원번호와 같아야
		// 현재 회원이 팔로잉중인 목록 출력 가능.
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getMem_no());
			rs = ps.executeQuery();
			while(rs.next()) {
				Map<String,String> fr = new HashMap<>();
				// while문 밖에서 선언하면 key가 동일하기 때문에 value만 바뀝니다
				fr.put("mem_id", rs.getString("m.mem_id"));
				fr.put("mem_name", rs.getString("m.mem_name"));
				fr.put("fol_date", (rs.getDate("f.fol_date")).toString());
				list.add(fr);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null) ps.close();
				if(con!=null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(list.isEmpty()) {
			list = null;
		}else {
			list.trimToSize();
		}
		
		return list;
		// list 에 들어간 데이터는 <key,value> 형태의 HashMap 입니다
	}
	

}
