<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.plantshop.user.*" %>    
<%@ page import="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>언제나 함께 썬플라워</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/member_main.css" rel="stylesheet">
<link href="./css/selectAll.css" rel="stylesheet">
</head>
<body>
<div id="container">
	<%@ include file="../module/top.jsp" %>        
    <section>
    	<div id="content">
			<div id="selectAll">
				<h3>전체 회원 정보 확인</h3>
				<div id="btn"><input type="button" value="관리자 메인" onclick="location='../product/product_list.jsp'"></div>
				<table>
					<tr>
						<th width="10%">아이디</th>
						<th width="10%">이 름</th>
						<th>주 소</th>
						<th width="20%">EMAIL</th>
						<th width="20%">전화번호</th>
					</tr>
					<% 
					List<UserDataBean> userList = new ArrayList<UserDataBean>();
					
					UserDBBean dbPro = UserDBBean.getInstance();
					userList = dbPro.getUserList();
					
					if(userList.isEmpty()) { // 회원정보가 없을 때
					%> 
					<tr>
						<td colspan="5">등록된 회원이 없습니다.</td>
					</tr>
					<% } else {
					for(UserDataBean user : userList){ %>
					<tr>
						<td><%=user.getUserid() %></td>
						<td><%=user.getUsername() %></td>
						<td>
							<%=user.getAddress1() %>
							<%=user.getAddress2() %>
						</td>
						<td><%=user.getEmail() %></td>
						<td><%=user.getPhone() %></td>
					</tr>
					<%}
					}%>
				</table>
			</div>
		</div>
	</section>
<%@ include file="../module/bottom.jsp" %>
</div>
</body>
</html>