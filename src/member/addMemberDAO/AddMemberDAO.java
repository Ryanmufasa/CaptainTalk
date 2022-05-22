package member.addMemberDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Date;

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
	// = new MemberDAO()
	// MemberDAO 클래스도 계속 지속적으로 사용해야 하므로 
	// static 객체를 생성하고 호출시에는 instance 를 호출하면 됩니다. 
	
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
	
	//회원 추가 정보 입력
	public boolean addInfo(AddMemberVO vo) {
		//String sex, String birthday, String email, 
		//String region, String memo
		boolean check = false; 
		
		String sql = "insert into memberinfo "
				+ "values(?,?,?,?,?,?)";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			
			System.out.println("start");
			ps.setInt(1, vo.getMem_no());
			System.out.println("1");
			ps.setInt(2, vo.getMem_sex());
			System.out.println("2");
			ps.setString(3, vo.getMem_birthday());
			System.out.println("3");
			ps.setString(4, vo.getMem_email());
			System.out.println("4");
			ps.setString(5, vo.getMem_region());
			System.out.println("5");
			ps.setString(6, vo.getMem_memo());
			System.out.println("6");
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
	
	
}
