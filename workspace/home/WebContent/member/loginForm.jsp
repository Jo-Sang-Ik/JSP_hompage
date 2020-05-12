<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>언제나 함께 썬플라워</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/member_main.css" rel="stylesheet">
<link href="./css/loginForm.css" rel="stylesheet">

<script src="./js/loginForm.js"></script>
</head>
<body>
<div id="container">        
	<%@ include file="../module/top.jsp" %>
    <section>
    	<div id="content">
			<div id="loginForm">
				<h2>로그인</h2>
				<hr>
				<form name="login" action="loginProc.jsp" method="post" > 
				<ul>
					<li>
						<div class="input_zip">
						<input type="text" name="userid" id="userid" placeholder="아이디" maxlength="16" size="20"><br>
						<input type="password" name="password" id="password" placeholder="비밀번호" maxlength="12" size="20">
						</div>
						<input type="button" id="loginbtn" class="btns" value="로그인" onclick="login_check()">
					</li>
					<li>
					</li>
					<li>
						<input type="button" class="searchbtn btns" value="아이디찾기" onclick="">
						<input type="button" class="searchbtn btns" value="비밀번호찾기" onclick="">
						<input type="button" class="searchbtn btns" id="joinbtn" value="회원가입" onclick="location.href='joinForm.jsp'">			
					</li>
				</ul>
				</form>
			</div>
		</div>
	</section>
	<%@ include file="../module/bottom.jsp" %>
</div>
</body>
</html>