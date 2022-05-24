package member.addMemberDAO;

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

import member.addMemberVO.AddMemberVO;

public class AddMemberDAO {
	
	private static Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private static AddMemberDAO instance;

	private AddMemberDAO() {}
	
	public static AddMemberDAO getInstance() {
		if(instance == null) {
			instance = new AddMemberDAO();
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
	
	// sex 0,1,2 만 입력 가능. (0-비공개, 1-남성, 2-여성) 
	// email 은 unique 조건 있습니다.  -> 중복 체크 
	
	// 회원 추가 정보 불러오기
	// 회원 번호로 회원 추가정보 불러오기 
	public AddMemberVO selectInfo(AddMemberVO vo) {
		
		String sql = "select * from memberinfo where mem_no=?";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,vo.getMem_no());
			rs = ps.executeQuery();
			if(rs.next()) { 
				vo.setInfonum(rs.getInt("infonum"));
				vo.setMem_sex(rs.getInt("mem_sex"));
				vo.setMem_birthday(rs.getDate("mem_birthday"));
				vo.setMem_email(rs.getString("mem_email"));
				vo.setMem_region(rs.getString("mem_region"));
				vo.setMem_memo(rs.getString("mem_memo"));
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
		return vo;
	}
	
	
	//회원 추가 정보 입력  ( 맨 처음 입력시에만.. )
	//같은 회원번호로 중복 실행이 가능합니다. 맨 처음 입력할 때에만 사용해주세요 
	// --> pk infonum 추가로 중복 insert 불가. 
	public boolean addInfo(AddMemberVO vo) {
		//String sex, String birthday, String email, 
		//String region, String memo
		boolean check = false; 
		
		String sql = "insert into memberinfo "
				+ "values(infonum_seq.nextval,?,?,?,?,?,?)";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			
			//System.out.println("start");
			ps.setInt(1, vo.getMem_no());
			//System.out.println("1");
			ps.setInt(2, vo.getMem_sex());
			//System.out.println("2");
			ps.setDate(3, vo.getMem_birthday());
			//System.out.println("3");
			ps.setString(4, vo.getMem_email());
			//System.out.println("4");
			ps.setString(5, vo.getMem_region());
			//System.out.println("5");
			ps.setString(6, vo.getMem_memo());
			//System.out.println("6");
			if(ps.executeUpdate() != 0) {
				System.out.println("회원정보입력 성공");
				check = true;  
			}
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("회원정보입력 실패");
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		 
		return check;
		// check가 true로 리턴 -> 입력 성공
		// false로 리턴 -> 입력 실패 
	}
	
	
	// 회원 추가 정보 수정시
	// 이미 정보를 입력한 적 있는 회원은 insert를 사용하면 안됩니다. ( 중복 입력됨 )
	// update를 사용하도록 해주세요 
	// --> pk infonum 추가로 중복입력 안됨. 
	public boolean updateInfo(AddMemberVO vo) {
		
		boolean check = false;
		
		String sql = "update memberinfo set mem_sex=?, mem_birthday=?, "
				+ "mem_email=?, mem_region=?, mem_memo=? where mem_no=?";
				
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getMem_sex());
			ps.setDate(2, vo.getMem_birthday());
			ps.setString(3, vo.getMem_email());
			ps.setString(4, vo.getMem_region());
			ps.setString(5, vo.getMem_memo());
			ps.setInt(6, vo.getMem_no());
			if(ps.executeUpdate() != 0) { 
				// 해당 mem_no 가 추가정보를 입력한적이 있으면 update
				check = true;
				System.out.println("회원정보 수정 완료");
			} 
			//else {
				// 해당 mem_no가 추가정보를 입력한 적이 없으면 insert 실행
				// insert 중복 방지 위함. 
				// addInfo(vo) 리턴 타입 boolean 
				//check = addInfo(vo);
			//}  // pk 추가로 중복 입력 되지 않음. 
			
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
		// check가 true로 리턴 -> 수정 성공
		// false로 리턴 -> 수정 실패 
	}
	
	
	// 회원 추가정보 삭제시 
	public boolean deleteInfo(AddMemberVO vo) {
		
		boolean check = false;
		
		String sql = "delete memberinfo where mem_no=?";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getMem_no());
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
		
	}
	
	
	// email 중복 체크 시 활용 
	public List<AddMemberVO> selectAllEmail(){
		
		ArrayList<AddMemberVO> list = new ArrayList<AddMemberVO>();
		
		String sql = "select mem_email from memberinfo";
		AddMemberVO vo = null;
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				vo = new AddMemberVO();
				vo.setInfonum(rs.getInt("infonum"));
				vo.setMem_no(rs.getInt("mem_no"));
				vo.setMem_sex(rs.getInt("mem_sex"));
				vo.setMem_birthday(rs.getDate("mem_birthday"));
				vo.setMem_email(rs.getString("mem_email"));
				vo.setMem_region(rs.getString("mem_region"));
				vo.setMem_memo(rs.getString("mem_memo"));
				
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
