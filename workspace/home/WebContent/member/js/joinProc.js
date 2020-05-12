function doSubmit() {
	form = document.join;
	if(!form.userid.value) {
		alert("아이디를 입력하지 않았습니다.");
		form.userid.focus();
		return;
	}
	form.submit();
}