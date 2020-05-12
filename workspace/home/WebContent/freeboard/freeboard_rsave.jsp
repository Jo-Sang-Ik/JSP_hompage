<%@page import="com.plantshop.freeboard.FreeBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 새글쓰기 처리</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");

if(session.getAttribute("login_id") == null) {
	out.print("<script>alert('로그인을 후 Q&A 사용해주세요!!'); history.back();</script>");
	return;
}

java.util.Date yymmdd =  new java.util.Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
String ymd = sdf.format(yymmdd);
%>
<jsp:useBean id="article" class="com.plantshop.freeboard.FreeBoardDataBean" />
<jsp:setProperty property="*" name="article"/>
<jsp:setProperty property="inputdate" value="<%=ymd %>" name="article" />
<%
String pageNum = request.getParameter("pageNum");

FreeBoardDBBean dbPro = FreeBoardDBBean.getInstance();
int check = dbPro.replyWriteFreeBoard(article);


if(check > 0) out.print("<script> alert('글이 성공적으로 등록되었습니다.'); location='freeboard_list.jsp?pageNum="+ pageNum +"';</script>");
else out.print("<script> alert('글을 등록하지 못했습니다. 다시 시도해주세요.'); history.back();</script>");
%>
</body>
</html>