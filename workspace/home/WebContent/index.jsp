<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.plantshop.product.*" %>
<%@ page import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>언제나 함께 썬플라워</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/main.css" rel="stylesheet">
<!-- 상품 슬라이더 -->
<script src="plugins/carousel/jquery-touchslider.js"></script>
<script src="js/index.js"></script>
</head>
<body>
<div id="container">        
	<%@ include file="./module/top.jsp" %>
    <section>
		<article id="article1">
			<div id="banner">
				<div id="banner_frame">
					<div id="banner_main">
						<ul>
							<li>
								<div class="banner_item">
									<a href="shop_list.jsp?category=11"><img src="image/banner1.jpg"></a>
								</div>
							</li>
							<li>
								<div class="banner_item">
									<a href="shop_list.jsp?category=331"><img src="image/banner2.jpg"></a>
								</div>
							</li>
							<li>
								<div class="banner_item">
									<a href="shop_list.jsp?category=22"><img src="image/banner3.jpg"></a>
								</div>
							</li>	
							<li>
								<div class="banner_item">
									<a href="shop_list_item.jsp?item=sale"><img src="image/banner4.jpg"></a>
								</div>
							</li>					
						</ul>
					</div>
					<div class="banner_controls">
						<img src="image/banner_left.png" width="80px" height="80px" class="banner_prev"></img>
						<img src="image/banner_right.png" width="80px" height="80px" class="banner_next"></img>
						<div class="banner_paging"></div>
						<div class="slider-count"></div>
					</div>
				</div>
			</div>
			
		</article>
		
		<article id="article2">
			<div id="title1"><a href="shop_list_item.jsp?item=best">베스트 셀러</a></div>
			<div id="popular_product">
				<div id="popular_product_frame">
					<div id="popular_product_touchslider">
						<ul>
							<%
							String url = "/plantshop"; // server.xml에서 로컬(절대)경로를 변경한 경로

							ProductDBBean dbPro = ProductDBBean.getInstance();
							List<ProductDataBean> productList = dbPro.getProductList_orderBy_desc("salecount");
							
							int item_count = 0;
							
							if(productList.isEmpty()) {
								out.println("<div align='center'><font color='red'><h4>상품이 없습니다.</h4></font></div>");
							} else {	
								for(int i=0; i<3; i++) {%>
								<li>
									<div class="popular_product_item">	
									<% for(int j=item_count; j<item_count+4; j++) {
										ProductDataBean product = productList.get(j); %>									
										<div>
											<a href="product/product_detail.jsp?id=<%=product.getId() %>"><img src="<%=url+"/"+product.getSmall_img()%>">
				        					<span><%=product.getPname() %></span></a>
										</div>
									<%} // for - 내부 %>
									</div>
								</li>
								<%	item_count+=4;
									}// for - 외부
								} // end else %>
						</ul>
					</div>
					<div class="popular_product_controls">
						<img src="image/left-arrow.png" width="80px" height="80px" class="popular_product_prev"></img>
						<img src="image/right-arrow.png" width="80px" height="80px" class="popular_product_next"></img>
						<div class="popular_product_paging"></div>
						<div class="slider-count"></div>
					</div>
				</div>
			</div>
		</article>
		
		<article id="article3">
			<div id="title2"><a href="shop_list_item.jsp?item=new">새로운 상품</a></div>
			<div id="new_product">
				<div id="new_product_frame">
					<div id="new_product_touchslider">
						<ul>
							<%
							int item_count2 = 0;
							
							List<ProductDataBean> productList2 = dbPro.getProductList_orderBy_desc("inputdate");
							if(productList.isEmpty()) {
								out.println("<div align='center'><font color='red'><h4>상품이 없습니다.</h4></font></div>");
							} else {
									for(int i=0; i<3; i++) {%>
										<li>
											<div class="new_product_item">	
											<% for(int j=item_count2; j<item_count2+4; j++) {
												ProductDataBean product = productList2.get(j); %>	
												<div>
													<a href="product/product_detail.jsp?id=<%=product.getId() %>"><img src="<%=url+"/"+product.getSmall_img()%>">
							      					<span><%=product.getPname() %></span></a>
												</div>
											<%} // for - 내부 %>
											</div>
										</li>
							<%	item_count2+=4;
								}// for - 외부
							} // end else %>
						</ul>
					</div>
					<div class="new_product_controls">
						<img src="image/left-arrow2.png" width="80px" height="80px" class="new_product_prev"></img>
						<img src="image/right-arrow2.png" width="80px" height="80px" class="new_product_next"></img>
						<div class="new_product_paging"></div>
						<div class="slider-count"></div>
					</div>
				</div>
			</div>
		</article>
		
		<article id="article4">
			<div id="title3"><a href="shop_list.jsp?category=44">꽃과 함께하면 좋은 상품</a></div>
			<div id="prop_product">
				<div id="prop_product_frame">
					<div id="prop_product_touchslider">
						<ul>
							<%
							List<ProductDataBean> productList3 = dbPro.getProductList_category("44");
							
							int item_count3 = 0;
							if(productList.isEmpty()) {	
									out.println("<div align='center'><font color='red'><h4>상품이 없습니다.</h4></font></div>");
							} else {
								for(int i=0; i<3; i++) {%>
									<li>
										<div class="prop_product_item">	
										<% for(int j=item_count3; j<item_count3+4; j++) {
											ProductDataBean product = productList3.get(j); %>	
											<div>
												<a href="product/product_detail.jsp?id=<%=product.getId() %>"><img src="<%=url+"/"+product.getSmall_img()%>">
						      					<span><%=product.getPname() %></span></a>
											</div>
										<%} // for - 내부  %>
										</div>
									</li>
							<%	item_count3+=4;
								}// for - 외부
							} // end else%>
						</ul>
					</div>
					<div class="prop_product_controls">
						<img src="image/left-arrow3.png" width="80px" height="80px" class="prop_product_prev"></img>
						<img src="image/right-arrow3.png" width="80px" height="80px" class="prop_product_next"></img>
						<div class="prop_product_paging"></div>
						<div class="slider-count"></div>
					</div>
				</div>
			</div>
		</article>
	</section>
	<%@ include file="./module/bottom.jsp" %>
</div>
</body>
</html>