<%@page import="com.plantshop.freeboard.FreeBoardDataBean"%>
<%@page import="com.plantshop.freeboard.FreeBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록 보기</title> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/freeboard_main.css" rel="stylesheet">
<link href="css/freeboard_search.css" rel="stylesheet" >
 
<script src="js/freeboard_list.js"></script>
</head>
<body>
<div id="container">        
	<%@ include file="../module/top.jsp" %>
	<section>
		<div id="content">
			<h2>Q&A 게시판</h2>
			<form name="msgsearch" action="freeboard_search.jsp" method="post">
				<table id="search_table">
					<tr class="search_row">
						<td class="search_first_row">
							<a href="freeboard_list.jsp"><div>◀ 자유 게시판(일반모드)</div></a>
						</td>
						<td class="search_second_row">
							<select name="searchType">
<%
String condition = null;
String searchValue = null;
int searchType = 1;

if(request.getParameter("searchType") != null) {
	searchType = Integer.parseInt(request.getParameter("searchType"));
	searchValue = request.getParameter("sval");
	
	if(searchType == 1) {
		out.print("<option value='1' selected>이름</option>");
		condition = " where name like '%" + searchValue + "%'";
	} else {
		out.print("<option value='1'>이름</option>");
	}

	if(searchType == 2) {
		out.print("<option value='2' selected>제목</option>");
		condition = " where subject like '%" + searchValue + "%'";
	} else {
		out.print("<option value='2'>제목</option>");
	}
	
	if(searchType == 3) {
		out.print("<option value='3' selected>내용</option>");
		condition = " where content like '%" + searchValue + "%'";
	} else {
		out.print("<option value='3'>내용</option>");
	}
	
	if(searchType == 4) {
		out.print("<option value='4' selected>이름+제목</option>");
		condition = " where name like '%" + searchValue + "%' or subject like '%" + searchValue + "%'";
	} else {
		out.print("<option value='4'>이름+제목</option>");
	}
	
	if(searchType == 5) {
		out.print("<option value='5' selected>이름+내용</option>");
		condition = " where name like '%" + searchValue + "%' or content like '%" + searchValue + "'" ;
	} else {
		out.print("<option value='5'>이름+내용</option>");
	}
	
	if(searchType == 6) {
		out.print("<option value='6' selected>제목+내용</option>");
		condition = " where subject like '%" + searchValue + "%' or content like '%" + searchValue + "'";
	} else {
		out.print("<option value='6'>제목+내용</option>");
	}
	
	if(searchType == 7) {
		out.print("<option value='7' selected>이름+제목+내용</option>");
		condition = " where name like '%" + searchValue 
				+ "%' or subject like '%" + searchValue 
				+ "%' or content like '%" + searchValue + "%'" ; ;
	} else {
		out.print("<option value='7'>이름+제목+내용</option>");
	}
	
	if(searchValue.trim().equals("")) condition ="";
}
%>
					</select>
					<input type="text" name="sval" size="17" value="<%=request.getParameter("sval") %>">
					<a onclick="check()"><div id="search_submit">검색</div></a>
				</td>
			</tr>
		</table>
	</form>
<%
// 페이지 - 한 화면, 로우 - 글의 수
int pageSize = 10; // 화면에서 표시할 글의 갯수
String pageNum = request.getParameter("pageNum"); // 넘어오는 페이지 번호 // 넘어오다 빠질 수 있으므로 int로 받지않음.

//처음페이지를 열었을 때 아무페이지도 없을 때를 위해 작성.
if(pageNum == null) pageNum = "1"; // 처음 페이지

int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
int startRow = (currentPage - 1) * pageSize + 1; // // 현재 페이지에서 보여줄 첫번째 글 [ex. (3 - 1) * 3 + 1 = 7 ]
int endRow = currentPage * pageSize; // 3 * 3 = 9 // 이게 맞지.
int totalRow = 0; // 전체 글 수
int number = 0;

FreeBoardDBBean dbPro = FreeBoardDBBean.getInstance();

totalRow = dbPro.getFreeBoardConditionCount(condition);
if(endRow > totalRow) {
	endRow = totalRow;	
}

if(totalRow <= 0) {
	out.println("<div class='none'>게시판에 등록된 글이 없습니다.</div>");
} else {
%>
	<table id="freeboard_list">
		<tr>
			<th width='8%'>글번호</th>
			<th width='*'>제목</th>
			<th width='15%'>글쓴이</th>
			<th width='15%'>등록날짜</th>
			<th width='8%'>조회</th>
		</tr>
<%	
		List<FreeBoardDataBean> freeBoardList = dbPro.getFreeBoardSearch(condition, startRow-1, pageSize);
		number = totalRow - (currentPage -1) * pageSize; 
	
		for(int i=0; i<freeBoardList.size() ; i++) { 
			FreeBoardDataBean freeboard = freeBoardList.get(i);
			
			// 목록에 효과를 부여 (tr에)
			if(i%2 == 0) {
				out.print("<tr bgColor='white' onmouseover=\"bgColor='ivory'\" onmouseout=\"bgColor='white'\">");
			} else {
				out.print("<tr bgColor='#f4f4f4' onmouseover=\"bgColor='ivory'\" onmouseout=\"bgColor='#f4f4f4'\">");
			}
			out.println("<td>" + number-- + "</td>");
			// 제목을 눌렀을 때 id와 currentPage(현재페이지)를 가지고 상세보기로 이동하는 코드
			out.println("<td class='subject_row'>");
			// step에 따라 들여쓰기
			int stepcount = freeboard.getStep();
			if(stepcount > 0) { // 댓글
				for(int j=0; j<stepcount; j++) {
					// out.print("&nbsp;&nbsp;&nbsp;");
					out.print("<img src='image/arrow.png' width='10px'>&nbsp;");
				}
			} else { // 원글
				out.print("<img src='image/close.png' width='15px'>&nbsp;");
			}
			out.println("<a href='freeboard_read.jsp?id=" + freeboard.getId() + "&pageNum=" + currentPage + "'>");
			out.println(freeboard.getSubject() + "</a></td>");
			out.println("<td>" + freeboard.getName() + "</td>");
			// 등록일시에서 날짜만 추출해서 보여줌.
			String idate = freeboard.getInputdate();
			idate = idate.substring(0, 10);
			out.println("<td>" + idate + "</td>");
			out.println("<td>" + freeboard.getReadcount() + "</td></tr>");
		}
		out.println("</table>");
	} // else


// 페이징 처리
out.println("<div id='paging'>");

if(totalRow > 0) {
	int totalPage = totalRow / pageSize + (totalRow % pageSize == 0 ? 0 : 1); // 전체 페이지 수 // 직관적으로 나머지가 생기면 1을 더해주는 참 좋다~
	int startPage = 1; // 시작페이지
	
	int count = 10; // 표시할 페이지의 수. ex) 3이라면[1][2][3], 
	
	if(currentPage % count != 0) { // 페이지를 보여줄 갯수
		startPage = (int)(currentPage/count)*count + 1;
	} else {	
		startPage = (int)((currentPage/count)-1)*count + 1;
	}
	
	int endPage = startPage + count - 1; // 1, 4 // 1 + 3 - 1 = 3 // 4 + 3 - 1 = 6
	if(endPage > totalPage) endPage = totalPage;
	
	// 1. 이전을 눌렀을 때 1페이지씩 이전으로 이동
// 	if(currentPage > 1) {
// 		out.println("<a href='freeboard_search.jsp?pageNum=1");
// 		out.println("&searchType=" + searchType + "&sval=" + searchValue + "'>");
// 		out.println("<div id='pnum' class='page'>&lt&lt</div></a>");
		
// 		out.println("<a href='freeboard_search.jsp?pageNum=" + (currentPage-1));
// 		out.println("&searchType=" + searchType + "&sval=" + searchValue + "'>");
// 		out.println("<div id='pnum' class='page'>&lt</div></a>");
// 	} else {
// 		out.println("<div id='pnum' class='page'>&lt&lt</div>");
// 		out.println("<div id='pnum' class='page'>&lt</div>");
// 	}
	
	// 2. 이전 페이지 유무 확인 // 이전을 눌렀을 때 count페이지(보여지는 페이지 갯수) 만큼 이전으로 이동
	if(startPage > count) { // 이전을 바꾸고 싶으면 pageNum을 혹은 cuurentPage를 3으로 나눴을때 1이면
		out.println("<a href='freeboard_search.jsp?pageNum=1");
		out.println("&searchType=" + searchType + "&sval=" + searchValue + "'>");
		out.println("<div id='pnum' class='page'>&lt&lt</div></a>");
		
		out.println("<a href='freeboard_search.jsp?pageNum=" + (startPage-count));
		out.println("&searchType=" + searchType + "&sval=" + searchValue + "'>");
		out.println("<div id='pnum' class='page'>&lt</div></a>");
	} else {
		out.println("<div id='pnum' class='page'>&lt&lt</div>");
		out.println("<div id='pnum' class='page'>&lt</div>");
	}
	
	// 페이지 번호 출력
	for(int i=startPage; i<=endPage; i++) {
		if(i == currentPage) {
			out.println("<div id='pnum' class='spnum'>" + i + "</div>");
		} else {
			out.print("<a href='freeboard_search.jsp?pageNum=" + i);
			out.print("&searchType=" + searchType + "&sval=" + searchValue + "'>");
			out.println("<div id='pnum'>" + i + "</div></a>");
		}
	}
	
	// 1. 다음을 눌렀을 대 1페이지씩 다음으로 이동
// 	if(currentPage < totalPage) {
// 		out.print("<a href='freeboard_search.jsp?pageNum=" + (currentPage+1));
// 		out.print("&searchType=" + searchType + "&sval=" + searchValue + "'>");
// 		out.println("<div id='pnum'  class='page'>&gt;</div></a>");
		
// 		out.print("<a href='freeboard_search.jsp?pageNum=" + totalPage);
// 		out.print("&searchType=" + searchType + "&sval=" + searchValue + "'>");
// 		out.println("<div id='pnum'  class='page'>&gt;&gt;</div></a>");
// 	} else {
// 		out.println("<div id='pnum'  class='page'>&gt;</div>");
// 		out.println("<div id='pnum'  class='page'>&gt;&gt;</div>");
// 	}
	
	// 다음 페이지 유무
	// 2. 다음을 눌렀을 때 count페이지만큼 다음으로 이동
	if(endPage < totalPage) {
		out.print("<a href='freeboard_search.jsp?pageNum=" + (startPage+count));
		out.print("&searchType=" + searchType + "&sval=" + searchValue + "'>");
		out.println("<div id='pnum'  class='page'>&gt;</div></a>");
		
		out.print("<a href='freeboard_search.jsp?pageNum=" + totalPage);
		out.print("&searchType=" + searchType + "&sval=" + searchValue + "'>");
		out.println("<div id='pnum'  class='page'>&gt;&gt;</div></a>");
	} else {
		out.println("<div id='pnum'  class='page'>&gt;</div>");
		out.println("<div id='pnum'  class='page'>&gt;&gt;</div>");
	}
	
	out.println("&nbsp;<font id='tot_pages' color='blue'>" + currentPage + "/" + totalPage + "</font>");
}
	
out.println("</div>");
%>
	<div class="move"><a href="freeboard_write.jsp"><img src="./image/write.gif" width="60" height="25"></a></div>
	</div>
	</section>
	<%@ include file="../module/bottom.jsp" %>
</div>
</body>
</html>