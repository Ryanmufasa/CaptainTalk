package follow.followDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
				vo.setFol_date(rs.getDate("fol_date"));
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
	
	// 팔로워 목록, 팔로잉 목록 조회할때 날짜가 같이 조회되므로
	// 회원번호가 동일한 중복 팔로워, 중복 팔로잉이 있어도 제외할 수 없습니다.
	// 팔로우를 할 때 먼저 중복 여부를 체크해야 합니다. 
	
	// follow 테이블에서 회원의 팔로워 조회시 기준이 되는 회원 번호는 target_mem_no 입니다.
	// 회원의 팔로워 목록 조회 ( 팔로워의 아이디, 이름, 날짜 )
	public List<Object> myfollower(FollowVO vo){
		
		ArrayList<Object> list = new ArrayList<Object>();
		
		String sql = "select m.mem_id, m.mem_name, f.fol_date " 
				+ "from member m, follow f "
				+ "where f.target_mem_no = ? "
				+ "and m.mem_no = f.mem_no"; 
				// 팔로워 회원의 회원번호 가 member 테이블의 회원번호와 같을 때 
		
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
	
	
		
	// 다른 회원 팔로우 하기
	// 중복 팔로우가 가능. 팔로우 전에 중복 여부 체크 해야 하므로 private
	private boolean following(FollowVO vo) {
		//int mem_no, int target_mem_no
		boolean check = false;
	
		String sql="insert into follow values(follow_seq.nextval,?,?,sysdate)";
		
		try {
			con = ds.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getMem_no());
			ps.setInt(2, vo.getTarget_mem_no());
			if(ps.executeUpdate() != 0 ) {
				check = true;
			}
		}catch(SQLException e) {
			
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
	}
	
	
	// 중복 여부 확인하고 팔로우 
	public boolean checkFollow(FollowVO vo) {
		 //int mem_no, int target_mem_no
		boolean check = false;
		
		String sql = "select m.mem_no"
				+ "from member m, follow f "
				+ "where m.mem_no = f.mem_no "
				+ "and m.mem_no = ? "
				+ "and f.target_mem_no = ? ";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getMem_no());
			ps.setInt(2, vo.getTarget_mem_no());
			rs = ps.executeQuery();
			if(rs != null) { // 참일경우 이미 팔로우 한 상태.
				return check; // check = false;
			}else {
				//check = true;
				//vo = following(vo);
				check = following(vo); // private 메소드 실행 
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
	}
	
	// 언팔로우 (팔로우 정보가 중복일시 중복행 전부 삭제) 
	public boolean unfollow(int mem_no, int target_mem_no) {
		
		boolean check = false;
		
		String sql="delete follow where mem_no = ? and target_mem_no=?";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, mem_no);
			ps.setInt(2, target_mem_no);
			if(ps.executeUpdate() != 0) {
				check = true;
			}
		}catch(SQLException e) {
			
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
	}
	
	// 맞팔 확인 ( 맞팔인 경우에만 추가 정보 공개하기 위함 )
	public boolean eachFollow(FollowVO vo) { 
		
		boolean check = false;
		
		String sql = "select mem_no, target_mem_no from follow "
				+ "where mem_no = ? and target_mem_no = ? "
				+ "union "
				+ "select mem_no, target_mem_no from follow "
				+ "where mem_no = ? and target_mem_no = ? "
				+ "group by mem_no, target_mem_no"; // 중복데이터 제외
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getMem_no());
			ps.setInt(2, vo.getTarget_mem_no());
			ps.setInt(3, vo.getTarget_mem_no()); // mem_no 에 target_mem_no 를 넣고 
			ps.setInt(4, vo.getMem_no()); // targem_mem_no 에 mem_no 를 넣어 서로간 조회합니다.
			rs = ps.executeQuery();
			if(rs.next()) { // 둘중 하나라도 팔로우가 있으면 true
				rs.last(); // 마지막 행으로 이동 
				if(rs.getRow() == 2) { // 맞팔인 경우 마지막 행번호 2 
					check = true; 
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return check;
	}
	
	


}
