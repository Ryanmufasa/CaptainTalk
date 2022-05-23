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
	
	String msg = null;
	
	if(session.getAttribute("info") != null){
		// 세션저장된게 있으면 페이지 바로 넘어가기 
		System.out.println("info 세션 있어서 바로 넘어감");
	} else {
		// 세션 저장 된게 없으면
		// memberinfo 테이블에 DB있는지 조회
		System.out.println("DB 입력된 추가정보 있음. ");
		vo1.setMem_no(no);
		vo1 = AddMemberDAO.getInstance().selectInfo(vo1);
		
		if(vo1.getInfonum() != 0){
			// 입력한적이 있으면 세션에 객체 저장
			session.setAttribute("info",vo1);
			System.out.println("memberinfo 객체 세션 저장 ");
		}	
	}

	pageContext.forward("meminfo.jsp");
	
%>