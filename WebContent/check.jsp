<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="member.memberDAO.MemberDAO"%>
    <%@page import="member.memberVO.MemberVO"%>
	<%@page session="true"%>
<%

	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberVO vo = new MemberVO();
	vo.setMem_id(id);
	vo.setMem_password(pw);
	//vo.setMem_id(request.getParameter("id"));
	//vo.setMem_password(request.getParameter("pw"));
	
	MemberDAO dao = MemberDAO.getInstance();
	
	//vo = dao.checkLogin(vo);
	
	//String name = dao.checkLogin(id, pw);
	
	vo = dao.checkLogin(vo);
	System.out.println("vo리턴 후 받아온 mem_name"+vo.getMem_name());
		
	boolean check = false;
	String msg = null;

	if(vo!=null){
		msg = vo.getMem_name() + "님이 로그인 하셨습니다.";
		check = true;
		session.setAttribute("login",vo);
	}else{
		msg = "아이디 혹은 비밀번호가 잘못되었습니다.";
	}
	
	request.setAttribute("check", check);
	request.setAttribute("msg", msg);
	
	pageContext.forward("result.jsp");

%>
