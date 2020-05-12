<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>언제나 함께 썬플라워</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/freeboard_main.css" rel="stylesheet">
<link href="./css/freeboard_del.css" rel="stylesheet">

<script src="./js/freeboard_del.js"></script>
</head>
<body>
<%
if(session.getAttribute("login_id") == null) {
	out.print("<script>alert('로그인을 후 Q&A 사용해주세요!!'); history.back();</script>");
	return;
}
%>
<div id="container">        
	<%@ include file="../module/top.jsp" %>
	<section>
	<div id="content">
		<h2>글 내용 삭제 하기</h2>
		<form name="msgdel" action="freeboard_deldb.jsp" method="post">
			<input type="hidden" name="id" value='<%=request.getParameter("id") %>'>
			<input type="hidden" name="pageNum" value='<%=request.getParameter("pageNum") %>'>
			<table>
				<tr>
					<th width="30%"><label for="">비밀번호</label></th>
					<td width="70%"><input type="password" name="password" id="password" autofocus></td>
				</tr>
				<tr class="end_row">
					<td colspan="2">
						<a href='freeboard_list.jsp?pageNum=<%=request.getParameter("pageNum") %>'><img src="image/list.jpg" width="60" height="25"></a>&nbsp;&nbsp;
						<a href='#' onclick="check();"><img src="image/del.jpg" width="60" height="25"></a>
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