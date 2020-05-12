function view(fileurl) {
	var fileurl = fileurl;
	window.open(fileurl, "확대보기", "width=450px, height=350px, toolbar=0, menubar=0, scrollbars=1, resizable=1, status=0");
}

function check() {
	var form = document.productform;
	
	if(form.wname.value.length == 0) {
		alert("작성자를 입력해 주세요!");
		form.wname.focus();
		return false;
	}
	
	if(form.pname.value.length == 0) {
		alert("상품명을 입력해 주세요!");
		form.pname.focus();
		return false;
	}
	
	if(form.sname.value.length == 0) {
		alert("제조사를 입력해 주세요!");
		form.sname.focus();
		return false;
	}
	
	if(form.price.value.length == 0) {
		alert("정가를 입력해 주세요!");
		form.price.focus();
		return false;
	}
	
	if(form.downprice.value.length == 0) {
		alert("판매가를 입력해 주세요!");
		form.downprice.focus();
		return false;
	}
	
	if(form.stock.value.length == 0) {
		alert("입고수량을 입력해 주세요!");
		form.stock.focus();
		return false;
	}
	
	if(form.small.value.length == 0) {
		alert("작은이미지를 선택해 주세요!");
		return false;
	}
	
	form.submit();
}