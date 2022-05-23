<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>

	<div align="center">
		${msg }<br>
		<c:if test="${check }">
			<a href="/CaptainTalk/login/login.jsp">로그인 하러 가기 </a>
		</c:if>
		<c:if test="${!check }">
			ID찾기 <br>  <!-- 구현시 DAO추가 필요 -->
			PW찾기 <br> 
			
		</c:if>
		
	</div>

<%@ include file="/layout/footer.jsp" %>