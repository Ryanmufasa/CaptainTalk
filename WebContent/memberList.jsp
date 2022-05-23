
<%@page import="member.memberDAO.MemberDAO"%>
<%@page import="member.memberVO.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
MemberDAO manager = MemberDAO.getInstance();
	// DAO 클래스의 getList() 호출하여 리턴된 값을 받음
	List<MemberVO> list = manager.getList();
	MemberVO data = new MemberVO();
%>

<% public List<MemberVO> getList(){
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		Connection conn = null;
		PreparedStatement ppst = null;
		ResultSet rs = null; // ResultSet import!
		ArrayList<MemberVO> list = null;

%>	
	
<html>
<head>
<meta charset=UTF-8">
<title>친구목록</title>
</head>
<body>


<%try {
			// JDBC Driver 로딩
			Class.forName(driver);
			// Connection 객체 생성 / DB 연결(접속)
			conn = DriverManager.getConnection(url, "scott", "tiger");
			// 수행할 쿼리 정의 / 특정 데이터만 검색하고자 한다면 where 조건절과 매개변수 추가 필요
			ppst = conn.prepareStatement("select * from member");
			// 쿼리 수행
			rs = ppst.executeQuery();
			// 수행된 결과를 List<MemberInfoDTO)에 저장
			if(rs.next()){
				list = new ArrayList<>(); // List 객체 생성
				do {
					// 반복문이 수행될 때 마다 MemberInfoDTO 생성(참조값이 다름)
					MemberVO data = new MemberVO();
					// 생성된 객체(data)에 수행된 쿼리의 값(해당 컬럼)을 순서대로 저장
					data.setMem_name(rs.getString("name"));
					data.setMem_id(rs.getString("id"));
					// list에 0번 index부터 순서대로 data 객체의 참조값을 저장
					list.add(data);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ppst != null) ppst.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.getStackTrace();
			}
		}
		return list; // list 리턴
	}
	
	%>

	<header>
		<h1>친구목록</h1>
	</header>

	<h2 align="center">친구</h2>
	<table border="1" width="300" align="center">
		<tr>
			<td>이름</td>
			<td>아이디</td>
		</tr>
		<%
			for(int i=0; i < list.size(); i++){
				data = list.get(i); // 0번 인덱스부터 담긴 데이터를 data에 할당
				// list에 저장된 데이터 출력
		%>
		<tr>
			<td><%=data.getMem_name() %></td>
			<td><%=data.getMem_id() %></td>
		<tr>
			<%		
			} // for문 종료
		%>
		
	</table>
</body>
</html>
