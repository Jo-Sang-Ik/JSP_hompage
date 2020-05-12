<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/sunflower/module/etc.css">
<script src="/sunflower/module/etc.js"></script>
<header>
	<div class="top_login">
<% 
request.setCharacterEncoding("utf-8"); 

String login_name = (String)session.getAttribute("login_name");
String login_id = (String)session.getAttribute("login_id");

session.setAttribute("login_id", login_id);

if(session.getAttribute("login_id") == null) { // 로그인이 되지 않은 상태
%>
	<div id="login">
		<a href="/sunflower/member/loginForm.jsp">로그인</a>
		<a href="/sunflower/member/joinForm.jsp">회원가입</a>
		<a href="/sunflower/cart/cart_list.jsp">장바구니</a>
		<a href="/sunflower/freeboard/freeboard_list.jsp">고객센터</a>
	</div>
<%} else {%>	<!-- 로그인이 된 상태 -->
	<div id="login">
		<!-- admin이면 버튼이 나타남 -->
		<% if(login_id.equals("admin") == true) { login_name = "관리자"; %>
			<a href="/sunflower/product/product_list.jsp">관리자 모드</a>
		<% } %>
		<a><%=login_name %>님</a>
		<a href="/sunflower/member/logout.jsp">로그아웃</a>
		<a href="/sunflower/member/select.jsp">개인정보 조회</a>
		<a href="/sunflower/cart/cart_list.jsp">장바구니</a>
		<a href="/sunflower/freeboard/freeboard_list.jsp">고객센터</a>
	</div>
<%} %>                   
	</div>    
	      <div id="total_menu">
		<div id="logo">
			<img class="imgbtn" src="/sunflower/image/logo.png" onclick="location.href='/sunflower/index.jsp'">
		</div>
		<nav id="title_menu">
			<form action="/sunflower/shop_list.jsp" method="post">
				<input type="text" id="searchPname" name="searchPname" placeholder="상품명 검색">
				<input type="image" src="/sunflower/image/search.png" height="30px">
			</form>
		</nav>	
		<nav id="submenu_nav">
			<div id="submenu_item">
				<a href="/sunflower/shop_list.jsp">전체 상품</a>
				<a href="/sunflower/shop_list_item.jsp?item=new">새로운 상품</a>
				<a href="/sunflower/shop_list_item.jsp?item=best">인기 상품</a>
				<a href="/sunflower/shop_list_item.jsp?item=mditem">추천 상품</a>
				<a href="/sunflower/shop_list_item.jsp?item=sale">할인 상품</a>
				<a href="/sunflower/shop_list.jsp?category=11">공기정화 식물</a>
				<a href="/sunflower/shop_list.jsp?category=22">인테리어 식물</a>
				<div id="detail_menu" class="detail_menu1">
					<a id="detail_title" href="/sunflower/shop_list.jsp?category=33">꽃선물</a>
					<div id="detail_bar">
						<a href="/sunflower/shop_list.jsp?category=331">꽃다발</a><br>
						<a href="/sunflower/shop_list.jsp?category=332">꽃바구니</a><br>
						<a href="/sunflower/shop_list.jsp?category=333">꽃상자</a>
					</div>
				</div>
				<div id="detail_menu" class="detail_menu2">
					<a id="detail_title" href="/sunflower/shop_list.jsp?category=44">소품샵</a>
					<div id="detail_bar">
						<a href="/sunflower/shop_list.jsp?category=441">화병</a><br>
						<a href="/sunflower/shop_list.jsp?category=442">꽃가위</a><br>
						<a href="/sunflower/shop_list.jsp?category=443">굿즈</a>
					</div>
				</div>
			</div>
		</nav>
	</div>
</header>
</html>