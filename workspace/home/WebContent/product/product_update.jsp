<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.*" %>
<%@ page import="com.plantshop.product.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>언제나 함께 썬플라워</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/product_main.css" rel="stylesheet">
<link href="./css/product_update.css" rel="stylesheet">

<script src="./js/product_update.js"></script>
</head>
<body>
<div id="container">        
	<%@ include file="../module/top.jsp" %>
	<section>
		<div id="content">
<%
request.setCharacterEncoding("utf-8"); 

int id = Integer.parseInt(request.getParameter("id"));
String pageNum = request.getParameter("pageNum");
String category = request.getParameter("category");
String pname = request.getParameter("pname");

// 1번 방법. 이미지를 불러오는 방법 - 프로젝트 안에서 상대적인 경로로 찾는 방법
// String saveFolder = "../upload"; // 파일이 업로드되는 폴더
//ServletContext context = getServletContext(); // 프로젝트의 경로 
//String fileurl = context.getRealPath(saveFolder); // 파일이 업로드되는 절대경로

// 2번 방법 - 이미지를 불러오는 방법 - tomcat의 server.xml 설정 파일에서 절대 경로를 인식할수 있도록 설정
// server.xml 파일에서 <Host></Host> 안에 아래의 내용을 추가
// <Context docBase="c:/plantshop/" path="tmp" ></Context>
String saveFolder = "/plantshop";

ProductDBBean dbPro = ProductDBBean.getInstance();
ProductDataBean product = dbPro.getProduct(id);
	
if(product == null) {
	out.print("<script> alert('해당하는 상품이 없습니다.'); history.back();</script>");
	return;
}

NumberFormat nf = NumberFormat.getInstance();

String wname = product.getWname();
String sname = product.getSname();
String pname_db = product.getPname();
int price = product.getPrice();
int downprice = product.getDownprice();
int stock = product.getStock();
String description = product.getDescription();
String small = product.getSmall_img();
String img1 = product.getImg1();
String img2 = product.getImg2();
String img3 = product.getImg3();
String img4 = product.getImg4();
String mditem = product.getMditem();
String selling = product.getSelling();

String price_nf = nf.format(price);
String downprice_nf = nf.format(downprice);

String small_src = saveFolder + "/" + small;
String large_src = saveFolder + "/" + img1;
%>
	<h2>상품 정보 수정</h2>
	<!-- 상세보기 테이블  -->
	<div id="detail_table">
		<table border="0">
			<tr>
				<th rowspan="4" width="20%">
				<a href="javascript:view('<%=large_src %>')">
				<img src="<%=small_src %>" width="100px" height="100px" class="small_img"><br>확대</a>
				</th>
				<td class="first">
					<%=pname_db %>(<%=id %>)&nbsp;&nbsp;&nbsp;작성자 : <%=wname %>
				</td>
			</tr>
			<tr align="center">
				<td>상세설명</td>
			</tr>
			<tr>
				<td class="desc"><%=description %> </td>
			</tr>
			<tr align="right">
				<td>
					제조사 : <%=sname %><br>
					정가 : <del><%=price %>원</del>&nbsp;&nbsp;/&nbsp;&nbsp;판매가 : <%=downprice %>원<br>				 
				</td>
			</tr>
		</table>
	</div> <!-- //detail_table  -->
	<!-- 수정폼  -->
	<div id="write_table">
	<form name="productform" action="product_update_save.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="<%=id %>">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		<input type="hidden" name="category" value="<%=category %>">
		<input type="hidden" name="pname" value="<%=pname %>">
		<table>
			<tr>
				<th width="20%">작성자</th>
				<td width="80%"><input type="text" name="wname" id="wname" value="<%=wname %>"></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="pname_db" id="pname_db" size="30" value="<%=pname_db %>"></td>
			</tr>
			<tr>
				<th>제조사</th>
				<td><input type="text" name="sname" id="sname" size="30" value="<%=sname %>"></td>
			</tr>
			<tr>
				<th>정가</th>
				<td><input type="text" name="price" id="price" size="10" value="<%=price %>"></td>
			</tr>
			<tr>
				<th>판매가</th>
				<td><input type="text" name="downprice" id="downprice" size="10" value="<%=downprice %>"></td>
			</tr>
			<tr>
				<th>재고량</th>
				<td><input type="text" name="stock" id="stock" size="10" value="<%=stock %>"></td>
			</tr>
			<tr>
				<th>작은 이미지</th>
				<td>
					<input type="file" name="small" id="small"><br>
					<font color="orange"><%="c:" + saveFolder +"/"+small %></font><br>
					<font color="red"><small>작은 이미지는 반드시 등록 해야 합니다.</small></font>
				</td>
			</tr>
			<tr>
				<th>상품 설명</th>
				<td>
					<textarea name="description" id="description" rows="10" cols="62" placeholder="상품 설명은 생략할 수 있습니다."><%=description %></textarea>
				</td>
			</tr>
			<tr>
				<th>상품 이미지1</th>
				<td>
					<input type="file" name="img1" id="img1"><br>
					<font color="orange"><%="c:" + saveFolder +"/"+img1 %></font><br>
					<font color="blue"><small>이미지1은 생략 할 수 있습니다.</small></font>
				</td>
			</tr>
			<tr>
				<th>상품 이미지2</th>
				<td>
					<input type="file" name="img2" id="img2"><br>
					<font color="orange"><%="c:" + saveFolder +"/"+img2 %></font><br>
					<font color="blue"><small>이미지2는 생략 할 수 있습니다.</small></font>
				</td>
			</tr>
			<tr>
				<th>상품 이미지3</th>
				<td>
					<input type="file" name="img3" id="img3"><br>
					<font color="orange"><%="c:" + saveFolder +"/"+img3 %></font><br>
					<font color="blue"><small>이미지3은 생략 할 수 있습니다.</small></font>
				</td>
			</tr>
			<tr>
				<th>상품 이미지4</th>
				<td>
					<input type="file" name="img4" id="img4"><br>
					<font color="orange"><%="c:" + saveFolder +"/"+img4 %></font><br>
					<font color="blue"><small>이미지4는 생략 할 수 있습니다.</small></font>
				</td>
			</tr>
			<tr>
				<th>추천 상품 체크</th>
				<td>
					<input type="radio" name="mditem" value="y"> Yes
					<input type="radio" name="mditem" value="n" checked> No<br>
				</td>
			</tr>
			<tr>
				<th>판매 여부</th>
				<td>
					<input type="radio" name="selling" value="y" checked> Yes
					<input type="radio" name="selling" value="n"> No<br>
				</td>
			</tr>
			<tr class="end_row">
				<td colspan="2">
					<input class="btns" type="button" value="수정" onclick="check()">&nbsp;&nbsp;
					<input class="btns" type="reset" value="다시 작성">&nbsp;&nbsp;
					<input class="btns" type="button" value="상품목록" onclick="location='product_list.jsp?pageNum=<%=pageNum %>&category=<%=category %>&pname=<%=pname %>'">
				</td>
			</tr>
		</table>
	</form>
	</div> <!-- //write_table  -->
	</div>
	</section>
    <%@ include file="../module/bottom.jsp" %>
</div>
</body>
</html>