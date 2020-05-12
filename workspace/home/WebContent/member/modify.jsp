<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.*, java.util.*" %>
<%@page import="com.plantshop.user.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>언제나 함께 썬플라워</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/member_main.css" rel="stylesheet">
<link href="./css/modify.css" rel="stylesheet">

<script src="./js/modify.js"></script>
</head>
<body>
<div id="container">        
	<%@ include file="../module/top.jsp" %>
    <section>
    	<div id="content">
<%
String zipcode1 = request.getParameter("zipcode1");
String zipcode2 = request.getParameter("zipcode2");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");

String zipcode = zipcode1 + "-" + zipcode2;
String phone = phone1 + "-" + phone2 + "-" + phone3;
%>
<jsp:useBean id="article" class="com.plantshop.user.UserDataBean"/>
<jsp:setProperty property="*" name="article"/>
<jsp:setProperty property="zipcode" name="article" value="<%=zipcode %>" />
<jsp:setProperty property="phone" name="article" value="<%=phone %>" />
<%
StringTokenizer st_zipcode = null;
StringTokenizer st_phone = null;

UserDBBean dbPro = UserDBBean.getInstance();
UserDataBean user = null;

String mode = request.getParameter("mode");

if(mode == null || mode.equals("modify")) {
	user = dbPro.getUserInfo(article.getUserid());
	if(user != null) {
		st_zipcode = new StringTokenizer(user.getZipcode(), "-");
		st_phone = new StringTokenizer(user.getPhone(), "-");
		
		if(st_zipcode.hasMoreTokens()) {
			zipcode1 = st_zipcode.nextToken();
		}
		
		if(st_zipcode.hasMoreTokens()) {
			zipcode2 = st_zipcode.nextToken();
		}
		
		if(st_phone.hasMoreTokens()) {
			phone1 = st_phone.nextToken();
		}
		
		if(st_phone.hasMoreTokens()) {
			phone2 = st_phone.nextToken();
		}
		
		if(st_phone.hasMoreTokens()) {
			phone3 = st_phone.nextToken();
		}
	}
} else if(mode.equals("update")) {
	int check = dbPro.userUpdate(article);
	if(check > 0) {
		out.print("<script>alert('회원정보 수정에 성공하였습니다.'); location='../index.jsp';</script>");
	} else {
		out.print("<script>alert('회원정보 수정에 실패하였습니다. 다시한번 시도해 주세요.'); location='../index.jsp';</script>");
	}
	return;
}
%>
		<form name="join" id="modifyform" action="./modify.jsp" method="post">
		<input type="hidden" name="mode" value="update">
			<h1>회원정보 수정</h1>
			<table>
				<tr id="first_row">
					<th width="15%">아이디<mark>*</mark></th>
					<td width="85%">
						<input type="text" name="userid" maxlength="16" size="20" value="<%=user.getUserid() %>" readonly>&nbsp;<font color="red"><small>아이디는 변경할 수 없습니다.</small></font>
					</td>
				</tr>
				<tr>
					<th>비밀번호<mark>*</mark></th>
					<td>
						<input type="text" name="password" maxlength="12" size="20" value="<%=user.getPassword() %>"  onkeyup="pwdCheck()"><small>&nbsp;(영문+숫자 4~12자리)</small>  
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인<mark>*</mark></th>
					<td>
						<input type="text" name="password2" maxlength="12" size="20" value="<%=user.getPassword()  %>" onkeyup="pwdCheck()" onclick="pwdCheck()"><span id="pwdCheckCircle"></span>
					</td>
				</tr>
				<tr>
					<th>이름<mark>*</mark></th>
					<td>
						<input type="text" name="username" maxlength="10" size="10" value="<%=user.getUsername() %>">
					</td>
				</tr>
				<tr>
					<th>EMAIL<mark>*</mark></th>
					<td>
						<input type="email" name="email" maxlength="50" size="20" value="<%=user.getEmail() %>">
					</td>
				</tr>
				<tr>
					<th>우편번호<mark>*</mark></th>
					<td>
						<input type="text" name="zipcode1" maxlength="3" size="3" value="<%=zipcode1 %>"> -
						<input type="text" name="zipcode2" maxlength="3" size="3" value="<%=zipcode2 %>">&nbsp;
						<input type="button" class="btns" value="우편번호 검색" onclick="MM_openBrWindow('zipcodeSearch.jsp', 'zipcodesearch', 'scrollbars=yes, width=600px, height=600px')">&nbsp;
						<small><font color="blue">우편번호 검색 버튼을 눌러주세요.</font></small>				
					</td>
				</tr>
				<tr>
					<th>주소<mark>*</mark></th>
					<td>
						<input type="text" name="address1" maxlength="100" size="50" value="<%=user.getAddress1() %>">&nbsp;
					</td>
				</tr>
				<tr>
					<th>나머지 주소<mark>*</mark></th>
					<td>
						<input type="text" name="address2" maxlength="100" size="50" value="<%=user.getAddress2() %>">
						<small><font color="red">나머지 주소를 입력하세요.</font></small>
					</td>
				</tr>
				<tr>
					<th class="phone_row">전화번호<mark>*</mark></th>
					<td class="phone_row">
						<input type="text" name="phone1" maxlength="3" size="3" value="<%=phone1 %>"> -
						<input type="text" name="phone2" maxlength="4" size="4" value="<%=phone2 %>"> - 
						<input type="text" name="phone3" maxlength="4" size="4" value="<%=phone3 %>">
					</td>
				</tr>
				<tr class="end_row">
					<th colspan="2">
						<input type="button" class="btns" value="수정" onclick="doSubmit()">&nbsp;
						<input type="button" class="btns" value="취소" onclick="location.href='../index.jsp'">
					</th>
				</tr>
			</table>
		</form>
	</div>
	</section>
	<%@ include file="../module/bottom.jsp" %>
</div>
</body>
</html>