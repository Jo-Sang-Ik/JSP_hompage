<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.*, java.util.*" %>
<%@ page import="com.plantshop.user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>언제나 함께 썬플라워</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/member_main.css" rel="stylesheet">
<link href="./css/joinProc.css" rel="stylesheet">

<script src="./js/joinProc.js"></script>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8"); 

String zipcode1 = request.getParameter("zipcode1");
String zipcode2 = request.getParameter("zipcode2");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");

String zipcode = zipcode1 + "-" + zipcode2;
String phone = phone1 + "-" + phone2 + "-" + phone3;

java.util.Date yymmdd = new java.util.Date();
SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm a");
String regDate = myFormat.format(yymmdd);
%>
<jsp:useBean id="article" class="com.plantshop.user.UserDataBean"/>
<jsp:setProperty property="*" name="article"/>
<jsp:setProperty property="zipcode" name="article" value="<%=zipcode %>" />
<jsp:setProperty property="phone" name="article" value="<%=phone %>" />
<jsp:setProperty property="regdate" name="article" value="<%=regDate %>" />
<%
// System.out.println(article); - 값 확인

UserDBBean dbPro = UserDBBean.getInstance();
int check = dbPro.joinProc(article);

if(check < 0) { // 가입에 성공하지 못했다면 돌아간다.
	out.print("<script>alert('회원가입에 실패하였습니다. 다시한번 시도해주세요.'); history.back();</script>");
	return;
}
%>
<div id="container">        
	<%@ include file="../module/top.jsp" %>
    <section>
    	<div id="content_main"> <!-- 회원가입 폼 -->
			<h3>회원가입 확인</h3>
			<form action="./modify.jsp" method="post" name="join">
				<input type="hidden" name="mode" value="modify">
				<input type="hidden" name="userid" value="<%=article.getUserid() %>">
				<table>
					<tr class="first_row">
						<td colspan="2">회원가입을 축하드립니다. 입력하신 내용을 확인하세요.</td>
					</tr>
					<tr>
						<th width="15%">아이디</th>
						<td width="85%"><%=article.getUserid() %></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><%=article.getUsername() %></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><%=article.getPassword() %></td>
					</tr>
					<tr>
						<th>EMAIL</th>
						<td><%=article.getEmail() %></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td><%=article.getZipcode() %></td>
					</tr>
					<tr>
						<th>주소1</th>
						<td><%=article.getAddress1() %></td>
					</tr>
					<tr>
						<th>주소2</th>
						<td><%=article.getAddress2() %></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><%=article.getPhone() %></td>
					</tr>
					<tr class="end_row">
						<td colspan="2">
							<input type="button" class="btns" value="확인" onclick="location.href='../index.jsp'">
							<input type="button" class="btns" value="수정" onclick="doSubmit()">
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