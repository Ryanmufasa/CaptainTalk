<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="conn.conn"%>
<%@page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	
	int rowcnt = 0;
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	
	//1.드라이버 로드, 2. conn 생성
	System.out.println("conn 생성 시작");
	conn = new conn("joinok.jsp").getConnection();
	System.out.println("conn 생성 종료");
	
	try{
		// 3. 중복된 아이디 체크 sql
		String sql = "SELECT * FROM member WHERE id = ?";
		
		// 4. pstmt 생성
		System.out.println("ps 생성 시작");
		ps = conn.prepareStatement(sql);
		System.out.println("ps 생성 완료");
				
		ps.setString(1, id);
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rowcnt = ps.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
    	}
		
		if(rowcnt == 0) { // 5. 아이디가 존재하지 않을 경우
			System.out.println("중복된 아이디가 없습니다");
			// 6. member 테이블에 값 넣을 sql문 작성
			sql = "insert into member values(?, ?, ?, ?, ?, ?)";
			
			try {
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, pw);
				ps.setString(3, name);
				ps.setString(4, phone1);
				ps.setString(5, phone2);
				ps.setString(6, phone3);
				
				int result = ps.executeUpdate();
				
				if(result == 1){ //insert 성공
					response.sendRedirect("join_succes.jsp");
				} else{ //insert 실패
					response.sendRedirect("join_fail.jsp");
				}
				
			}catch(SQLException e){
				System.out.println("중복되지 않은 아이디 삽입 실패");
				//e.printStackTrace();
	    	}finally {
	    		try { rs.close(); } catch (Exception e) { /* ignored */ }
			    try { ps.close(); } catch (Exception e) { /* ignored */ }
			    try { conn.close(); } catch (Exception e) { /* ignored */ }
	    	}
		}else {
			System.out.println("중복된 아이디가 있습니다");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>