/* 	$(document).ready(function() {
		$("header").mouseenter(function() {
			$("#submenu_nav").slideDown(100);
		});
		$("header").mouseleave(function() {
			$("#submenu_nav").slideUp(100);
		});
	}); */

function check() {
	var form = document.order_form;
	
	if(form.name.value == "") {
		form.name.focus();
		alert("주문자 이름을 입력해주세요.");
		return false;
	}
	
	if(form.pay.value == "card" && form.cardno.value == "") {
		form.cardno.focus();
		alert("카드 번호를 입력해주세요.");
		return false;
	}
	
	if(form.address.value == "") {
		form.address.focus();
		alert("배송 주소를 입력해주세요.");
		return false;
	}
	
	if(form.tel.value == "") {
		form.tel.focus();
		alert("전화번호를 입력해주세요.");
		return false;
	}
	
	form.submit();
}

function payClick() {
	var form = document.order_form;
	
	if(form.pay.value == "cash") {
	form.cardno.value = "";
	form.cardno.disabled = true;
	}
	
	if(form.pay.value == "card") {
			form.cardno.disabled = false;
		}
}