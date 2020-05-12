<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>언제나 함께 썬플라워</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/product_main.css" rel="stylesheet">
<link href="./css/product_write.css" rel="stylesheet">

<script src="./js/product_write.js"></script>
</head>
<body>
<div id="container">        
	<%@ include file="../module/top.jsp" %>
	<section>
		<div id="content">
		<form name="productform" action="product_save.jsp" method="post" 
			enctype="multipart/form-data">
			<h2>상품 등록</h2>
			<table>
				<tr>
					<th width="20%">작성자</th>
					<td width="80%"><input type="text" name="wname" id="wname"></td>
				</tr>
				<tr>
					<th>상품분류</th>
					<td>
						<select name="category" id="category">
							<option value="11">공기정화 식물</option>
							<option value="22">인테리어 식물</option>
							<option value="331">꽃다발</option>
							<option value="332">꽃바구니</option>
							<option value="333">꽃상자</option>
							<option value="441">화병</option>
							<option value="442">꽃가위</option>
							<option value="443">굿즈</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="pname" id="pname" size="30"></td>
				</tr>
				<tr>
					<th>제조사</th>
					<td><input type="text" name="sname" id="sname" size="30"></td>
				</tr>
				<tr>
					<th>정가</th>
					<td><input type="text" name="price" id="price" size="10"></td>
				</tr>
				<tr>
					<th>판매가</th>
					<td><input type="text" name="downprice" id="downprice" size="10"></td>
				</tr>
				<tr>
					<th>입고 수량</th>
					<td><input type="text" name="stock" id="stock" size="10"></td>
				</tr>
				<tr>
					<th>작은 이미지</th>
					<td>
						<input type="file" name="small" id="small"><br>
						<font color="red"><small>작은 이미지는 반드시 등록 해야 합니다.</small></font>
					</td>
				</tr>
				<tr>
					<th>상품 설명</th>
					<td>
						<textarea name="description" id="description" rows="10" cols="62" placeholder="상품 설명은 생략할 수 있습니다."></textarea>
					</td>
				</tr>
				<tr>
					<th>상품 이미지1</th>
					<td>
						<input type="file" name="img1" id="img1"><br>
						<font color="blue"><small>이미지1은 생략 할 수 있습니다.</small></font>
					</td>
				</tr>
				<tr>
					<th>상품 이미지2</th>
					<td>
						<input type="file" name="img2" id="img2"><br>
						<font color="blue"><small>이미지2는 생략 할 수 있습니다.</small></font>
					</td>
				</tr>
				<tr>
					<th>상품 이미지3</th>
					<td>
						<input type="file" name="img3" id="img3"><br>
						<font color="blue"><small>이미지3은 생략 할 수 있습니다.</small></font>
					</td>
				</tr>
				<tr>
					<th>상품 이미지4</th>
					<td>
						<input type="file" name="img4" id="img4"><br>
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
						<input class='btns' type="button" value="확인" onclick="check()">&nbsp;&nbsp;
						<input class='btns' type="reset" value="다시 작성">&nbsp;&nbsp;
						<input class='btns' type="button" value="상품목록" onclick="location='./product_list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	</section>
    <%@ include file="../module/bottom.jsp" %>
</div>
</body>
</html>