<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %> 
<script>

$(function(){
	$('.btnlogin').click(function(){
		if($("[name=id]").value == ""){
			alert("아이디를 입력하세요")
			$(this).focus();
		}else if($('[name=pw]').value == ""){
			alert("비밀번호를 입력하세요")
			$(this).focus();
		}else{
			$('form').submit();
		}
	})
})
</script>

	<h2>로그인</h2>
	<div id="mq1">
		<img src="/CaptainTalk/picture/mainImg.jpg" width=200>
	</div><br>
	
	<form action="check.jsp" method="post">
	
		<div class="input-box">
			<input id="id" type="text" name="id" placeholder="아이디">
			<label for="id">아이디</label>
		</div>
		
		<div class="input-box">
			<input id="pw" type="password" name="pw" placeholder="비밀번호">
			<label for="pw">비밀번호</label>
		</div>
		<table cellspading="30%"> 
			<tr> 
				<td ><button class="btnlogin">로그인</button></td>
				<td ><button onclick="location.href='/CaptainTalk/join/join.jsp'">회원가입</button></td>
				<td ><button onclick="history.back()">취소</button></td>
			</tr>
		</table>
	</form>

	
<%@ include file="/layout/footer.jsp"%>