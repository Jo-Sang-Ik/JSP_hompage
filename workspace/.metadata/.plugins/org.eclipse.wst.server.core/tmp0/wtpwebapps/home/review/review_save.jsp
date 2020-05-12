<%@page import="com.plantshop.review.ReviewDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기 저장 처리</title>
<style>
	#container { width: 300px; margin: 50px auto; border: 2px solid black; padding: 20px; text-align: center;}
	a { text-decoration: none; color: blue;}
	a:hover { text-decoration: underline; } 
</style>
</head>
<body>
<div id="container">
<% 
request.setCharacterEncoding("utf-8");

java.util.Date date = new java.util.Date();
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
String inputdate = df.format(date);
%>
<jsp:useBean id="article" class="com.plantshop.review.ReviewDataBean" />
<jsp:setProperty property="*" name="article"/>
<jsp:setProperty property="inputdate" value="<%=inputdate %>" name="article"/>
<%

ReviewDBBean dbPro = ReviewDBBean.getInstance();
int check = dbPro.insertReview(article);

if(check > 0 ) out.print("<p>데이터가 성공적으로 입력되었습니다.</p>");
else out.print("<p>데이터가 입력되지 않았습니다.</p>");
%>
<script>location.href="review_show.jsp?pid=<%= article.getPid()%>"</script>
</div>
</body>
</html>