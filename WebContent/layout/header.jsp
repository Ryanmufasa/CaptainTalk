<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<a href = "/CaptainTalk/member/myPage.jsp">My Page</a> 
					<a href = "/CaptainTalk/login/logout.jsp">Logout</a>
					<a href = "/CaptainTalk/makeRoom/makeRoom.jsp">Make Chat Room</a>
				</c:when>
				<c:otherwise>
					<a href ="/CaptainTalk/login/login.jsp">login</a>
					<a href ="/CaptainTalk/join/join.jsp">join</a>
				</c:otherwise>
			</c:choose>
			
			<a href="/CaptainTalk/">Home</a>
		
		
		</div>
		
		<div class="main">