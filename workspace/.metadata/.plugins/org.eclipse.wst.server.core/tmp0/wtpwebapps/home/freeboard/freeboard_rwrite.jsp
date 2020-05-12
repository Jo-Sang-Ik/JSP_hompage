<%@page import="com.plantshop.freeboard.FreeBoardDataBean"%>
<%@page import="com.plantshop.freeboard.FreeBoardDBBean"%>
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
<link href="css/freeboard_write.css" rel="stylesheet">
 
<script src="./js/freeboard_rwrite.js"></script>
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
	
	FreeBoardDBBean dbPro = FreeBoardDBBean.getInstance();
	
	int id = Integer.parseInt(request.getParameter("id"));
	String pageNum = request.getParameter("pageNum");
	
	FreeBoardDataBean freeBoard = dbPro.getFreeBoard(id);
	
	if(freeBoard == null) {
		out.println("<script> alert('해당하는 글이 없습니다. 다시한번 확인해주세요'); history.back();</script>");
		return;
	} 
	%>
		<h2>글 답변하기</h2>
		<form name="msgrewrite"  method="post" action="freeboard_rsave.jsp" >
			<input type="hidden" name="id" value="<%=id %>">
			<input type="hidden" name="pageNum" value="<%=pageNum %>">
			<input type="hidden" name="masterid" value="<%=freeBoard.getMasterid() %>">
			<input type="hidden" name="replynum" value="<%=freeBoard.getReplynum() %>">
			<input type="hidden" name="step" value="<%=freeBoard.getStep() %>">
			<table>
				<tr>
					<th width="15%"><label for="name">이름</label></th>
					<td width="*"><input type="text" name="name" id="name" autofocus required></td>
				</tr>
				<tr>
					<th><label for="email">E-MAIL</label></th>
					<td><input type="text" name="email" id="email" required></td>
				</tr>
				<tr>
					<th><label for="subject">제목</label></th>
					<td><input type="text" name="subject" id="subject" value="RE: <%=freeBoard.getSubject() %>" size="50" maxlength="50" required></td>
				</tr>
				<tr>
					<th><label for="name">내용</label></th>
					<td>
						<textarea name="content" id="content"  rows="18" cols="90" maxlength="2000" style="resize: none" required><%=freeBoard.getContent() + "\n" %>------------------------------<%="\n" %></textarea>
					</td>
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
						<a href="freeboard_list.jsp?pageNum=<%=pageNum %>"><img src="image/list.jpg" width="60" height="25"></a>
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