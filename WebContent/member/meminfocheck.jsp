<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.memberVO.MemberVO"%>
<%@page import="member.addMemberDAO.AddMemberDAO"%>
<%@page import="member.addMemberVO.AddMemberVO"%>
<%
	request.setCharacterEncoding("UTF-8");	

	MemberVO vo = (MemberVO)session.getAttribute("login");
	
	int no = vo.getMem_no();

	AddMemberVO vo1 = new AddMemberVO();
	vo1.setMem_no(no);
	
	String msg = null;
	
	vo1 = AddMemberDAO.getInstance().selectInfo(vo1);
	// 해당 계정이 추가정보를 입력한 적이 있는지 확인한다.
	if(vo1.getInfonum() != 0){
		// 입력한 적이 있다면 
		session.setAttribute("info",vo1);
		// 세션에 info 라는 이름으로 vo1 객체를 저장한다.
	}else{
		msg = "입력한 추가 정보가 없습니다.";
	}
	
	
	request.setAttribute("msg",msg);
	
	pageContext.forward("meminfo.jsp");
	
	
	
	
	
	


%>