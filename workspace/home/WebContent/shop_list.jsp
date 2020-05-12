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

<link href="css/shop_list.css" rel="stylesheet">
</head>
<body>
<div id="container">        
	<%@ include file="./module/top.jsp" %>
    <section>
		<article id="content">
	<%
	//검색 처리 부분
	String condition = ""; // 조건식의 초기값은 공백값으로 설정
	String searchPname = "";
	String category = "";
	String item = "";
	
	// 1. searchPname(상품이름)으로 검색
	if(request.getParameter("searchPname") != null && !request.getParameter("searchPname").equals("")) {
		searchPname = request.getParameter("searchPname");
		condition = " where selling='y' and pname like '%" + searchPname + "%' order by id desc";
	}
	
	// 2. category(상품분류)로 검색
	if(request.getParameter("category") != null && !request.getParameter("category").equals("")) {
		category = request.getParameter("category");
		condition = " where selling='y' and category like '" + category + "%' order by id desc"; // 카테고리는 문자이고 정해저 있어서 =과 홀따옴표를 사용
	}
	
	//페이징 처리 부분
	//페이지 - 한 화면, 로우 - 상품의 수
	int pageSize = 12; // 화면에서 표시할 상품의 갯수
	String pageNum = request.getParameter("pageNum"); // 넘어오는 페이지 번호 // 넘어오다 빠질 수 있으므로 int로 받지않음.
	
	if(pageNum == null) { // 처음페이지를 열었을 때 아무페이지도 없을 때를 위해 작성.
		pageNum = "1"; // 처음 페이지
	}
	
	int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
	int startRow = (currentPage - 1) * pageSize + 1; // // 현재 페이지에서 보여줄 첫번째 글 [ex. (3 - 1) * 3 + 1 = 7 ]
	//int endRow = startRow + pageSize - 1; // 7 + 3 - 1; // 이러면 8번 글하면 안되는거 아니가.
	int endRow = currentPage * pageSize; // 3 * 3 = 9 // 이게 맞지.
	int totalRow = 0; // 전체 글 수
	
	int id = 0;
	NumberFormat nf = NumberFormat.getInstance();
 
	String sellprice_nf = null; // 포맷 설정한 판매가 ex) 45,000
	int stock = 0;
	String filename = null; 
	String url = "/plantshop"; // server.xml에서 로컬(절대)경로를 변경한 경로
	
	// 페이징 처리 - 전체 게시물 갯수 받기
	ProductDBBean dbPro = ProductDBBean.getInstance();
	totalRow = dbPro.getProductCountCondition(condition); // DB로 부터 상품이 총 몇개인지 받아줌
	
	List<ProductDataBean> productList = dbPro.getProductListCondition(condition, startRow, pageSize);
		
	if(productList.isEmpty()) {
		out.println("<div align='center'><font color='red'><h4>상품이 없습니다.</h4></font></div>");
	} else {
		out.print("<div id='item'>");
		out.print("<ul>");
		
		for(int i=0; i<productList.size(); i++) {
			ProductDataBean product = productList.get(i);	
			// filename = url + smallList.get(i);
			id = product.getId();
			
			if(product.getDownprice() == 0) {
				sellprice_nf = nf.format(product.getPrice());	
			} else {
				sellprice_nf = nf.format(product.getDownprice());
			}
			
			out.print("<li><a href='./product/product_detail.jsp?id="+product.getId()+"&pageNum="+pageNum+"&category="+category+"&searchPname="+searchPname+"'>");
			out.print("<img src='" + url + "/" + product.getSmall_img() + "' width=300 height=300>");
		    out.print("<div>" + product.getPname() + "<br><span>￦" + sellprice_nf + "</span></div></a></li>");
		} // end for
		out.print("</ul>");
		out.print("</div>");
		out.print("<div align='right'>전체 상품 수 : " + totalRow + "</div>");
	} // end else
	
	//페이징 처리
	out.println("<div id='paging'>");
	if(totalRow > 0) {
		int totalPage = totalRow / pageSize + (totalRow % pageSize == 0 ? 0 : 1); // 전체 페이지 수 // 직관적으로 나머지가 생기면 1을 더해주는 참 좋다~
		int startPage = 1; // 시작페이지
		
		int count = 5; // 표시할 페이지의 수. ex) 3이라면[1][2][3], 
		
		if(currentPage % count != 0) { // 페이지를 보여줄 갯수
			startPage = (int)(currentPage/count)*count + 1;
		} else {	
			startPage = (int)((currentPage/count)-1)*count + 1;
		}
		
		int endPage = startPage + count - 1; // 1, 4 // 1 + 3 - 1 = 3 // 4 + 3 - 1 = 6
		if(endPage > totalPage) endPage = totalPage;

		// 이전 페이지 유무 확인 // 이전을 눌렀을 때 count페이지(보여지는 페이지 갯수) 만큼 이전으로 이동
		if(startPage > count) { // 이전을 바꾸고 싶으면 pageNum을 혹은 cuurentPage를 3으로 나눴을때 1이면
			out.println("<a href='shop_list.jsp?pageNum=1&category=" + category + "&searchPname=" + searchPname);
			out.println("'><div id='pnum' class='page'>&lt&lt</div></a>");
			
			out.println("<a href='shop_list.jsp?pageNum=" + (startPage-count) + "&category=" + category + "&searchPname=" + searchPname);
			out.println("'><div id='pnum' class='page'>&lt</div></a>");
			
		} else {
			out.println("<div id='pnum' class='page'>&lt&lt</div>");
			out.println("<div id='pnum' class='page'>&lt</div>");
		} 
		
		// 페이지 번호 출력
		for(int i=startPage; i<=endPage; i++) {
			if(i == currentPage) {
				out.println("<div id='pnum' class='spnum'>" + i + "</div>");
			} else {
				out.print("<a href='shop_list.jsp?pageNum=" + i + "&category=" + category + "&searchPname=" + searchPname + "'>");
				out.println("<div id='pnum'>" + i + "</div></a>");
			}
		}
		
		// 다음 페이지 유무
		// 다음을 눌렀을 때 count페이지만큼 다음으로 이동
		if(endPage < totalPage) {
			out.println("<a href='shop_list.jsp?pageNum=" + (startPage+count) + "&category=" + category + "&searchPname=" + searchPname);
			out.println("'><div id='pnum' class='page'>&gt;</div></a>");
			
			out.println("<a href='shop_list.jsp?pageNum=" + totalPage + "&category=" + category + "&searchPname" + searchPname);
			out.println("'><div id='pnum' class='page'>&gt;&gt;</div></a>");
		} else {
			out.println("<div id='pnum' class='page'>&gt;</div>");
			out.println("<div id='pnum' class='page'>&gt;&gt;</div>");
		}
		out.println("&nbsp;<font id='tot_pages' color='blue'>" + currentPage + "/" + totalPage + "</font>");
	}
		
	out.println("</div>");
	%>
	</article>
	</section>
    <%@ include file="./module/bottom.jsp" %>
</div>
</body>
</html>