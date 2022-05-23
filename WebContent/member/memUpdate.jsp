<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/layout/header.jsp" %>
<script>

$(function(){
	$('.btnUp').click(function(){
		if($("input[name=newName]").val() == ""){
			alert("이름을 입력하세요")
			$("input[name=newName]").focus();
		}else if($('input[name=pw]').val() == ""){
			alert("비밀번호를 입력하세요")
			$('input[name=pw]').focus();
		}else if($('input[name=pw2]').val() == ""){
			alert("비밀번호 확인을입력하세요")
			$('input[name=pw2]').focus();
		}else if($('input[name=pw]').val() != $('input[name=pw2]').val()){
			alert("비밀번호가 일치하지 않습니다")
			
		}else if($('input[name=tel1]').val() == ""){
			alert("전화번호 입력1을 확인하세요")
			$('input[name=tel1]').focus();
		} else if($('input[name=tel2]').val() == ""){
			alert("전화번호 입력2을 확인하세요")
			$('input[name=tel2]').focus();
		} else if($('input[name=tel3]').val() == ""){
			alert("전화번호 입력3을 확인하세요")
			$('input[name=tel3]').focus();
		}else{
			$('form').submit();
		}
	})
})
</script>


<div align="center">
	
	<h3>내 기본 정보 수정</h3>
	<form action = "memUpdateCheck.jsp" method="post">
	<table border ='1'>
		<tr>
			<td >아이디</td>
			<td >${login.mem_id }</td>
		</tr>
		<tr>
			<td >이름</td>
			<td ><input type="text" value="${login.mem_name }" name="newName"></td>
		</tr>
		<tr>
			<td >비밀번호</td>
			<td ><input type="password"  name="pw"></td>
		</tr>
		<tr>
			<td >비밀번호 확인</td>
			<td ><input type="password"  name="pw2"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" value="${login.mem_tel1 }" size='4' name="tel1">-
				<input type="text" value="${login.mem_tel2 }" size='4' name="tel2">-
				<input type="text" value="${login.mem_tel3 }" size='4' name="tel3">
			</td>
		</tr>
		<tr><td colspan="2" align="center">
				<input type="button" value = "정보 수정" class="btnUp">
				<input type="button" value="취소" onclick='window.history.back()'>
			</td>
		</tr>
	</table>
	</form>
</div>



<%@ include file="/layout/footer.jsp"%>