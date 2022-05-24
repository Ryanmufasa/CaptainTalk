<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.memberVO.MemberVO"%>
<%@page import="member.memberDAO.MemberDAO"%>    
<% 

	request.setCharacterEncoding("UTF-8");

	MemberVO vo = (MemberVO)session.getAttribute("login");
	
	// 입력 값을 받아서 기본정보 update 
	String name = request.getParameter("newNane");
	String password = request.getParameter("pw");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	
	//vo.setMem_name(request.getParameter("newNane"));
	//vo.setMem_password(request.getParameter("pw"));
	//vo.setMem_tel1(request.getParameter("tel1"));
	//vo.setMem_tel2(request.getParameter("tel2"));
	//vo.setMem_tel3(request.getParameter("tel3"));
	
	vo.setMem_password(password);
	
	if(name == null){
		name = vo.getMem_name();
		vo.setMem_name(name);
	}else{
		vo.setMem_name(name);
	}
	
	vo.setMem_tel1(tel1);
	vo.setMem_tel2(tel2);
	vo.setMem_tel3(tel3);
	vo.setMem_no(vo.getMem_no());
	
	MemberDAO dao = MemberDAO.getInstance();
	
	boolean check = false;
	
	check = dao.updateMember(vo);
	String msg2=null;
	
	if(check){
		vo.setMem_name(name);
		vo.setMem_password(password);
		vo.setMem_tel1(tel1);
		vo.setMem_tel2(tel2);
		vo.setMem_tel3(tel3);
		session.setAttribute("login",vo);
		pageContext.forward("memResult.jsp");

	}else{
		msg2 = "수정실패";
	
		request.setAttribute("msg2",msg2);
	
		pageContext.forward("meminfo.jsp");
	
	}

	
	



%>