<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.text.*" %>  
<%@page import="com.plantshop.item.*"%>
<%@page import="com.plantshop.saleorder.*"%>
<%@page import="com.plantshop.product.*"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록 보기</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/order_main.css" rel="stylesheet">
<link href="./css/order_list.css" rel="stylesheet">
</head>
<body>
<%
request.setCharacterEncoding("utf-8"); 

if(session.getAttribute("login_id") == null) {
	out.print("<script>alert('로그인을 후 주문목록을 사용해주세요!!'); history.back();</script>");
	return;
}
%>

<div id="container">
	<%@ include file="../module/top.jsp" %>
    <section>
	<article id="content">
	<%
	String condition = "";
	
	int productCount = 0; // 주문 품목 수
	int price = 0; // 판매가
	int qty = 0; // 주문 품목의 수량
	int buyId = 0; // 주문 번호
	
	NumberFormat nf = NumberFormat.getInstance();
	String total_nf = "";
	
	SaleOrderDBBean dbPro = SaleOrderDBBean.getInstance();
	ItemDBBean dbPro2 = ItemDBBean.getInstance();
	ProductDBBean dbPro3 = ProductDBBean.getInstance();
	
	List<SaleOrderDataBean> saleOrderList = dbPro.getAllSaleorderList();
	
	out.print("<h2>전체 주문 내역서</h2>");
	%>
	<div id="btn"><input type="button" value="관리자 메인" onclick="location='../product/product_list.jsp'"></div>
	<%
	out.print("<table class='order_table'><tr>");
	out.print("</table>");
	if(saleOrderList.isEmpty()) {
		out.print("<hr><div class='none'>주문 내역이 없습니다.</div><hr>");
	} else {
		for(SaleOrderDataBean saleOrder : saleOrderList) {
			buyId = saleOrder.getId();
			total_nf = nf.format(saleOrder.getTotal()); // 전체 주문 가격
			productCount = saleOrder.getProductcount(); // 품목 수
			%>
			<table id="info_table">
			<tr><th width="20%">주문 번호</th><td width="80%"><%= buyId  %></td></tr>
			<tr><th>주문 날짜</th><td><%= saleOrder.getOrderdate()  %></td></tr>
			<tr><th>고객 이름</th><td><%= saleOrder.getName()  %></td></tr>
			<tr><th>결제 유형</th><td><%= saleOrder.getPay() %> : <%= saleOrder.getCardno()  %></td></tr>
			<tr><th>배달 주소</th><td><%= saleOrder.getAddress() %></td></tr>
			<tr><th>전화 번호</th><td><%= saleOrder.getTel() %></td></tr>
			</table>
			
			<%
			List<ItemDataBean> itemList = dbPro2.getItemList(buyId);
			if(!itemList.isEmpty()) {
			%>
				<table>
				<tr>
					<th>No</th>
					<th colspan="2">상품정보</th>
					<th>상품번호</th>
					<th>수량</th>
					<th>판매가</th>
					<th>판매가격*수량</th>
				</tr>
				<% for(ItemDataBean item : itemList) {
					qty = item.getQuantity();
					price = item.getPrice();
					ProductDataBean product = dbPro3.getProduct(item.getProductid()); %>
					
					<tr>
					<td width="7%" class="center"><%= item.getItemno()%></td>
					<td width="7%" class="center border_right">
						<a href="../product/product_detail.jsp?id=<%=item.getProductid() %>">
						<img src="/plantshop/<%=product.getSmall_img() %>" width="80px" height="110px"></a>
					</td>
					<td width="31%" class="center border_left">
						<a href="../product/product_detail.jsp?id=<%=item.getProductid() %>">
						<%=item.getPname() %></a>
					</td>
					<td width="15%" class="center"><%=item.getProductid() %></td>
					<td width="7%" class="center"><%=qty %></td>
					<td width="20%" class="center"><%=nf.format(price) %> 원</td>
					<td width="20%" class="center"><%=nf.format(qty*price) %> 원</td>
					</tr>
				<% } %>							
				</table>
				<div class="total">주문상품 : <%=productCount %> 개 품목 / 총금액 : <%=total_nf  %> 원</div>
				<%
			}
		}
	}
	%>
	</article>
	</section>
	<%@ include file="../module/bottom.jsp" %>
</div>
</body>
</html>