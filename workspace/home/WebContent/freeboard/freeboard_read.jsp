<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.* " %>
<%@page import="com.plantshop.freeboard.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>언제나 함께 썬플라워</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/freeboard_main.css" rel="stylesheet">
<link href="./css/freeboard_read.css" rel="stylesheet">
</head>
<body>
<div id="container">        
	<%@ include file="../module/top.jsp" %>
    <section>
    	<div id="content">
			<%
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			int id = Integer.parseInt(request.getParameter("id"));
			
			FreeBoardDBBean dbPro = FreeBoardDBBean.getInstance();
			FreeBoardDataBean freeBoard = dbPro.getFreeBoard(id);
		
			if(freeBoard == null) {
				out.println("<script>alert('해당하는 내용이 없습니다.'); >history.back();</script>");
				return;
			}
			%>
			<h2>글 내용 보기</h2>
			<table>
				<tr>
					<th width="15%">글번호</th>
					<td width="35%"><%=freeBoard.getId() %></td>
					<th width="15%">조회수</th>
					<td width="35%"><%=freeBoard.getReadcount() %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><%=freeBoard.getSubject() %>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td><%=freeBoard.getName() %></td>
					<th>작성일</th>
					<td><%=freeBoard.getInputdate() %></td>
				</tr>
				<tr>
					<td colspan="4"><pre><%=freeBoard.getContent() %></pre></td>
				</tr>
				<tr  class="end_row">
					<td colspan="4">
						<a href='freeboard_list.jsp?pageNum=<%=pageNum %>'><img src="./image/list.jpg" width="60" height="25"></a>&nbsp;&nbsp;
						<a href='freeboard_rwrite.jsp?id=<%=id %>&pageNum=<%=pageNum %>'><img src="./image/reply.jpg" width="60" height="25"></a>&nbsp;&nbsp;
						<a href='freeboard_upd.jsp?id=<%=id %>&pageNum=<%=pageNum %>'><img src="./image/edit.jpg" width="60" height="25"></a>&nbsp;&nbsp;
						<a href='freeboard_del.jsp?id=<%=id %>&pageNum=1'><img src="./image/del.jpg" width="60" height="25"></a>
					</td>
				</tr>
			</table>
		</div>
	</section>
	<jsp:include page="../module/bottom.jsp" />
</div>
</body>
</html>