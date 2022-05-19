<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <script type="text/javascript">
	function check(){
		document.list.submit();
	}
</script>--%>
<%@ include file="./layout/header.jsp"%>
<div align="center">
	<table class="boardTable">
		<tr>
			<th  width="80">번호</th>
			<th  width="300">채팅창 제목</th>
			<th  width="80">호스트</th>
		</tr>
		<c:choose><%-- 분기문 시작 --%>
			<c:when test="${list != null }"><%-- 만약 채팅창이 있다면 --%>
				<c:forEach var = "vo" items="${list }"> <%-- vo에서 채팅창을 불러옴 반복문 --%>
					<tr>
						<td>${vo.seq }</td>
						<td>
<%-- 							<a href="/MyHome/board/content.brd?seq=${dto.seq }"> --%>
							<a href="./main.jsp?ch_id=${vo.seq }">
							${vo.ch_title }</a>
						</td>
						<td>${vo.id }</td>
						
					</tr>
				</c:forEach> <%-- 반복문 종료 --%>
			</c:when><%--조건문 종료 --%>
			<c:otherwise><%--${list == null }"--%>
				<tr>
					<td colspan="5" align="center">
						<span style="font-weight: bold;">열려있는 채팅창이 없습니다.</span>
					</td>
				</tr>
			</c:otherwise><%-- default. 따로 설정안했음 --%>
		</c:choose><%--분기문 종료 --%>
	</table>
	<c:if test="${login != null }">
		 <div class="btnBox">
<!-- 		 		<input type=button value="채팅창 만들기" onclick="location.href = '/MyHome/board/writeForm.brd'"> -->
		 		<input type=button value ="채팅창 만들기" onclick="loation.href = 'creatroom.jsp'">
		</div>
	</c:if>
	
	
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

<%@ include file="/layout/footer.jsp"%>