<%@page import="java.util.List"%>
<%@page import="chat.chatDAO.ChatDAO"%>
<%@page import="chat.chatVO.ChatVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <script type="text/javascript">
	function check(){
		document.list.submit();
	}
</script>--%>
<%
	request.setCharacterEncoding("UTF-8");

// 	String ch_id = request.getParameter("ch_id");
// 	String ch_title = request.getParameter("ch_title");
	// 원래 썼는데 삭제해도 될것같은 부분
	// 위 문법을 쓰기에는 전 페이지에서 받아온 값이 없음
	// 굳이 받아올 값이 필요하진 않을것 같음. check.jsp 따라하다 보니깐....

	//임시로 dao의 이름은 ChatDAO라고 설정.
	ChatDAO dao = ChatDAO.getInstance();
	
	// 객체 list는 모든 채팅테이블에대한 정보를 받는 list
	// dao에선 'select * form CHAT'로 해서
	// 모든 정보를 list로 담아놨음
	List<ChatVO> list = dao.selectAll();
	
%>

<!-- 4초마다 페이지 초기화 // 새로운 채팅방이 생겼나 4초마다 확일할 수 있게-->
<META HTTP-EQUIV="refresh" CONTENT="4">

<%-- <%@ include file="./layout/header.jsp"%> --%>
<div align="center">
	<table class="boardTable">
		<tr>
			<th  width="80">번호</th>
			<th  width="300">채팅창 제목</th>
			<th  width="80">호스트</th>
		</tr>
		<c:choose><%-- 분기문 시작 --%>
<!-- 				만약 리스트에 정보가 있다면 있다면 -->
			<c:when test="${list.size() != 0 }">
				<c:forEach var = "list" items="${list }"> <%-- vo에서 채팅창을 불러옴 반복문 --%>
				<!--  여기가 문제를 해결해야할 point -->
				<!--  원래태그는 var = "vo" items="${list}" -->
				<!-- 호형님 피셜-->
				<!-- 리스트에 있는 vo를 꺼내는거지 list를 꺼내는 문법은 아닌것 같음 -->
				<!-- 이러면 리스트에 잇는게 그냥 죄다 출력될것 -->
				<!-- var = list로 바꾼다고 해도, items가 왜필요한거지...
					 게시판 예제에서는 분명 리스트가 필요해서 뽑은걸텐데....
				 -->
				 <!-- 일단 아래에서 list에 대한 정보가 필요하니깐
				 	  ${list}로 하는데 쫌만 더 생각해보자
				  -->
				
				
					<tr>
<%-- 						<td>${vo.ch_imsi }</td> --%>
						<td>${list.ch_id }</td>
						<!-- 위에 선언된 list에서 ch_id를 불러옴 -->
						<td>
							<a href="./main.jsp?ch_id=${list.ch_id }">
							
							${list.ch_title }</a>
						</td>
						<td>호스트이름</td>
						
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise><%--${list == null }"--%>
				<tr>
					<td colspan="5" align="center">
						<span style="font-weight: bold;">열려있는 채팅창이 없습니다.</span>
					</td>
				</tr>
			</c:otherwise><%-- default. 따로 설정안했음 --%>
		</c:choose><%--분기문 종료 --%>
	</table>
<%-- 	<c:if test="${login != null }"> --%>

	<script>
		function roomname() {
				window.open("./makeRoom/roomName.jsp","popupWin1",
					"width=370,height=200,top=20,left=350,loaction=no,menubar=0")
		}
	</script>
	
		 <div class="btnBox">
		 		<input type=button value ="채팅창 만들기" onclick="roomname()">
		 		<!-- onclick="loation.href = 'creatroom.jsp'"> -->
		</div>
		
		<!-- 직접 페이지 새로고침 -->
		<form>
			<input type="button" value="페이지 새로 고침" onClick="window.location.href=window.location.href">
		</form>
		
		
		
		
		
		
<%-- 	</c:if> --%>
	
	
	<%-- 번호에 따라 페이지가 넘아가는 기법은 지금 페이지에서 굳이 사용할 필요는 없을듯 하다.. --%>
	
<%-- 	<c:if test="${nowPage > 2 }"> --%>
<%-- 		<a href="/MyHome/board/list.brd?start=${start - 10 }">[이전]</a> --%>
<%-- 	</c:if> --%>
<%-- 	<c:if test="${nowPage > 1 }"> --%>
<%-- 		<a href="/MyHome/board/list.brd?start=${start - 5 }">[${nowPage - 1 }]</a> --%>
<%-- 	</c:if> --%>
<%-- 	[${nowPage }] --%>
<%-- 	<c:if test="${nowPage < totalPage }"> --%>
<%-- 		<a href="/MyHome/board/list.brd?start=${start + 5 }">[${nowPage + 1 }]</a> --%>
<%-- 	</c:if> --%>
<%-- 	<c:if test="${nowPage + 1 < totalPage }"> --%>
<%-- 		<a href="/MyHome/board/list.brd?start=${start + 10 }">[다음]</a> --%>
<%-- 	</c:if> 이 페이지 나누는걸 for문으로 돌려서 할 수 있다… --%>
</div>
<%--
로그인 계정으로 들어가면  글쓰기  버튼이 있어서 글도 입력, 파일도 업로드 하게 만들기..
 —--%>

<%-- <%@ include file="/layout/footer.jsp"%> --%>