function check() {
	form = document.msgwrite;
	
	if(form.subject.value.length == 0) {
		alert("제목을 입력해 주세요!!");
		form.subject.focus();
		return;
	}

	if(form.email.value.length == 0) {
		alert("이메일을을 입력해 주세요!!");
		form.email.focus();
		return;
	}
	
	if(form.name.value.length == 0) {
		alert("이름을 입력해 주세요!!");
		form.subject.focus();
		return;
	}
	
	if(form.password.value.length == 0) {
		alert("비밀번호를 입력해 주세요!!");
		form.password.focus();
		return;
	}
	
	if(form.content.value.length == 0) {
		alert("내용을 입력해 주세요!!");
		form.content.focus();
		return;
	}
	
	form.submit();
}