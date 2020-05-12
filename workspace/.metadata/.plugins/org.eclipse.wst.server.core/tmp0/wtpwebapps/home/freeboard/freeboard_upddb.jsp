<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.plantshop.freeboard.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용 수정 처리</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8"); 

if(session.getAttribute("login_id") == null) {
	out.print("<script>alert('로그인을 후 Q&A 사용해주세요!!'); history.back();</script>");
	return;
}
%>
<jsp:useBean id="article" class="com.plantshop.freeboard.FreeBoardDataBean"/>
<jsp:setProperty property="*" name="article"/>
<%

String pageNum = request.getParameter("pageNum");

FreeBoardDBBean dbPro = FreeBoardDBBean.getInstance();

int check = -1;

//해당 하는 글이 존재 하는지 확인
if(dbPro.getFreeBoardCheck(article)) { // 해당 글이 존재 할 때 
	
	check = dbPro.updateFreeBoard(article); // 해당 글이 존재하면 수정
	if(check > 0) { // 비밀번호가 맞을 때
		out.println("<script>alert('정상적으로 수정되었습니다.'); location='freeboard_list.jsp?pageNum=" + pageNum +  "'</script>");
	} else { // 비밀번호가 틀렸을 때
		out.println("<script>alert('비밀번호를 다시 확인해주세요.'); history.back();</script>");	
	}
} else { // 해당 글이 존재 하지 않을 때
	out.println("<script>alert('수정할 글이 없습니다. 다시 시도해 주세요'); history.back();</script>");
}
%>
</body>
</html>