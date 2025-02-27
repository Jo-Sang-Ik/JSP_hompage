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
	<div class="move_page">
   		<a href="../member/select.jsp">개인정보 조회</a>
   		<a href="../cart/cart_list.jsp">나의 장바구니</a>
   		<a id="current_page" href="./order_list.jsp?uid=<%=login_id %>">나의 주문 목록</a>
   	</div>
	<%
	String condition = "";
	
	int productCount = 0; // 주문 품목 수
	int price = 0; // 판매가
	int qty = 0; // 주문 품목의 수량
	int buyId = 0; // 주문 번호
	
	NumberFormat nf = NumberFormat.getInstance();
	String total_nf = "";
	
	String uid = request.getParameter("uid");
	
	if(request.getParameter("buyId") != null) { // 주문 1개를 확인할 때
		buyId = Integer.parseInt(request.getParameter("buyId"));
		condition = " where id="+buyId+" and uid='"+uid+"'";
	} else { // 모든 주문을 확인할 때
		condition = " where uid='"+uid+"' order by id desc"; // 최근 주문한 순서 먼저(내림차순)
	}
	
	SaleOrderDBBean dbPro = SaleOrderDBBean.getInstance();
	ItemDBBean dbPro2 = ItemDBBean.getInstance();
	ProductDBBean dbPro3 = ProductDBBean.getInstance();
	
	List<SaleOrderDataBean> saleOrderList = dbPro.getSaleorderList(condition);
	
	out.print("<h2>"+ login_name +"님의 주문 내역서</h2>");
	out.print("<table class='order_table'><tr>");
	out.print("<td class='left'><a class='move' href='order_list.jsp?uid="+uid+"'>전체 주문서 보기</a></div></td>");
	out.print("<td class='right'><a class='move' href='../shop_list.jsp'>쇼핑목록</a></div></td></tr>");
	out.print("</table>");
	if(saleOrderList.isEmpty()) {
		out.print("<hr><div class='none'>주문 내역이 없습니다.</div><hr>");
	} else {
		for(SaleOrderDataBean saleOrder : saleOrderList) {
			buyId = saleOrder.getId();
			total_nf = nf.format(saleOrder.getTotal()); // 전체 주문 가격
			productCount = saleOrder.getProductcount(); // 품목 수
			%>
			<div class="order"><a class="move" href="order_list.jsp?buyId=<%=buyId %>&uid=<%=uid %>">현재 주문서만 보기</a></div>
			
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