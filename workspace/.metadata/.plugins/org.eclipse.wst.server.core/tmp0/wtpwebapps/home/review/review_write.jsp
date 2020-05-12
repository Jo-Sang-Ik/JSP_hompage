<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기 입력 폼</title>
<link rel="stylesheet" href="css/review_write.css">
<script src="js/review_write.js"></script>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8"); 

String login_id = (String)session.getAttribute("login_id");

if(session.getAttribute("login_id") == null) {
	out.print("<script>alert('로그인 후 리뷰 글을 남겨주세요.'); history.back();</script>");
	return;
}

//상세페이지에서 넘어오는 상품아이디 저장
int pid = Integer.parseInt(request.getParameter("pid")); 

%>
<div id="container">
	<h2>상품후기 남기기</h2>
	<form name="reviewwrite" action="review_save.jsp" method="post">
		<input type="hidden" name="pid" value="<%=pid %>">
		<table>
			<tr>
				<th colspan="2">글쓰기</th>
			</tr>
			<tr>
				<th width="15%"><label for="name">이름</label></th>
				<td width="85%"><input type="text" name="name" id="name" value="<%=login_id %>" autofocus required></td>
			</tr>
			<tr>
				<th><label for="subject">제목</label></th>
				<td><input type="text" name="subject" id="subject" size="60" maxlength="60" required></td>
			</tr>
			<tr class="content_row">
				<th><label for="content">내용</label></th>
				<td><textarea name="content" id="content" maxlength="2000" cols="66" rows=18 required ></textarea></td>
			</tr>
			<tr class="end_row">
				<td colspan="2">
					<a href="#" onclick="check()"><img src="image/ok.gif" width="60" height="25"></a>&nbsp;&nbsp;
					<a href="review_show.jsp?pid=<%=pid %>"><img src="image/cancel.gif" width="60" height="25"></a>									
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>