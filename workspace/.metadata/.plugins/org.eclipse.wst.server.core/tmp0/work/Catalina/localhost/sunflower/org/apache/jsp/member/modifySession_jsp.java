/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.30
 * Generated at: 2020-05-08 02:02:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import com.plantshop.user.*;

public final class modifySession_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/member/../module/bottom.jsp", Long.valueOf(1587045541885L));
    _jspx_dependants.put("/member/../module/top.jsp", Long.valueOf(1588731276364L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.text");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("com.plantshop.user");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<title>언제나 함께 썬플라워</title>\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<link href=\"./css/member_main.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"./css/modifySession.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("<script src=\"./js/modify.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div id=\"container\">        \r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/sunflower/module/etc.css\">\r\n");
      out.write("<script src=\"/sunflower/module/etc.js\"></script>\r\n");
      out.write("<header>\r\n");
      out.write("\t<div class=\"top_login\">\r\n");
 
request.setCharacterEncoding("utf-8"); 

String login_name = (String)session.getAttribute("login_name");
String login_id = (String)session.getAttribute("login_id");

session.setAttribute("login_id", login_id);

if(session.getAttribute("login_id") == null) { // 로그인이 되지 않은 상태

      out.write("\r\n");
      out.write("\t<div id=\"login\">\r\n");
      out.write("\t\t<a href=\"/sunflower/member/loginForm.jsp\">로그인</a>\r\n");
      out.write("\t\t<a href=\"/sunflower/member/joinForm.jsp\">회원가입</a>\r\n");
      out.write("\t\t<a href=\"/sunflower/cart/cart_list.jsp\">장바구니</a>\r\n");
      out.write("\t\t<a href=\"/sunflower/freeboard/freeboard_list.jsp\">고객센터</a>\r\n");
      out.write("\t</div>\r\n");
} else {
      out.write("\t<!-- 로그인이 된 상태 -->\r\n");
      out.write("\t<div id=\"login\">\r\n");
      out.write("\t\t<!-- admin이면 버튼이 나타남 -->\r\n");
      out.write("\t\t");
 if(login_id.equals("admin") == true) { login_name = "관리자"; 
      out.write("\r\n");
      out.write("\t\t\t<a href=\"/sunflower/product/product_list.jsp\">관리자 모드</a>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t<a>");
      out.print(login_name );
      out.write("님</a>\r\n");
      out.write("\t\t<a href=\"/sunflower/member/logout.jsp\">로그아웃</a>\r\n");
      out.write("\t\t<a href=\"/sunflower/member/select.jsp\">개인정보 조회</a>\r\n");
      out.write("\t\t<a href=\"/sunflower/cart/cart_list.jsp\">장바구니</a>\r\n");
      out.write("\t\t<a href=\"/sunflower/freeboard/freeboard_list.jsp\">고객센터</a>\r\n");
      out.write("\t</div>\r\n");
} 
      out.write("                   \r\n");
      out.write("\t</div>    \r\n");
      out.write("\t      <div id=\"total_menu\">\r\n");
      out.write("\t\t<div id=\"logo\">\r\n");
      out.write("\t\t\t<img class=\"imgbtn\" src=\"/sunflower/image/logo.png\" onclick=\"location.href='/sunflower/index.jsp'\">\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<nav id=\"title_menu\">\r\n");
      out.write("\t\t\t<form action=\"/sunflower/shop_list.jsp\" method=\"post\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" id=\"searchPname\" name=\"searchPname\" placeholder=\"상품명 검색\">\r\n");
      out.write("\t\t\t\t<input type=\"image\" src=\"/sunflower/image/search.png\" height=\"30px\">\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</nav>\t\r\n");
      out.write("\t\t<nav id=\"submenu_nav\">\r\n");
      out.write("\t\t\t<div id=\"submenu_item\">\r\n");
      out.write("\t\t\t\t<a href=\"/sunflower/shop_list.jsp\">전체 상품</a>\r\n");
      out.write("\t\t\t\t<a href=\"/sunflower/shop_list_item.jsp?item=new\">새로운 상품</a>\r\n");
      out.write("\t\t\t\t<a href=\"/sunflower/shop_list_item.jsp?item=best\">인기 상품</a>\r\n");
      out.write("\t\t\t\t<a href=\"/sunflower/shop_list_item.jsp?item=mditem\">추천 상품</a>\r\n");
      out.write("\t\t\t\t<a href=\"/sunflower/shop_list_item.jsp?item=sale\">할인 상품</a>\r\n");
      out.write("\t\t\t\t<a href=\"/sunflower/shop_list.jsp?category=11\">공기정화 식물</a>\r\n");
      out.write("\t\t\t\t<a href=\"/sunflower/shop_list.jsp?category=22\">인테리어 식물</a>\r\n");
      out.write("\t\t\t\t<div id=\"detail_menu\" class=\"detail_menu1\">\r\n");
      out.write("\t\t\t\t\t<a id=\"detail_title\" href=\"/sunflower/shop_list.jsp?category=33\">꽃선물</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"detail_bar\">\r\n");
      out.write("\t\t\t\t\t\t<a href=\"/sunflower/shop_list.jsp?category=331\">꽃다발</a><br>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"/sunflower/shop_list.jsp?category=332\">꽃바구니</a><br>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"/sunflower/shop_list.jsp?category=333\">꽃상자</a>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div id=\"detail_menu\" class=\"detail_menu2\">\r\n");
      out.write("\t\t\t\t\t<a id=\"detail_title\" href=\"/sunflower/shop_list.jsp?category=44\">소품샵</a>\r\n");
      out.write("\t\t\t\t\t<div id=\"detail_bar\">\r\n");
      out.write("\t\t\t\t\t\t<a href=\"/sunflower/shop_list.jsp?category=441\">화병</a><br>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"/sunflower/shop_list.jsp?category=442\">꽃가위</a><br>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"/sunflower/shop_list.jsp?category=443\">굿즈</a>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</nav>\r\n");
      out.write("\t</div>\r\n");
      out.write("</header>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("    <section>\r\n");
      out.write("    \t<div id=\"content\">\r\n");
 
String userid = (String)session.getAttribute("login_id");
String zipcode1 = request.getParameter("zipcode1");
String zipcode2 = request.getParameter("zipcode2");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");

String zipcode = zipcode1 + "-" + zipcode2;
String phone = phone1 + "-" + phone2 + "-" + phone3;

      out.write('\r');
      out.write('\n');
      com.plantshop.user.UserDataBean article = null;
      article = (com.plantshop.user.UserDataBean) _jspx_page_context.getAttribute("article", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (article == null){
        article = new com.plantshop.user.UserDataBean();
        _jspx_page_context.setAttribute("article", article, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("article"), request);
      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.handleSetProperty(_jspx_page_context.findAttribute("article"), "userid",
userid );
      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.handleSetProperty(_jspx_page_context.findAttribute("article"), "zipcode",
zipcode );
      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.handleSetProperty(_jspx_page_context.findAttribute("article"), "phone",
phone );
      out.write('\r');
      out.write('\n');

StringTokenizer st_zipcode = null;
StringTokenizer st_phone = null;

UserDBBean dbPro = UserDBBean.getInstance();
UserDataBean user = null;

String mode = request.getParameter("mode");

if(mode == null || mode.equals("modify")) {
	user = dbPro.getUserInfo(userid); 
	if(user != null) { // User의 가입정보가 있다면
		st_zipcode = new StringTokenizer(user.getZipcode(), "-");
		st_phone = new StringTokenizer(user.getPhone(), "-");
		
		if(st_zipcode.hasMoreTokens()) zipcode1 = st_zipcode.nextToken();
		if(st_zipcode.hasMoreTokens()) zipcode2 = st_zipcode.nextToken();
		
		if(st_phone.hasMoreTokens()) phone1 = st_phone.nextToken();
		if(st_phone.hasMoreTokens()) phone2 = st_phone.nextToken();
		if(st_phone.hasMoreTokens()) phone3 = st_phone.nextToken();
	}
} else if(mode.equals("update")) {
	int check = dbPro.userUpdate(article);
	if(check > 0) {
		out.print("<script>alert('회원정보 수정에 성공하였습니다.'); location='../index.jsp';</script>");
	} else {
		out.print("<script>alert('회원정보 수정에 실패하였습니다. 다시한번 시도해 주세요.'); location='../index.jsp';</script>");
	}
	return;
}

      out.write("\r\n");
      out.write("\t<div id=\"modifyform\">\r\n");
      out.write("\t\t<form name=\"join\" action=\"modifySession.jsp\" method=\"post\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"mode\" value=\"update\">\r\n");
      out.write("\t\t<h1>회원정보 수정</h1>\r\n");
      out.write("\t\t<table>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th width=\"15%\">아이디</th>\r\n");
      out.write("\t\t\t\t<td width=\"85%\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"userid\" maxlength=\"16\" size=\"20\" value=\"");
      out.print(userid );
      out.write("\" readonly>&nbsp;<font color=\"red\"><small>* 아이디는 변경할 수 없습니다.</small></font>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>비밀번호</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"password\" maxlength=\"12\" size=\"20\" value=\"");
      out.print(user.getPassword() );
      out.write("\"  onkeyup=\"pwdCheck()\" >&nbsp;<small>(영문+숫자 4~12자리)</small>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>비밀번호 확인</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"password2\" maxlength=\"12\" size=\"20\" value=\"");
      out.print(user.getPassword() );
      out.write("\" onkeyup=\"pwdCheck()\" onclick=\"pwdCheck()\"><span id=\"pwdCheckCircle\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>이름</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"username\" maxlength=\"10\" size=\"10\" value=\"");
      out.print(user.getUsername() );
      out.write("\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>EMAIL</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"email\" name=\"email\" maxlength=\"50\" size=\"20\" value=\"");
      out.print(user.getEmail() );
      out.write("\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>우편번호</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"zipcode1\" maxlength=\"3\" size=\"3\" value=\"");
      out.print(zipcode1 );
      out.write("\"> -\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"zipcode2\" maxlength=\"3\" size=\"3\" value=\"");
      out.print(zipcode2 );
      out.write("\">&nbsp;\r\n");
      out.write("\t\t\t\t\t<input type=\"button\" class=\"btns\" value=\"우편번호 검색\" onclick=\"MM_openBrWindow('zipcodeSearch.jsp', 'zipcodesearch', 'scrollbars=yes, width=600px, height=600px')\">&nbsp;\r\n");
      out.write("\t\t\t\t\t<small><font color=\"blue\">우편번호 검색 버튼을 눌러주세요.</font></small>\t\t\t\t\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>주소</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"address1\" maxlength=\"100\" size=\"50\" value=\"");
      out.print(user.getAddress1() );
      out.write("\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>나머지 주소</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"address2\" maxlength=\"100\" size=\"50\" value=\"");
      out.print(user.getAddress2() );
      out.write("\">\r\n");
      out.write("\t\t\t\t\t<small><font color=\"red\">나머지 주소를 입력해주세요.</font></small>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>전화번호</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"phone1\" maxlength=\"3\" size=\"3\" value=\"");
      out.print(phone1 );
      out.write("\"> -\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"phone2\" maxlength=\"4\" size=\"4\" value=\"");
      out.print(phone2 );
      out.write("\"> - \r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"phone3\" maxlength=\"4\" size=\"4\" value=\"");
      out.print(phone3 );
      out.write("\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr class=\"end_row\">\r\n");
      out.write("\t\t\t\t<th colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t<input type=\"button\" class=\"btns\" value=\"수정\" onclick=\"doSubmit()\">&nbsp;\r\n");
      out.write("\t\t\t\t\t<input type=\"button\" class=\"btns\" value=\"취소\" onclick=\"history.back()\">&nbsp;\r\n");
      out.write("\t\t\t\t\t<input type=\"button\" class=\"btns\" value=\"메인페이지\" onclick=\"location.href='../index.jsp'\">\r\n");
      out.write("\t\t\t\t</th>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</section>\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<footer>\r\n");
      out.write("\t<ul>\r\n");
      out.write("\t\t<li>COMPANY 썬플라워 주식회사 OWNER 조상익 C.P.O 조상익 E-mail npngj95@naver.com CALL CENTER 070-1234-5678</li>\r\n");
      out.write("\t\t<li>MALL ORDER LICENSE 2019-구미원평동-0001 호 [사업자정보확인] BUSINESS LICENSE 111-11-11111\r\n");
      out.write("\t\t<li> ADDRESS (우) 39221 경상북도 구미시 구미중앙로 1길 11</li>\r\n");
      out.write("\t\t<li><p>Copyright The SUNFLOWER All right reserved / design by JO / \r\n");
      out.write("\t\tAgreement / 개인정보취급방침 / Guide</p></li>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<li>고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 PG사의 구매안전서비스를 이용하실 수 있습니다.</li>\r\n");
      out.write("\t\t<li>KG 이니시스 에스크로 (서비스가입사실확인)</li>\r\n");
      out.write("\t</ul>\r\n");
      out.write("</footer>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
