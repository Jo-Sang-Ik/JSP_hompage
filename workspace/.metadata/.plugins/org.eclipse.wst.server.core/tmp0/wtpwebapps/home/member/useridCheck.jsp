<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="com.plantshop.user.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 아이디 체크</title>
<link href="css/useridCheck.css" rel="stylesheet">
<script src="js/useridCheck.js"></script>
</head>
<body>
<%
String userid = (String)request.getParameter("userid");

UserDBBean dbPro = UserDBBean.getInstance();
int check = dbPro.useridCheck(userid);
%>
<div id="container">
<h3>중복확인 체크</h3>
<form name="id_check" action="useridCheck.jsp" method="post">
	<input type="hidden" name="check_count"  value="<%=check %>">
	<table>
		<tr>
			<td>원하는 아이디를 입력하세요</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="userid" value="<%=userid %>" maxlength="16" size="16" autofocus>&nbsp;
				<input type="submit" class="btns" value="중복확인" onclick="doCheck()">
			</td>
		</tr>
		<tr>
			<td>
				<%
				if(check > 0) {
					out.println(userid + "는 등록되어있는 아이디 입니다.<br>다시 입력해 주세요");
				} else {
					out.println(userid + "는 사용할 수 있는 아이디입니다.");
				}
				%>
			</td>
		</tr>
		<tr>
			<td><input type="button" class="btns" value="확인" onclick="checkEnd()"></td>
		</tr>
	</table>
	
</form>
</div>
</body>
</html>