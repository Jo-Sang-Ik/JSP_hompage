/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.30
 * Generated at: 2020-05-08 08:08:47 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.freeboard;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class freeboard_005fwrite_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/freeboard/../module/top.jsp", Long.valueOf(1588731276364L));
    _jspx_dependants.put("/freeboard/../module/bottom.jsp", Long.valueOf(1587045541885L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<title>언제나 함께 썬플라워</title>\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<link href=\"./css/freeboard_main.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"./css/freeboard_write.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("<script src=\"./js/freeboard_write.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

request.setCharacterEncoding("utf-8"); 

if(session.getAttribute("login_id") == null) {
	out.print("<script>alert('로그인을 후 Q&A 사용해주세요!!'); history.back();</script>");
	return;
}

      out.write('\r');
      out.write('\n');
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
      out.write("<div id=\"container\">        \r\n");
      out.write("    <section>\r\n");
      out.write("    \t<div id=\"content_main\">\r\n");
      out.write("\t\t\t<h2>게시판 글쓰기</h2>\r\n");
      out.write("\t\t\t<form name=\"msgwrite\"  method=\"post\" action=\"freeboard_save.jsp\" >\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th><label for=\"name\">이름</label></th>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"name\" id=\"name\" autofocus required></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th><label for=\"email\">E-MAIL</label></th>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"email\" id=\"email\" required></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th><label for=\"subject\">제목</label></th>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"subject\" id=\"subject\" size=\"50\" maxlength=\"50\" required></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th><label for=\"content\">내용</label></th>\r\n");
      out.write("\t\t\t\t\t\t<td><textarea name=\"content\" id=\"content\" rows=\"18\" cols=\"90\" maxlength=\"2000\" style=\"resize: none\" required ></textarea></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th><label for=\"password\">비밀번호</label></th>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"password\" name=\"password\" id=\"password\" required>&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t<font color=\"red\"><small>비밀번호를 입력하면 수정 또는 삭제가 가능합니다.</small></font>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr class=\"end_row\">\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"#\" onclick=\"check()\"><img src=\"image/ok.gif\" width=\"60\" height=\"25\"></a>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"#\" onclick=\"history.back()\"><img src=\"image/cancel.gif\" width=\"60\" height=\"25\"></a>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</div>\r\n");
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
