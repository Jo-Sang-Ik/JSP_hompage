<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="com.plantshop.freeboard.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>언제나 함께 썬플라워</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/freeboard_main.css" rel="stylesheet">
<link href="./css/freeboard_upd.css" rel="stylesheet">

<script src="./js/freeboard_upd.js"></script>
</head>
<body>
<div id="container">        
	<%@ include file="../module/top.jsp" %>
    <section>
    	<div id="content_main">
<% 
request.setCharacterEncoding("utf-8"); 

if(session.getAttribute("login_id") == null) {
	out.print("<script>alert('로그인을 후 Q&A 사용해주세요!!'); history.back();</script>");
	return;
}

int id = Integer.parseInt(request.getParameter("id"));
int pageNum = Integer.parseInt(request.getParameter("pageNum"));

FreeBoardDBBean dbPro = FreeBoardDBBean.getInstance();
FreeBoardDataBean freeBoard = dbPro.getFreeBoard(id);

if(freeBoard == null) {
	out.println("<script>alert('해당하는 페이지가 없습니다.'); history.back();</script>");
	return;
}
%>
	<h2>글 내용 수정하기</h2>
	<form name="msgwrite" action="freeboard_upddb.jsp" method="post">
		<input type="hidden" name="id" value="<%=id %>">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		<table>
			<tr>
				<th><label for="name">이름</label></th>
				<td><input type="text" id="name" name="name" value="<%=freeBoard.getName() %>"></td>
			</tr>
			<tr>
				<th><label for="email">E-MAIL</label></th>
				<td><input type="text" id="email" name="email" value="<%=freeBoard.getEmail() %>"></td>
			</tr>
			<tr>
				<th><label for="subject">제목</label></th>
				<td><input type="text" id="subject" name="subject" size="50" maxlength="50" value="<%=freeBoard.getSubject() %>"></td>
			</tr>
			<tr>
				<th><label for="content">내용</label></th>
				<td><textarea id="content" name="content" rows="18" cols="90" maxlength="2000" style="resize: none" required><%=freeBoard.getContent() %></textarea></td>
			</tr>
			<tr>
				<th><label for="password">암호</label></th>
				<td><input type="password" id="password" name="password">&nbsp;
					<font color="red"><small>비밀번호를 입력해야 수정이 됩니다.</small></font>
				</td>
			</tr>
			<tr class="end_row">
				<td class="first"> <!-- 목록으로 가기 -->
					<a href="freeboard_list.jsp?pageNum=<%=pageNum %>"><img src="image/list.jpg" width="60" height="25"></a>
				</td>
				<td class="second"> <!-- 수정하기, 취소 -->
					<a href="#" onclick="check();"><img src="image/ok.gif" width="60" height="25"></a>
					<a href="#" onclick="history.back();"><img src="image/cancel.gif" width="60" height="25"></a>
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