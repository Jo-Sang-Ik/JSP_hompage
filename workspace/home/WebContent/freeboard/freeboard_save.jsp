<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.text.*" %>
<%@page import="com.plantshop.freeboard.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 처리</title>
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
int check = -1;

FreeBoardDBBean dbPro = FreeBoardDBBean.getInstance();
check = dbPro.writeFreeBoard(article);

if(check > 0) out.print("<script> alert('글을 성공적으로 등록했습니다.'); location='./freeboard_list.jsp'</script>");
else out.print("<script> alert('글 등록에 실패했습니다. 다시시도해주세요.'); history.back();</script>");
%>
</body>
</html>