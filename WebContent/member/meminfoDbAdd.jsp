<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.addMemberDAO.AddMemberDAO"%>
<%@page import="member.addMemberVO.AddMemberVO"%>
<%@page import="member.memberVO.MemberVO"%>
<%@page import="java.sql.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	MemberVO voo = (MemberVO)session.getAttribute("login");
	int no = voo.getMem_no();
	//System.out.println(no);

	int sex = Integer.parseInt(request.getParameter("sex"));
	
	//String birthdayStr = request.getParameter("birthday");
	//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//Date birthday = sdf.parse(birthdayStr);
	
	String bday = request.getParameter("date");
	SimpleDateFormat sbday = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date birthday = sbday.parse(bday);	
	
	long timeInMilliSeconds = birthday.getTime(); 
	java.sql.Date date = new Date(timeInMilliSeconds);
	// request.getParameter 로 넘어온 값은 String 형태임
	// 날짜 형식으로 포맷하고 sql Date 형태로 형 변환 

	String email = request.getParameter("email");
	String region = request.getParameter("region");
	String memo = request.getParameter("memo");
	
	AddMemberVO vo = new AddMemberVO();
	vo.setMem_no(no);
	vo.setMem_sex(sex);
	vo.setMem_birthday(date);
	vo.setMem_email(email);
	vo.setMem_region(region);
	vo.setMem_memo(memo);
	
	
	AddMemberDAO dao = AddMemberDAO.getInstance();
	
	vo = dao.selectInfo(vo); // 추가정보 입력한적 있는지 확인. 
	
	boolean check =false;
	String msg = null;
	
	if(vo.getInfonum() != 0){ // 추가한적이 있다면 infonum 이 있음. 
		// update 사용해야 함. 
		check = dao.updateInfo(vo);
	} else {
		check = dao.addInfo(vo); 
	}	
	
	if(check){ // insert 또는 update  true 반환시 
		vo.setMem_no(no);
		vo.setMem_sex(sex);
		vo.setMem_birthday(date);
		vo.setMem_email(email);
		vo.setMem_region(region);
		vo.setMem_memo(memo);
		session.setAttribute("info",vo);
		msg = voo.getMem_id() + "님의 회원 정보를 수정하였습니다.";
	}else{
		msg = "잘못된 형식의 데이터를 입력하였습니다.";
	}
		
	request.setAttribute("check", check);
	request.setAttribute("msg", msg);
	
	
	pageContext.forward("meminfoDBAddResult.jsp");
%>