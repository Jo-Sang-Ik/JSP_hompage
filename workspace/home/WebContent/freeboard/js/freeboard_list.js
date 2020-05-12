function check() {
	form = document.msgsearch;
	
	if(form.sval.value.length == 0) {
		alert("검색어를 입력해 주세요.");
		form.sval.focus();
		return;
	}
	
	form.submit();
}


// 댓글에 대한 이미지 변환
function rimg_change(p1, p2) {
	if(p2 == 1) 
		document.images[p1].src = "image/open.gif";
	else 
		document.images[p1].src = "images/arrow.gif";
}

// 원글에 대한 이미지 변환
function img_change(p1, p2) {
	if(p2 == 1) 
		document.images[p1].src = "image/open.gif";
	else 
		document.images[p1].src = "images/close.gif";
}