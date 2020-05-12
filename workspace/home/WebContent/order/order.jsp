<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*, java.util.*" %>    
<%@ page import="com.plantshop.cart.*, com.plantshop.product.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 처리 폼</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/order_main.css" rel="stylesheet">
<link href="./css/order.css" rel="stylesheet">

<script src="./js/order.js"></script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

if(session.getAttribute("login_id") == null) {
	out.print("<script>alert('로그인 후 이용해주세요!!'); location='../member/loginForm.jsp';</script>");
	return;
}
%>
<div id="container">        
	<%@ include file="../module/top.jsp" %>
    <section>
		<article id="content">
	<%
	int total = Integer.parseInt(request.getParameter("total")); // 전체 상품의 가격
	if(total <= 0 ) {
		out.print("<script>alert('상품이 없습니다. 상품을 선택후 주문해주세요.'); history.back();</script>");
	}
	
	int productcount = Integer.parseInt(request.getParameter("productcount")); // 제품의 수
	
	String uid = login_id;
	
	// 상품id가 넘어오면 개별주문, null이면 전체주문
	int pid = 0;
	if(request.getParameter("pid") != null ) {
		pid = Integer.parseInt(request.getParameter("pid"));
	}
	
	// 바로 구매를 위한 변수
	String mode = "cart";
	int qty = 0;
	
	if(request.getParameter("mode") != null ) {
		mode = request.getParameter("mode");
		
	}
	
	if(request.getParameter("qty") != null) {
		qty = Integer.parseInt(request.getParameter("qty"));	
	}
	
	NumberFormat nf = NumberFormat.getInstance();
	String total_nf = nf.format(total);
	%>
	<table>
			<tr>
				<th width="5%">No</th>
				<th width="40%" colspan="2">상품정보</th>
				<th width="15%">제조사</th>
				<th width="10%">수량</th>
				<th width="15%">판매가</th>
				<th width="15%">소계</th>
			</tr>
	<%
	if(mode.equals("direct")) { // # 즉시구매 할 때
		ProductDBBean dbPro = ProductDBBean.getInstance();
		ProductDataBean product = dbPro.getProduct(pid);
		int sellPrice = 0;
		if(product.getDownprice() == 0) sellPrice = product.getPrice();
		else sellPrice = product.getDownprice();
	%>
			<tr>
				<td class="center">1</td>
				<td class="center border_right" width="10%"><img src="/plantshop/<%=product.getSmall_img() %>" width="80px" height="110px"></td>
				<td class="border_left" width="30%"><%=product.getPname() %></td>
				<td class="center"><%=product.getSname() %></td>
				<td class="center"><%=qty %></td>
				<td class="center"><%=nf.format(sellPrice)%></td>
				<td class="center"><%=nf.format(qty * sellPrice)%></td>
			</tr>
		
	<%} else { // # 장바구니에 담긴 상품을 주문할 때 
		CartDBBean dbPro = CartDBBean.getInstance();
		List<CartDataBean> cartList = dbPro.getCartList(uid, pid);
			for(int i=0; i<cartList.size(); i++) {
				CartDataBean cart = cartList.get(i);
	%>
			<tr>
				<td class="center"><%=i+1 %></td>
				<td class="center border_right"width="10%"><img src="/plantshop/<%=cart.getSmall() %>" width="80px" height="110px"></td>
				<td class="border_left" width="30%"><%=cart.getPname() %></td>
				<td class="center"><%=cart.getSname() %></td>
				<td class="center"><%=cart.getQuantity() %></td>
				<td class="center"><%=nf.format(cart.getPrice())%></td>
				<td class="center"><%=nf.format(cart.getPrice() * cart.getQuantity())%></td>
			</tr>
	<%		} 
		}%>
		
		</table>
		<form name="order_form" action="order_save.jsp" method="post">
		<input type="hidden" name="mode" value="<%=mode %>">
		<input type="hidden" name="qty" value="<%=qty %>">
		
		<input type="hidden" name="total" value="<%=total %>">
		<input type="hidden" name="productcount" value="<%=productcount %>">
		<input type="hidden" name="uid" value="<%=uid %>">
		<input type="hidden" name="pid" value="<%=pid %>">
		<h3>주문서 작성</h3>
		<table>
			<tr>
				<th width="20%">주문자 이름</th>
				<td width="80%"><input type="text" name="name" size="10" value=<%=login_name %>></td>
			</tr>
			<tr>
				<th>결제 방식</th>
				<td>
					<input type="radio" name="pay" value="card" onclick="payClick()" checked> 카드
					<input type="radio" name="pay" value="cash" onclick="payClick()"> 온라인 입금
				</td>
			</tr>
			<tr>
				<th>카드 번호</th>
				<td><input type="text" name="cardno" id="cardno"></td>
			</tr>
			<tr>
				<th>배송 주소</th>
				<td><input type="text" name="address" size="40"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel"></td>
			</tr>
			<tr>
				<th>주문 총 금액</th>
				<td><%=total_nf %>원</td>
			</tr>
			<tr class="end_row">
				<td colspan="2">
					<input type="button" value="주문하기" onclick="check()"> 
					<input type="reset" onclick="payClick(this.form)" value="다시쓰기">
				</td>
			</tr>
		</table>
		<div id="move"><a onclick="history.back();">◀  뒤로 가기 </a></div>
	</form>
	</article>
	</section>
    <%@ include file="../module/bottom.jsp" %>
</div>
</body>
</html>