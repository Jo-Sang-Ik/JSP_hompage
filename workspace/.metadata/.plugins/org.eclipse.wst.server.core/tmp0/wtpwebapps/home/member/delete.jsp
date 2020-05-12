<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.plantshop.user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 처리</title>
</head>
<body>
<%
String login_id = (String)session.getAttribute("login_id");

UserDBBean dbPro = UserDBBean.getInstance();
int check = dbPro.userDelete(login_id);

if(check > 0) {
	// 회원 탈퇴 하면서 로그아웃처리
	session.removeAttribute("login_id");
	out.println("<script>alert('회원탈퇴 처리가 정상적으로 이루어졌습니다.'); location='../index.jsp'</script>");
} else {
	out.println("<script>alert('회원탈퇴 처리를 실패했습니다. 다시 시도해주세요.'); location='../index.jsp'</script>");
}
%>

</body>
</html>