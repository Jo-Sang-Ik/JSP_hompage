<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@page import="com.plantshop.user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호검색</title>
<link href="css/zipcodeSearch.css" rel="stylesheet">
<script src="js/zipcodeSearch.js"></script>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");

String searchAddr = request.getParameter("addr");
%>
<div id="container">
<h3>우편번호 검색</h3>
<form name="zipcode" action="zipcodeSearch.jsp" method="post">
	<table>
		<tr class="first_row">
			<th colspan="2">주소의 동/읍/면 이름을 입력하세요.<br>검색한 후 주소를 클릭하세요.</th>
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" name="addr" maxlength="15" size="15">&nbsp;
				<input type="submit" class="btns" value="검색">
			</td>
		</tr>
		<%
		if(searchAddr == null || searchAddr.equals("")) {
			out.println("<tr><td colspan='2'>주소를 검색해 주세요.</td></tr>");
		} else {
			out.println("<tr><td width='20%'>우편번호</td><td width='80%'>주소</td></tr>");
			
			ZipcodeDBBean dbPro = ZipcodeDBBean.getInstance();
			List<ZipcodeDataBean> zipcodeList = dbPro.getZipcodeList(searchAddr);
			
			System.out.println("zipcodeList : " + zipcodeList);
			for(ZipcodeDataBean zipcode : zipcodeList) {
				String sido = zipcode.getSido();
				String gugun = zipcode.getGugun();
				String dong = zipcode.getDong();
				String bunji = zipcode.getBunji(); 
				
				String address = sido + " " + gugun +  " " + dong + " " + bunji;
				String address1 = sido + " " + gugun +  " " + dong;
			
		%>
		<tr>
			<td>
				<a href="javascript:choiceZipcode('<%=zipcode.getZipcode()%>', '<%=address1%>')"><%=zipcode.getZipcode()%></a>	
			</td>
			<td>
				<a href="javascript:choiceZipcode('<%=zipcode.getZipcode()%>', '<%=address1%>')"><%=address%></a>
			</td>
		</tr>
		<% }
		} %>
	</table>
</form>
</div>
</body>
</html>