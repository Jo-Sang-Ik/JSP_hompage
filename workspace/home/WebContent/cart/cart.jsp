<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.*" %>  
<%@ page import="com.plantshop.cart.*, com.plantshop.product.*" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 처리(DB)</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8"); 

String login_id = (String)session.getAttribute("login_id");
session.setAttribute("login_id", login_id);

if(session.getAttribute("login_id") == null) {
	out.print("<script>alert('로그인을 해주세요!!'); history.back();</script>");
	return; // 더 이상 jsp문이 실행되지 않게.
}

int check = 0;

int pid = Integer.parseInt(request.getParameter("pid"));
int qty = Integer.parseInt(request.getParameter("quantity"));

String pageNum = request.getParameter("pageNum");
String category = "";
String searchPname = "";

if(request.getParameter("category") != null && !request.getParameter("category").equals("")) {
	category = request.getParameter("category");
}

if(request.getParameter("searchPname") != null && !request.getParameter("searchPname").equals("")) {
	searchPname = request.getParameter("searchPname");
}

// 넘어온 pid를 이용해 DB product table에서 데이터를 가져온 후, cart 테이블에 넣는다.
ProductDBBean proDB = ProductDBBean.getInstance();
ProductDataBean product = proDB.getProduct(pid);

CartDBBean dbPro = CartDBBean.getInstance();
//현재 로그인된 아이디의 장바구니에 장바구니정보 저장 , 주문수량, 상품에 대한 정보를 저장
check = dbPro.insertCart(login_id, qty, product); 

if(check > 0 ) { // insert 성공
	out.print("<script> location.href='cart_list.jsp?pageNum="+pageNum+"&category="+category+"&searchPname="+searchPname+"'</script>");
} else { // isnert 실패
	out.print("<script>alert('장바구니 담기에 실패하였습니다.'); history.back();</script>");		
}
// DB_END
%>
</body>
</html>