<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.plantshop.product.*" %>  
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트 처리</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8"); 

// 업로드된 이미지를 외부 폴더로 지정하는 방법
String fileurl = "c:/plantshop";

int maxsize = 5 * 1024 * 1024; // 5MB, 최대크기
String enctype = "utf-8";
DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

// form이 multi 타입이여서 사용
MultipartRequest multi = new MultipartRequest(request, fileurl, maxsize, enctype, policy);

int id = Integer.parseInt(multi.getParameter("id"));
String pageNum = multi.getParameter("pageNum");

String category = "";
if(multi.getParameter("category") != null) {
	category = multi.getParameter("category");
}

String pname = "";
if(multi.getParameter("pname") != null) {
	pname = multi.getParameter("pname");
}

//MultipartRequest는 이미지를 올린 반대순으로 불러온다.
//imageList에는 이미지가 거꾸로 들어가 있다.
//해결책 1 - imageList를 거꾸로 뒤집어서 올린 순서를 원래대로 맞춘다.
//해결책 2 - imageList의 있는 이미지를 DB에 넣을 때 거꾸로 넣는다
ArrayList<String> imageList = new ArrayList();

Enumeration<String> images = multi.getFileNames();
while(images.hasMoreElements()) {
	String f1 = images.nextElement();
	String f2 = multi.getFilesystemName(f1);
	imageList.add(f2);
}

ProductDataBean article = new ProductDataBean();

// db에서 가져오는 상품의 값
article.setId(Integer.parseInt(multi.getParameter("id")));
article.setWname(multi.getParameter("wname"));
article.setPname(multi.getParameter("pname_db"));
article.setSname(multi.getParameter("sname"));
article.setPrice(Integer.parseInt(multi.getParameter("price")));
article.setDownprice(Integer.parseInt(multi.getParameter("downprice")));
article.setDownprice(Integer.parseInt(multi.getParameter("stock")));
article.setDescription(multi.getParameter("description"));
article.setSmall_img(imageList.get(0));
article.setImg1(imageList.get(4));
article.setImg2(imageList.get(3));
article.setImg3(imageList.get(2)); 
article.setImg4(imageList.get(1));
article.setMditem(multi.getParameter("mditem"));
article.setSelling(multi.getParameter("selling"));

ProductDBBean dbPro = ProductDBBean.getInstance();
int check = dbPro.updateProduct(article);

if(check > 0) {
	out.print("<script>alert('상품 수정을 완료하였습니다.'); location='product_list.jsp?pageNum="+pageNum+"&category="+category+"&pname="+pname+"'</script>");
} else {
	out.print("<script>alert('상품 수정에 실패하였습니다.'); history.back();</script>");
} 
%>
</body>
</html>