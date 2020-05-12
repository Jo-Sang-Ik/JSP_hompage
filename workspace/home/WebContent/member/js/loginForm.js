

function login_check() {
	var form = document.login;
	
	if(!form.userid.value) {
		alert("아이디를 입력해주세요!");
		return;
	}
	
	if(!form.password.value) {
		alert("비밀번호를 입력해주세요!");
		retur
	}
	form.submit();
}