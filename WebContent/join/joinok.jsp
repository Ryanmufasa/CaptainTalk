<%@page import="member.memberDAO.MemberDAO"%>
<%@page import="member.memberVO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	MemberVO vo = new MemberVO();
	
	vo.setMem_id(request.getParameter("id"));
	vo.setMem_password(request.getParameter("pw"));
	vo.setMem_name(request.getParameter("name"));
	vo.setMem_tel1(request.getParameter("tel1"));
	vo.setMem_tel2(request.getParameter("tel2"));
	vo.setMem_tel3(request.getParameter("tel3"));
	
	MemberDAO dao = MemberDAO.getInstance();
	
	boolean check = dao.insertJoin(vo);
	String msg = null;
	
	if(check){
		msg = vo.getMem_name() + "님 회원가입 환영환영.";
	}else{
		msg = "회원가입 실패실패";
	}
	
	request.setAttribute("check", check);
	request.setAttribute("msg", msg);
	
	pageContext.forward("../result.jsp");
%>
