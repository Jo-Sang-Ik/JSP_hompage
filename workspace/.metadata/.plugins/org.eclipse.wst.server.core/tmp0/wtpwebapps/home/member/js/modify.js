var xValue = window.screen.width;
var yValue = window.screen.height;

var popupX = (xValue / 2) - (600 / 2);
//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

var popupY= (yValue / 2) - (800 / 2);
//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

function MM_openBrWindow(theURL, winName, features) {
	window.open(theURL, winName, features+",left="+popupX+",top="+popupY);
}

function checkValue(target, cmt, lmin, lmax) {
	var Alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	var Digit = "1234567890";
	var astr = Alpha + Digit;
	var i;
	var tValue = target.value;
	if(tValue.length < lmin || tValue.length > lmax) {
		if(lmin == lmax) alert(cmt + "는 " + lmin + "Byte이어야 합니다."); // lmin값과 lmax값을 같게 줬을때 경고 메시지
		else alert(cmt + "는 " + lmin + "~" + lmax + "Byte 이내로 입력하셔야 합니다."); // 범위로 설정해줄때 실행하는 코드
		
		target.focus();
		return false;
	}
	if(astr.length > 1) {
		for(var i=0; i<tValue.length; i++) { // 반드시 들어와서
			if(astr.indexOf(tValue.substring(i, i+1)) < 0){ // tValue값을 하나씩 잘라서 astr에 있는지 확인(인덱스찾음) 없으면 인덱스가 없는거라서 true로 진행 
				alert(cmt + "에 허용할 수 없는 문자가 입력되었습니다.");
				
				target.focus();
				return false;
			}
		}
	}
	
	return true;
}

function pwdCheck() {
	var form = document.join;
	
	if(form.password.value == form.password2.value) {
		document.querySelector("#pwdCheckCircle").style.background = "green";
	} else {
		document.querySelector("#pwdCheckCircle").style.background = "red";
	}
}
	


function doSubmit() {
	var form = document.join;
	
	if(!form.username.value) {
		alert("이름을 입력해 주세요.");
		form.username.focus();
		return;
	}
	
	if(!form.password.value) {
		alert("비밀번호를 입력해 주세요.");
		form.password.focus();
		return;
	}
	
	if(form.password.value != form.password2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.password.value ="";
		form.password2.value ="";
		form.password.focus();
		return;
	}
	
	if(form.userid.value == form.password.value) {
		alert("아이디와 비밀번호를 서로 다르게 입력하세요!");
		form.password.value ="";
		form.password2.value ="";
		form.password.focus();
		return;
	}
	
	if(!checkValue(form.password, '비밀번호', 4, 12)) {
		return;
	}
	
	if(!form.email.value) {
		alert("이메일을 입력해 주세요!");
		form.email.focus();
		return;
	}
	
	if(form.email.value.indexOf("@") < 0) {
		alert("이메일 주소 형식이 틀립니다.");
		form.email.focus();
		return
	}
	
	if(form.email.value.indexOf(".") < 0) {
		alert("이메일 주소 형식이 틀립니다.");
		form.email.focus();
		return
	}
	
	if(!form.zipcode1.value || !form.zipcode2.value) {
		alert("우편번호를 입력해 주세요.");
		MM_openBrWindow("zipcodeSearch.jsp", "zipcode_search", "scrollbars=yes, width=600px, height=600px")
		form.zipcode1.focus();
		return;
	}
	
	if(!form.address1.value) {
		alert("주소1을 입력해 주세요.");
		MM_openBrWindow("zipcodeSearch.jsp", "zipcode_search", "scrollbars=yes, width=600px, height=600px")
		form.address1.focus();
		return;
	}
	
	if(!form.address2.value) {
		alert("주소2을 입력해 주세요.");
		form.address2.focus();
		return;
	}
	
	
	if(!form.phone1.value || !form.phone2.value || !form.phone3.value) {
		alert("전화번호를 입력해 주세요.");
		form.phone2.focus();
		return;
	}
	
	form.submit();
}