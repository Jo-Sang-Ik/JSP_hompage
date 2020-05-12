function checkEnd() { // 중복확인 후 반영되게하는것
	var form = document.id_check;
	opener.join.userid.value = form.userid.value; // opener : 현재창을 띄운 페이지(이전 페이지) 
	opener.join.userid_check.value = form.check_count.value;
	self.close();
}

function doCheck() { 
	var form = document.id_check;
	if(!checkValue(form.userid, '아이디', 5, 16)) {
		return;
	}
	form.submit();
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