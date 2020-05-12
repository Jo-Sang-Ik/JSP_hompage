<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.plantshop.product.*"%>
<%@ page import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>언제나 함께 썬플라워</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/product_main.css" rel="stylesheet">
<link href="./css/product_detail.css" rel="stylesheet">

<script src="./js/product_detail.js"></script>
</head>
<body>
<div id="container">        
	<%@ include file="../module/top.jsp" %>
	<section>
		<div id="content">
		<%
			//검색 처리 부분
			String searchPname = "";
			String category = "";
	
			//1. searchPname(상품이름)으로 검색
			if(request.getParameter("searchPname") != null && !request.getParameter("searchPname").equals("")) {
				searchPname = request.getParameter("searchPname");
			}
	
			//2. category(상품분류)로 검색
			if(request.getParameter("category") != null && !request.getParameter("category").equals("")) {
				category = request.getParameter("category");
			}
			
			String pageNum = request.getParameter("pageNum"); // 넘어오는 페이지 번호 // 넘어오다 빠질 수 있으므로 int로 받지않음.
			
			if(pageNum == null) { // 처음페이지를 열었을 때 아무페이지도 없을 때를 위해 작성.
				pageNum = "1"; // 처음 페이지
			}
			
			String category_str = null;
			int price = 0;
			int downprice = 0;
			int sellprice = 0;
			
			NumberFormat nf = NumberFormat.getInstance();
			String price_nf = null; // 포맷 설정한 정가
			String sellprice_nf = null; // 포맷 설정한 할인가 
			int stock = 0;
			String filename = null; 
			String url = "/plantshop"; // server.xml에서 로컬(절대)경로를 변경한 경로
			
			int pid = Integer.parseInt(request.getParameter("id"));
			
			ProductDBBean dbPro = ProductDBBean.getInstance();
			ProductDataBean product = dbPro.getProduct(pid);
					
			if(product == null) {
				out.println("<div align='center'><font color='red'><h4>상품이 없습니다.</h4></font></div>");
			} else {
				pid = product.getId();
				stock = product.getStock();
				
				// 할인가가 없을 시 정가로 계산
				price = product.getPrice();
				downprice = product.getDownprice();
				if(downprice == 0) {
					sellprice = price;
				} else {
					sellprice = downprice;
				}
				sellprice_nf = nf.format(sellprice);
				price_nf = nf.format(price);
				
				switch(product.getCategory()) { // Array 구체화를 해주지않았기 때문에 object타입으로 인식
					case "11": 
						category_str = "공기정화 식물";
						break;
					case "22":
						category_str = "인테리어 식물";
						break;
					case "331":
						category_str = "꽃다발";
						break;
					case "332":
						category_str = "꽃바구니";
						break;
					case "333":
						category_str = "꽃상자";
						break;
					case "441":
						category_str = "화병";
						break;
					case "442":
						category_str = "꽃가위";
						break;
					case "443":
						category_str = "굿즈";
						break;
						
					default:
						category_str = "기타";
						break;
				}
				out.println("<a id='move' onclick='history.back();'>◀ 뒤로 가기</a>");
				out.println("<div id='info'>");
				out.println("<div id='title_img'><img class='big_img' src='" + url + "/" + product.getSmall_img() + "'>");
				out.println("<div id='sub_img'><img class='small_img' src='" + url + "/" + product.getSmall_img() + "' class='small_img'>");
			    // 사진 선택 부분
				if(product.getImg1() != null) {
			    	out.println("<img src='" + url + "/" + product.getImg1() + "' class='small_img'>");				    	
			    }
			    
			    if(product.getImg2() != null) {
			    	out.println("<img src='" + url + "/" + product.getImg2() + "' class='small_img'>");
			    }
				
			    out.println("</div>");
		    	out.println("</div>");
		    	
				out.println("<div id='info_title'>");//info_title
				out.println("<div id='info_table'>");	//info_table
				out.println("<div id='t_pname'>" + product.getPname() + "</div>");
				out.println("<div id='t_price'>판매가<span>" + sellprice_nf + "원</span></div>");
				
				if(downprice > 0) {
					out.println("<table><tr><th>정가</th><td width='*'> : <del>&nbsp;" + price_nf + "&nbsp;</del>원</td></tr>");
					out.println("<tr><th width='10%'>품명</th><td> : " + category_str + "</td></tr>");
				} else {
					out.println("<table><tr><th width='10%'>품명</th><td> : " + category_str + "</td></tr>");
				}
				out.println("<tr><th>제조원</th><td> : " + product.getSname() + "</td></tr>");
				out.print("<tr><th>재고량</th><td> : " + product.getStock() + "</td></tr>");
				out.print("</table>");
				out.print("</div>");
				
				out.print("<form name='productForm' method='post' action='../cart/cart.jsp'>");
				if(stock > 0) { // 재고량이 1개 이상 있을 때
					out.print("<input type='hidden' name='uid' value='" + login_id + "'>"); // script문으로 바로구매를 위해
					out.print("<input type='hidden' name='mode' value='direct'>"); // script문으로 바로구매를 위해
					
					out.print("<input type='hidden' name='pageNum' value=" + pageNum + ">");
					out.print("<input type='hidden' name='searchPname' value=" + searchPname + ">");
					out.print("<input type='hidden' name='category' value=" + category + ">");
					out.print("<input type='hidden' name='pid' value=" + pid + ">");
					out.print("<input type='hidden' name='price' id='price' value="+sellprice+">");
					
					out.println("<input type='button' class='cahnge_qty' value='-' onclick='changeQty(-1)'>");
					out.println("<input type='number' name='quantity' id='quantity' min=1 max="+product.getStock()+" value=1>");
					out.println("<input type='button' class='cahnge_qty' value='+' onclick='changeQty(1)'><br>");
					
					out.println("<span id='total_text'>총 상품 금액</span>");
					out.println("<span id='total_price'>"+sellprice_nf+"원</span><br><br>"); // 총가격 표시
					out.println("<input id='buy_button' type='button' value='즉시구매' onclick='buy("+ product.getStock() + ");'>");
					out.println("<input id='cart_button' type='submit' value='장바구니'>");
				} else { // 재고량이 0일 때
					out.print("&nbsp;&nbsp;&nbsp;<tr><td colspan='2'><font color='red'><b>품절!</b></font></td></tr>");
				}
				// 총 가격을 계산하기위해
				out.print("</form>");
				
				out.println("<table id='info_content_table'><tr><th>상품정보</th></tr>");
				out.println("<tr><td valign='top'>" + product.getDescription() + "</td></tr></table>");
				
				out.println("</div>"); // info_title
				out.println("</div>"); // info
				
				out.print("<div id='info_detail'>");
				out.print("<p>상품 상세정보</p><hr>");
				out.print("<div id='info_img'>");
				if( product.getImg1() != null) {
					out.print("<img src='" + url + "/" + product.getImg1() + "'>");	
				}
				
				if( product.getImg2() != null) {
					out.print("<img src='" + url + "/" + product.getImg2() + "'>");	
				}
				
				if( product.getImg3() != null) {
					out.print("<img src='" + url + "/" + product.getImg3() + "'>");	
				}
				
				if( product.getImg4() != null) {
					out.print("<img src='" + url + "/" + product.getImg4() + "'>");	
				}
				
				out.print("</div>"); // info_img
				out.print("</div>"); // info_detail
				%>
				<hr>
				<div id="freeboard">
		        	<iframe src="../review/review_show.jsp?pid=<%=pid %>" width="100%" height="700px" frameborder=0></iframe>
		        </div>
				<%
			}
			%>
		</div>
	</section>
   	<%@ include file="../module/bottom.jsp" %>
</div>
</body>
</html>
