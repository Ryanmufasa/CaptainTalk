<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.memberDAO.MemberDAO"%>
<%@page import="member.memberVO.MemberVO"%>
<%@page import="classifyroom.classifyroomDAO.ClassifyroomDAO"%>
<%@page import="classifyroom.classifyroomVO.ClassifyroomVO"%>
<%@page import="chat.chatDAO.ChatDAO"%>
<%@page import="chat.chatVO.ChatVO"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	out.println("넘겨받은 아이디 : "+id);
	out.println("넘겨받은 비번 : "+pw);
	
	
	MemberVO vo = new MemberVO();
	vo.setMem_id(id);
	vo.setMem_password(pw);

	MemberDAO dao = MemberDAO.getInstance();
	vo = dao.checkLogin(vo);
	
	//채팅 도중 로그아웃을 통하지 않고 예기치 않게 프로그램을 종료한 경우 채팅방에서 제거하기 위한 과정
	
	//DAO함수의 out_room, delete_room 기능을 활용하기 위해 VO,DAO를 선언
	ChatVO vo2 = new ChatVO();
	ChatDAO dao2 = ChatDAO.getInstance();
	
	//원치 않은 프로그램 종료를 한 사용자가 들어있는 채팅방을 구한다
	String checkRoom = dao2.get_name(id);
	//사용자를 방에서 삭제한다
	dao2.out_room(checkRoom, id);
	//방이 비어있다면 방을 삭제한다
	dao2.delete_room();
	
	
	//마찬가지로 예기지 않은 프로그램 종료 시 classifyroom에 있는 사용자를 room에서 제거
	ClassifyroomVO co = new ClassifyroomVO();
	ClassifyroomDAO cao = ClassifyroomDAO.getInstance();
	
	String lestmember = vo.getMem_id();
	//room에서 제거
	cao.outRoom(lestmember);
	
	
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
	
	pageContext.forward("loginResult.jsp");
%>