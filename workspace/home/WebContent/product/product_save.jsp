<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.plantshop.product.*"%>
<%@ page import="java.sql.*, java.util.*, java.text.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 처리</title>
<style>
	#container { width: 500px; margin: 0 auto;}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8"); 

// 1번 방법 - 업로드된 이미지를 외부 폴더로 지정하는 방법
String fileurl = "c:/plantshop";

// 2번 방법 - 업로드된 이미지를 프로젝트에 포함시키는 방법 
// String fileurl = request.getRealPath("upload");
// fileurl의 경로 - C:/ncs_sangik/jsp01/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/Chapter12/upload
// String saveFolder = "upload"; // 프로젝트에 폴더 생성
// out.print("파일이 업로드되는 절대 경로 : " + fileurl + "<br>");

// 3번 방법 - deprecated된 2번 방법을 수정
//ServletContext context = getServletContext(); // 프로젝트의 경로 
//String saveFolder = "upload"; // 파일이 업로드되는 폴더
//String fileurl = context.getRealPath(saveFolder); // 파일이 업로드되는 절대경로
// fileurl의 경로 (위와 같음)- C:/ncs_sangik/jsp01/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/Chapter12/upload
// out.print("프로젝트의 경로 : " + context.getRealPath("") + "<br>");
// out.print("파일이 업로드 되는 절대 경로 : " + fileurl + "<br>");

int maxsize = 5 * 1024 * 1024; // 5MB, 최대크기
String enctype = "utf-8";
DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

//form이 multi 타입이여서 사용
MultipartRequest multi = new MultipartRequest(request, fileurl, maxsize, enctype, policy);

java.util.Date yymmdd = new java.util.Date();
SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
String inputdate = myFormat.format(yymmdd);

ArrayList<String> imageList = new ArrayList<String>();

//MultipartRequest는 이미지를 올린 반대순으로 불러온다.
//imageList에는 이미지가 거꾸로 들어가 있다.
//해결책 1 - imageList를 거꾸로 뒤집어서 올린 순서를 원래대로 맞춘다.
//해결책 2 - imageList의 있는 이미지를 DB에 넣을 때 거꾸로 넣는다
Enumeration<String> images = multi.getFileNames();
while(images.hasMoreElements()) {
	String f1 = images.nextElement();
	String f2 = multi.getFilesystemName(f1);
	imageList.add(f2);
}
//	out.print("정렬전 imageList : " + imageList + "<br>");
//	거꾸로 뒤집은 imageList - X = 파일의 이름으로 정렬을해서 이미지를 올린 순서대로 안됨.
//	Collections.sort(imageList);
//	out.print("imageList : " + imageList + "<br>");

ProductDataBean article = new ProductDataBean();

article.setWname(multi.getParameter("wname"));
article.setCategory(multi.getParameter("category"));
article.setPname(multi.getParameter("pname"));
article.setSname(multi.getParameter("sname"));
article.setPrice(Integer.parseInt(multi.getParameter("price")));
article.setDownprice(Integer.parseInt(multi.getParameter("downprice")));
article.setStock(Integer.parseInt(multi.getParameter("stock")));
article.setDescription(multi.getParameter("description"));
article.setMditem(multi.getParameter("mditem"));
article.setSelling(multi.getParameter("selling"));
article.setInputdate(inputdate);
article.setSmall_img(imageList.get(0));
article.setImg1(imageList.get(4));
article.setImg2(imageList.get(3));
article.setImg3(imageList.get(2)); 
article.setImg4(imageList.get(1));

System.out.println(article);

ProductDBBean dbPro = ProductDBBean.getInstance();
int check = dbPro.insertProduct(article);
 	
if(check > 0) {
	out.print("<script>alert('상품이 정상적으로 등록되었습니다.'); location='product_list.jsp';</script>");
} else {
	out.print("<script>alert('상품이 등록되지 않았습니다.'); history.back();</script>");
} 
%>
</body>
</html>