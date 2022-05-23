<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>



	<div id="aa" align="center">
		<h2>추가 정보 입력</h2>
			<form action="meminfoDbAdd.jsp" method="post">
			<table border="1" style="margin:auto; text-align:center" width="390" height="360">
				<tr height="60">
					<td>성별</td>
					<td>
					<input type="radio" name="sex" value="1"/>남성
					<input type="radio" name="sex" value="2"/>여성
					<input type="radio" name="sex" value="0"/>비공개
					</td>
				</tr>
				<tr height="60">
					<td>생일</td>
					<td><input type="date" name="date" style="width:260px; height:22px; font-size:15px;"></td>
				</tr>
				<tr height="60">
					<td>메일</td>
					<td><input type="text" name="email" style="width:260px; height:22px; font-size:15px;"></td>
				</tr>
				<tr height="60">
					<td>지역</td>
					<td><input type="text" name="region" style="width:260px; height:22px; font-size:15px;"></td>
				</tr>
				<tr height="60">
					<td>메모</td>
					<td><input type="text" name="memo" style="width:260px; height:22px; font-size:15px;"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="회원정보수정" style="width:280pt; height:32pt"></td>
				</tr>
			</table>
		</form>
	</div>

<%@ include file="/layout/footer.jsp"%>