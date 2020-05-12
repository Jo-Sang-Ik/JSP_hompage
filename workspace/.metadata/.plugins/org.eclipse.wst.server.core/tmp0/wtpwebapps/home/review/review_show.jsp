<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@page import="com.plantshop.review.*"%>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/review_show.css">
</head>
<body>
<div id="container">
	<h3>상품후기</h3>
<%
request.setCharacterEncoding("utf-8");

// 상세페이지에서 넘오오는 상품아이디 저장
int pid = Integer.parseInt(request.getParameter("pid")); 

// 페이지 - 한 화면, 로우 - 글의 수
int pageSize = 3; // 화면에서 표시할 글의 갯수
String pageNum = request.getParameter("pageNum"); // 넘어오는 페이지 번호 // 넘어오다 빠질 수 있으므로 int로 받지않음.

if(pageNum == null) { // 처음페이지를 열었을 때 아무페이지도 없을 때를 위해 작성.
	pageNum = "1"; // 처음 페이지
}

int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
int startRow = (currentPage - 1) * pageSize + 1; // // 현재 페이지에서 보여줄 첫번째 글 [ex. (3 - 1) * 3 + 1 = 7 ]
int endRow = currentPage * pageSize; // 3 * 3 = 9 // 이게 맞지.
int totalRow = 0; // 전체 글 수

ReviewDBBean dbPro = ReviewDBBean.getInstance();
totalRow = dbPro.getReviewCount(pid);

List<ReviewDataBean> reviewList = dbPro.getReviewList(pid, startRow, pageSize);
	
if(reviewList.isEmpty()) {
	out.println("<div style='text-align: center'><hr>등록한 글이 없습니다.<hr></div>");
} else {
	for(ReviewDataBean review : reviewList) { // select할때 limit를 써줘서 이렇게 된다^^
%>
	<table> <!-- 테이블을 하나씩 만들어야하기때문에  for문안에 모두 넣어줘야한다. -->
		<tr>
			<td>제목 : <%=review.getSubject() %></td>
		</tr>
		<tr>
			<td>작성자 : <%=review.getName() %></td>
		</tr>
		<tr>
			<td>작성일 : <%=review.getInputdate() %></td>
		</tr>
		<tr>
			<!-- pre를 써서 작성된 모양대로 나오게함 -->
			<td><pre><%=review.getContent() %></pre></td> 
		</tr>
	</table>
<%
	} // for
} // else


// 페이징 처리
out.println("<div id='paging'>");

if(totalRow > 0) {
	// int pageCount = (totalRow - 1) / pageSize + 1;           // true : false
	int totalPage = totalRow / pageSize + (totalRow % pageSize == 0 ? 0 : 1); // 전체 페이지 수 // 직관적으로 나머지가 생기면 1을 더해주는 참 좋다~
	int startPage = 1; // 시작페이지
	
	int count = 3; // 표시할 페이지의 수. ex) 3이라면[1][2][3], 
	
	if(currentPage % count != 0) { // 페이지를 보여줄 갯수
		startPage = (int)(currentPage/count)*count + 1;
	} else {	
		startPage = (int)((currentPage/count)-1)*count + 1;
	}
	
	int endPage = startPage + count - 1; // 1, 4 // 1 + 3 - 1 = 3 // 4 + 3 - 1 = 6
	if(endPage > totalPage) endPage = totalPage;
	
	// 1. 이전을 눌렀을 때 1페이지씩 이전으로 이동
	if(currentPage > 1) {
		out.println("<a href='review_show.jsp?pid="+pid+"&pageNum=1'>");
		out.println("<div id='pnum' class='page'>&lt&lt</div></a>");
		
		out.println("<a href='review_show.jsp?pid="+pid+"&pageNum=" + (currentPage-1) + "'>");
		out.println("<div id='pnum' class='page'>&lt</div></a>");
	} else {
		out.println("<div id='pnum' class='page'>&lt&lt</div>");
		out.println("<div id='pnum' class='page'>&lt</div>");
	}
	
	// 2. 이전 페이지 유무 확인 // 이전을 눌렀을 때 count페이지(보여지는 페이지 갯수) 만큼 이전으로 이동
	/* if(startPage > count) { // 이전을 바꾸고 싶으면 pageNum을 혹은 cuurentPage를 3으로 나눴을때 1이면
		out.println("[<a href='review_show.jsp?pageNum=1'>처음</a>]");
		// out.println("[<a href='review_show.jsp?pageNum=" + (startPage-count) + "'>이전</a>]");
		out.println("[<a href='review_show.jsp?pageNum=" + (currentPage-1) + "'>이전</a>]");
	} else {
		out.println("[처음]");
		out.println("[이전]");
	} */
	
	// 페이지 번호 출력
	for(int i=startPage; i<=endPage; i++) {
		if(i == currentPage) {
			out.println("<div id='pnum' class='spnum'>" + i + "</div>");
		} else {
			out.println("<a href='review_show.jsp?pid="+pid+"&pageNum=" + i + "'>");
			out.println("<div id='pnum'>" + i + "</div></a>");
		}
	}
	
	// 1. 다음을 눌렀을 대 1페이지씩 다음으로 이동
	if(currentPage < totalPage) {
		out.print("<a href='review_show.jsp?pid="+pid+"&pageNum=" + (currentPage+1) + "'>");
		out.println("<div id='pnum' class='page'>&gt;</div></a>");
		
		out.println("<a href='review_show.jsp?pid="+pid+"&pageNum=" + totalPage + "'>");
		out.println("<div id='pnum' class='page'>&gt;&gt;</div></a>");
	} else {
		out.println("<div id='pnum' class='page'>&gt;</div>");
		out.println("<div id='pnum' class='page'>&gt;&gt;</div>");
	}
	
	// 다음 페이지 유무
	// 2. 다음을 눌렀을 때 count페이지만큼 다음으로 이동
	/* if(endPage < totalPage) {
		out.println("[<a href='review_show.jsp?pageNum=" + (startPage+count) + "'>다음</a>]");
		out.println("[<a href='review_show.jsp?pageNum=" + totalPage + "'>마지막</a>]");
	} else {
		out.println("[다음]");
		out.println("[마지막]");
	} */
	out.println("&nbsp;<font id='tot_pages' color='blue'>" + currentPage + "/" + totalPage + "</font>");
}
	
out.println("</div>");

if(session.getAttribute("login_id") !=null) {
%>
<p><a href="review_write.jsp?pid=<%=pid %>"><img src="./image/write.gif" width="60" height="25"></a></p>
<!-- <div class="move"><a href="review_write.jsp"><img src="./image/write.gif" width="60" height="25"></a></div> -->
<%} %>
</div>
</body>
</html>