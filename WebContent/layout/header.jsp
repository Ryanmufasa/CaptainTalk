<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% //모든세션 삭제
   //session.invalidate(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/resource/js/jquery-3.6.0.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/style.css">

<title>CaptainTalk</title>
</head>
<body>
	<div align="center">
		<div class="header">
			<c:choose>
				<c:when test="${login  != null}"> 
					<a href = "member/myPage.jsp"> My Page </a> 
					<a href = "login/logout.jsp"> Logout </a>
					<a href = "chatRoom/roomList.jsp"> Chat Room </a>
				</c:when>
				<c:otherwise>
					<a href ="login/login.jsp"> login </a>
					<a href ="join/join.jsp"> join </a>
				</c:otherwise>
			</c:choose>
			
			<a href="/CaptainTalk/"> Home </a>
		
		
		</div>
		
		<div class="main">