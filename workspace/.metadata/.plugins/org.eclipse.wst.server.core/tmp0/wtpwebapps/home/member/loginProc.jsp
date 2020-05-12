<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.plantshop.user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String userid = request.getParameter("userid");
String password = request.getParameter("password");

UserDBBean dbPro = UserDBBean.getInstance();

int check = dbPro.userCheck(userid, password); // 아이디와 비밀번호 체크

if (check == 1) { // 로그인 성공시
	UserDataBean user = dbPro.getUserInfo(userid); // 해당하는 id가 있으면 해당 정보를 불러옴
	String username = user.getUsername();
	
	session.setAttribute("login_id", userid); // 세션을 생성하여 정보 저장
	session.setAttribute("login_name", username);
	response.sendRedirect("../index.jsp");
} else if(check == 0) { // 로그인 실패
	out.print("<script>alert('비밀번호를 다시 확인해주세요.'); history.go(-1);</script>");
} else {
	out.print("<script>alert('아이디를 다시 확인해주세요.'); history.go(-1);</script>");
}
%>
</body>
</html>