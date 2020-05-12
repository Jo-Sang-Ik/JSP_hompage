function check() {
	form = document.msgdel;
	
	if(form.password.value.length == 0) {
		alert("비밀번호를 입력해주세요!!!");
		form.password.focus();
		return;
	}
	
	form.submit();
}