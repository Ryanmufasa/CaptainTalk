<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/layout/header.jsp" %>

<div align="center"> 

	<h3>내 기본 정보</h3>
	<table border ='1'>
		<tr>
			<td >아이디</td>
			<td >${login.mem_id }</td>
		</tr>
		<tr>
			<td >이름</td>
			<td >${login.mem_name }</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td >${login.mem_tel1 }-${login.mem_tel2 }-${login.mem_tel3 }</td>
		</tr>
		<tr><td colspan="2" align="center">
				<input type="button" value = "기본정보 관리" onclick="location.href ='/CaptainTalk/member/memUpdate.jsp'">
				<!-- <input type="button" value="비밀번호 변경하기"> -->
			</td>
		</tr>
	</table>
	<c:if test="${!empty msg2 }">
		<h2>msg2</h2>
	</c:if>
	<br>
	<h3>내 추가 정보</h3>
	<table border='1'> 
	<c:choose>
		<c:when test="${!empty info }">
		<tr>
		<c:if test="${!empty info.mem_sex}">
			<td>성별</td>
			<td><c:choose>
				<c:when test="${info.mem_sex eq 0}">비공개</c:when>
				<c:when test="${info.mem_sex eq 1}">남성</c:when>
				<c:when test="${info.mem_sex eq 2}">여성</c:when>
				<c:otherwise>미입력</c:otherwise>
				</c:choose>
			</td>
		</c:if>
		</tr>
		<tr>
		<c:if test="${!empty info.mem_birthday }">
			<td>생일</td>
			<td>${info.mem_birthday} </td>
		</c:if>
		</tr>
		<tr>
		<c:if test="${!empty info.mem_email }">
			<td>이메일</td>
			<td>${info.mem_email }</td>
		</c:if>
		</tr>
		<tr>
		<c:if test="${!empty info.mem_region}">
			<td>지역</td>
			<td>${info.mem_region }</td>
		</c:if>
		</tr>
		<tr>
		<c:if test="${!empty info.mem_memo }">
			<td>한마디</td>
			<td>${info.mem_memo }</td>
		</c:if> 
		</tr>
		</c:when>
		
		<c:otherwise>
		<tr>
			<td colspan="2">
			 ${msg }
			</td>
		</tr>
		</c:otherwise>
	</c:choose>
		<tr>
		<td colspan='2' align="center">
			<input type="button" value = "추가정보 관리" onclick="location.href ='/CaptainTalk/member/meminfoAdd.jsp'">
		</td>
		</tr>
	</table>
	
</div>


<%@ include file="/layout/footer.jsp"%>
