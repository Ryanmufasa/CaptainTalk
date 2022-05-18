package member.memberDAO;

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

import member.memberVO.MemberVO;
//import member.memberDBConn.MemberDBConn;

public class MemberDAO {
	
	private static Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public MemberDAO() {}
	
	private static MemberDAO instance = new MemberDAO();
	// = new MemberDAO()
	// MemberDAO 클래스도 계속 지속적으로 사용해야 하므로 
	// static 객체를 생성하고 호출시에는 instance 를 호출하면 됩니다. 
	
	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}
	
	private static DataSource ds;
	
	static {
		try {

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			ds = (DataSource)envCtx.lookup("jdbc/oracle");
			con = ds.getConnection();
		}catch(NamingException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	// DAO 작성 예시 ( 전체 회원 목록 출력 )
	public List<MemberVO> selectAll(){
		
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		String sql = "select * from member"; 
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo = selectMember(rs);
			
				//vo.setNo(rs.getInt("no"));
				//vo.setId(rs.getString("id"));
				//vo.setPassword(rs.getString("password"));
				//vo.setName(rs.getString("name"));
				//vo.setTel1(rs.getString("tel1"));
				//vo.setTel2(rs.getString("tel2"));
				//vo.setTel3(rs.getString("tel3"));

				list.add(vo);
			}
			
		}catch(SQLException e){
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
	
	
	// 회원 가입 
	
	public boolean insertJoin(MemberVO vo) {
		
		boolean check = false;
		
		String sql = "insert into member values(member_seq.nextval,?,?,?,?,?,?)";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPassword());
			ps.setString(3, vo.getName());
			ps.setString(5, vo.getTel1());
			ps.setString(6, vo.getTel2());
			ps.setString(7, vo.getTel3());
			if(ps.executeUpdate() != 0) {
				check = true;  
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		 
		return check;
		// check가 true 로 리턴 -> 회원가입 성공
		// false 로 리턴 ->회원가입 실패 
	}
	
	
	// 로그인 확인
	public int login(String userID, String userPassword) {
		String sql = "SELECT userPassword FROM user WHERE userID = ?";
		try {
			ps = con.prepareStatement(sql); //sql쿼리문을 대기 시킨다
			ps.setString(1, userID); //첫번째 '?'에 매개변수로 받아온 'userID'를 대입
			rs = ps.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}else
					return 0; //비밀번호 틀림
			}
			return -1; //아이디 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //DB오류
	}
	
	
	// 회원 1명 불러올 때 사용 (DB에 등록된 회원일때만 사용)  
	private MemberVO selectMember(ResultSet rs) {
		
		MemberVO vo = null;
		
		try {
			if(rs.next()) {
				vo = new MemberVO();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	
	
	// 회원 정보 수정 
	public boolean updateMember(MemberVO vo) {
		
		boolean check = false;
		
		String sql = "update member set email = ?,tel1 = ?,tel2 = ?,tel3 = ? where no = ?";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(2, vo.getTel1());
			ps.setString(3, vo.getTel2());
			ps.setString(4, vo.getTel3());
			ps.setInt(5, vo.getNo());
			if(ps.executeUpdate() != 0) {
				check = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return check;  // true -> 정보 수정 성공, false -> 정보 수정 실패 
	}
	
	
	// 회원 삭제  또는  탈퇴 
	public boolean deleteMember(MemberVO vo) {
		
		boolean check = false;
		
		String sql="delete member where no=?";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			if(ps.executeUpdate() != 0) {
				check = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return check;  // true -> 회원 삭제 성공, false -> 회원 삭제 필패 
	}
	
	
	// 회원 친구 목록 조회 
	public List<MemberVO> selectFriends(MemberVO vo){
		
		ArrayList<MemberVO> frlist = new ArrayList<MemberVO>();
		// 친구 목록 담을 공간 
		
		String sql = "select f.id, f.name "
				+ "from member f, "
					+ "(select regexp_substr(m.friends, '[^,]+', 1, level) as no "
				    + "from "
						+ "(select friends as friends "
						+ "from member where no=?) m "
					+ "connect by level <= length(regexp_replace(m.friends, '[^,]+', ''))+ 1"
					+ ") m "
					+ "where f.no = m.no";
		// member 테이블 f 와 서브쿼리의 결과( , 이 포함된 문자열 데이터)를 행으로 구분지어 출력하는 서브쿼리 만든 테이블 m 이 조인 
		// m 은 친구 목록을 조회하는 회원, f는 m 의 친구목록에 저장된 친구 
		
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			rs = ps.executeQuery();
			while(rs.next()) { // 저장된 친구 목록이 조회되면 
				MemberVO vo1 = new MemberVO();
				vo1 = selectMember(rs); 
				
				frlist.add(vo1);
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(frlist.isEmpty()) {
			frlist = null;
		}else {
			frlist.trimToSize();
		}
			
		return frlist;
		
	}
	
	
	
	
	
	
	

}
