function check() {
	var form = document.reviewwrite;
	
	if(form.name.value.length == 0) {
		alert("이름을 입력해 주세요!")
		form.name.focus();
		return false;
	}
	
	if(form.subject.value.length == 0) {
		alert("제목을 입력해 주세요!")
		form.subject.focus();
		return false;
	}
	
	if(form.content.value.length == 0) {
		alert("내용을 입력해 주세요!")
		form.content.focus();
		return false;
	}
	
	form.submit();
}