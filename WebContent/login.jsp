<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<style>

/* body{color : yellow;} */

/* 아이디와 비밀번호의 style */
.input-box{ position:relative; margin:10px 0; }

/* 배경 투명하게, 테두리 0
   맨아래만 1px로 라인보이게
 */
.input-box >input
{ background:transparent; border:none; border-bottom: solid 1px #ccc; padding:20px 0px 5px 0px; font-size:14pt; width:100%; }

/* 배경 투명하게, 테두리 0
   맨아래만 1px로 라인보이게
 */
.input-box >input
{ background:transparent; border:none; border-bottom: solid 1px #ccc; padding:20px 0px 5px 0px; font-size:14pt; width:100%; }


/* placeholder의 color를 투명하게 */
input::placeholder{ color:transparent; }


/* placeholder 인척 할 label의 style */
input:placeholder-shown + label{ color:#aaa; font-size:14pt; top:15px; }


/* input 눌렀을때 이벤트 */
/* 폰트사이즈 줄이고, 해당 폰트는 해당 영억의 0,0으로 이동*/
input:focus + label, label{ color:#8aa1a1; font-size:10pt; pointer-events: none; position: absolute; left:0px; top:0px;
 						transition: all 0.2s ease ;-webkit-transition: all 0.2s ease; -moz-transition: all 0.2s ease; -o-transition: all 0.2s ease; }


/* placeholder-shown 이 사라지고 focus 되었을때 outline과 border-bottom의 색깔변경*/
input:focus, input:not(:placeholder-shown){ border-bottom: solid 1px #8aa1a1; outline:none; }
	* {margin:0; padding:0;}
	
	@media all and (min-width:300px) {
		
	
	div {font-size: 0;}
</style>
</head>
<body>
<div align="center"></div>
	<h1> Main page </h1>
	<div id="mq1">
		<img src="./picture/mainImg.jpg" width=200>
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
	<input type="submit" value="로그인">
	</form>
	<form action="./join/join.jsp" method="get">
	<input type="submit" value="회원가입">
	</form>
	
	
	
</body>
</html>
