<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>언제나 함께 썬플라워</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>

<link href="./css/member_main.css" rel="stylesheet">
<link href="./css/joinForm.css" rel="stylesheet">
</head>
<body>
<div id="container">        
	<%@ include file="../module/top.jsp" %>
    <section>
    	<div id="content_main">
			<div id="joinform">
			<h1>회원가입</h1>
			<form action="joinProc.jsp" method="post" name="join" onsubmit="return doSubmit()">
				<table>
					<tr>
						<th width="15%">아이디<mark>*</mark></th>
						<td width="85%">
							<input type="text" name="userid" maxlength="16" size="20" autofocus>&nbsp;
							<input type="button" class="btns" value="중복확인" onclick="MM_openBrWindow('useridCheck.jsp', 'userid_check', 'width=500px, height=450px')">&nbsp;
							<small>(영문+숫자 5~16자리)<font color="red"> 중복 확인 절차를 거쳐야 합니다.</font></small>
						</td>
					</tr>
					<tr>
						<th>비밀번호<mark>*</mark></th>
						<td>
							<input type="password" name="password" maxlength="12" size="20" onkeyup="pwdCheck();"><small>&nbsp;(영문+숫자 4~12자리)</small> 
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인<mark>*</mark></th>
						<td>
							<input type="password" name="password2" maxlength="12" size="20" onkeyup="pwdCheck();"><span id="pwdCheckCircle"></span>
						</td>
					</tr>
					<tr>
						<th>이름<mark>*</mark></th>
						<td>
							<input type="text" name="username" maxlength="10" size="20">
						</td>
					</tr>
					<tr>
						<th>EMAIL<mark>*</mark></th>
						<td>
							<input type="email" name="email" maxlength="50" size="20">
						</td>
					</tr>
					<tr class="address">
						<th>우편번호<mark>*</mark></th>
						<td>
							<input type="text" name="zipcode1" maxlength="3" size="3"> -
							<input type="text" name="zipcode2" maxlength="3" size="3">&nbsp;
							<input type="button" class="btns" value="우편번호 검색" onclick="MM_openBrWindow('zipcodeSearch.jsp', 'zipcodesearch', 'scrollbars=yes, width=600px, height=600px')">&nbsp;
							<small><font color="red">우편번호 검색 버튼을 누르세요.</font></small>				
						</td>
					</tr>
					<tr class="address">
						<th>주소<mark>*</mark></th>
						<td>
							<input type="text" name="address1" maxlength="100" size="50">&nbsp;
						</td>
					</tr>
					<tr>
						<th>나머지 주소<mark>*</mark></th>
						<td>
							<input type="text" name="address2" maxlength="100" size="50">
							<small><font color="red">나머지 주소를 입력하세요.</font></small>
						</td>
					</tr>
					<tr>
						<th class="phone_row">전화번호<mark>*</mark></th>
						<td class="phone_row">
							<select name="phone1" style="width:82px; height:32px; font-size: 15px; border: 1px solid black;">
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select> - 
							<input type="text" name="phone2" maxlength="4" size="4"> - 
							<input type="text" name="phone3" maxlength="4" size="4">
						</td>
					</tr>
					<tr class="end_row">
						<th colspan="2">
							<input type="hidden" name="userid_check">
							<input type="submit" class="btns" value="확인">&nbsp;
							<input type="reset" class="btns" value="다시쓰기" >&nbsp;
							<input type="button" class="btns" value="취소" onclick="history.back()">
						</th>
					</tr>
				</table>
			</form>
			</div>
		</div>
		<script src="./js/joinForm.js"></script> 
		<!--  body의 document.body.offsetWidth 값과 height 값을 가져오기 위해 body아래에서 script문 실행 -->
	</section>
	<%@ include file="../module/bottom.jsp" %>
</div>
</body>
</html>