<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*, java.util.*, java.text.*" %>
<%@page import="com.plantshop.saleorder.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 처리</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); 

String login_id = (String)session.getAttribute("login_id");

if(session.getAttribute("login_id") == null) {
	out.print("<script>alert('로그인을 후 주문하기를 사용해주세요!!'); history.back();</script>");
	return;
}

// 카드결제와 현금 입금 구분
String cardno = "";
if(request.getParameter("pay").equals("card")) {
	cardno = request.getParameter("cardno");
}

//주문 날자 포맷
java.util.Date yymmdd = new java.util.Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
String ymd = sdf.format(yymmdd);
%>
<jsp:useBean id="saleorderAriticle" class="com.plantshop.saleorder.SaleOrderDataBean" />
<jsp:setProperty property="*" name="saleorderAriticle"/>
<jsp:setProperty property="orderdate" value="<%=ymd %>" name="saleorderAriticle"/>
<jsp:setProperty property="cardno" value="<%=cardno %>" name="saleorderAriticle"/>
<%
//***************
System.out.println(saleorderAriticle);

if(saleorderAriticle.getTotal() == 0) {
	out.print("<script>alert('주문상품을 1개 이상 선택해주세요.'); history.back();</script>");
	return;
}

// cart테이블의 pid -> product테이블의 id - 상품을 찾기 위해
int pid = Integer.parseInt(request.getParameter("pid"));

String mode= (request.getParameter("mode").equals("direct"))? "direct" : "cart";

int saleId = -1;
SaleOrderDBBean dbPro = SaleOrderDBBean.getInstance();
if(mode.equals("direct")) {
	int qty = Integer.parseInt(request.getParameter("qty"));
	saleId = dbPro.insertSaleorderDirect(saleorderAriticle, pid, qty);
} else {
	saleId = dbPro.insertSaleorderCart(saleorderAriticle, pid);
}

if(saleId > 0){
	out.print("<script> alert('주문이 정상적으로 처리되었습니다.');");
	out.print("location='order_list.jsp?buyId="+saleId+"&uid="+saleorderAriticle.getUid()+"'</script>");
} else {
	out.print("<script> alert('주문을 처리하지 못하였습니다.');");
	out.print("location='../shop_list.jsp'</script>");
}
%> 
</body>
</html>