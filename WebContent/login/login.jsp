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


	<form action="/CaptainTalk/login/check.jsp" method="post" name="login">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="로그인" class="btnlogin">
				</td>
			</tr>
		</table>
	</form>
	
<%@ include file="/layout/footer.jsp"%>