<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>언제나 함께 썬플라워</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/freeboard_main.css" rel="stylesheet">
<link href="./css/freeboard_write.css" rel="stylesheet">

<script src="./js/freeboard_write.js"></script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8"); 

if(session.getAttribute("login_id") == null) {
	out.print("<script>alert('로그인을 후 Q&A 사용해주세요!!'); history.back();</script>");
	return;
}
%>
<%@ include file="../module/top.jsp" %>
<div id="container">        
    <section>
    	<div id="content_main">
			<h2>게시판 글쓰기</h2>
			<form name="msgwrite"  method="post" action="freeboard_save.jsp" >
				<table>
					<tr>
						<th><label for="name">이름</label></th>
						<td><input type="text" name="name" id="name" autofocus required></td>
					</tr>
					<tr>
						<th><label for="email">E-MAIL</label></th>
						<td><input type="text" name="email" id="email" required></td>
					</tr>
					<tr>
						<th><label for="subject">제목</label></th>
						<td><input type="text" name="subject" id="subject" size="50" maxlength="50" required></td>
					</tr>
					<tr>
						<th><label for="content">내용</label></th>
						<td><textarea name="content" id="content" rows="18" cols="90" maxlength="2000" style="resize: none" required ></textarea></td>
					</tr>
					<tr>
						<th><label for="password">비밀번호</label></th>
						<td>
							<input type="password" name="password" id="password" required>&nbsp;
							<font color="red"><small>비밀번호를 입력하면 수정 또는 삭제가 가능합니다.</small></font>
						</td>
					</tr>
					<tr class="end_row">
						<td colspan="2">
							<a href="#" onclick="check()"><img src="image/ok.gif" width="60" height="25"></a>
							<a href="#" onclick="history.back()"><img src="image/cancel.gif" width="60" height="25"></a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<%@ include file="../module/bottom.jsp" %>
</div>
</body>
</html>