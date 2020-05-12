<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.plantshop.user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>언제나 함께 썬플라워</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/member_main.css" rel="stylesheet">
<link href="./css/select.css" rel="stylesheet">
</head>
<body>
<%
request.setCharacterEncoding("utf-8"); 

if(session.getAttribute("login_id") == null) {
	out.print("<script>alert('로그인을 후 Q&A 사용해주세요!!'); history.back();</script>");
	return;
}
%>
<div id="container">
	<%@ include file="../module/top.jsp" %>
    <section>
    	<div id="content">
    	<div class='move_page'>
    		<a id="current_page" href="select.jsp">개인정보 조회</a>
    		<a href="../cart/cart_list.jsp">나의 장바구니</a>
    		<a href="../order/order_list.jsp?uid=<%=login_id %>">나의 주문 목록</a>
    	</div>
<%
	UserDBBean dbPro = UserDBBean.getInstance();
	UserDataBean user = dbPro.getUserInfo(login_id); // 로그인이 된 상태이기 때문에

	if(user == null) { // 실패
		out.print("<h2>해당하는 회원이 없습니다.</h2>");	
	} else { // 성공
%>
	<form id="selectform" name="selectForm" method="post">
		<h2><%=user.getUsername() %> 회원님의 가입정보.</h2>
		<input type="hidden" name="mode" value="modify">
		<table>
			<tr>
				<th width="25%">아이디</th>
				<td width="75%"><%=user.getUserid() %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=user.getUsername() %></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><%=user.getPassword() %></td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><%=user.getPassword()%></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><%=user.getZipcode() %></td>
			</tr>
			<tr>
				<th>주소1</th>
				<td><%=user.getAddress1() %></td>
			</tr>
			<tr>
				<th>주소2</th>
				<td><%=user.getAddress2() %></td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td><%=user.getPhone() %></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><%=user.getRegdate() %></td>
			</tr>
			<tr>
				<td colspan="2" class="end_row">
					<input type="button" class="btns" value="확인" onclick="location='../index.jsp'">
					<input type="button" class="btns" value="수정" onclick="location='modifySession.jsp?mode=modify'">
					<input type="button" class="btns" value="회원탈퇴" onclick="location='delete.jsp'">
				</td>
			</tr>
		</table>
	</form>
	<%} %>
	</div>
	</section>
	<%@ include file="../module/bottom.jsp" %>
</div>
</body>
</html>