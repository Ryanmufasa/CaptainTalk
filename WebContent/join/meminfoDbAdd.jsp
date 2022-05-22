<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="member.addMemberDAO.AddMemberDAO"%>
    <%@page import="member.addMemberVO.AddMemberVO"%>
    <%@page import="member.memberVO.MemberVO"%>
    <%@page import="java.util.Date"%>
    <%@page import="java.text.SimpleDateFormat"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	MemberVO voo = (MemberVO)session.getAttribute("login");
	int no = voo.getMem_no();
	System.out.println(no);
	int sex = Integer.parseInt(request.getParameter("sex"));
	//String birthdayStr = request.getParameter("birthday");
	//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//Date birthday = sdf.parse(birthdayStr);
	
	String birthday = request.getParameter("birthday");
	String email = request.getParameter("email");
	String region = request.getParameter("region");
	String memo = request.getParameter("memo");
	
	AddMemberVO vo = new AddMemberVO();
	vo.setMem_no(no);
	vo.setMem_sex(sex);
	vo.setMem_birthday(birthday);
	vo.setMem_email(email);
	vo.setMem_region(region);
	vo.setMem_memo(memo);
	//vo.setMem_sex(request.getParameter("sex"));
	//vo.setMem_birthday(request.getParameter("bityhday"));
	//...
	
	AddMemberDAO dao = AddMemberDAO.getInstance();
	
	
	boolean boo = dao.addInfo(vo);
	
	boolean check = false;
	String msg = null;

	if(boo==true){
		msg = vo.getMem_no() + "번호의 회원 정보를 수정하였습니다.";
		check = true;
	
	}else{
		msg = "잘못된 형식의 데이터를 입력하였습니다.";
	}
	
	request.setAttribute("check", check);
	request.setAttribute("msg", msg);
	
	
	pageContext.forward("meminfoDbAddResult.jsp");

%>