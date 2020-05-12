// 수정 버튼을 눌러서 주문수량 조정할 때
function cartUpdate(form) {
	var qty = form.quantity;
	var stock = form.stock;
	var cart_pname = form.cart_pname;
	
	// 마지막에 주문수량과 재고량을 체크해 주문수량이 더 많으면 재고량으로
	if (parseInt(qty.value) > parseInt(stock.value)) {
		alert("현재 "+cart_pname.value+" 상품의 재고량은 "+stock.value+" 개 입니다.\n재고량보다 주문수량을 작게 입력해주세요");
		qty.value = stock.value;
	}
	
	// 주문수량 최소 값 설정
	if (parseInt(qty.value) < 1) {
		alert("주문수량은 1개 이상 입력해주세요");
		qty.value = 1;
	}
	
	form.submit();
}

// +, - 버튼을 눌러서 주문수량 조정할 때
function changeQty(form, n) {
	var qty = form.quantity;
	var stock = form.stock;
	var cart_pname = form.cart_pname;
	
	if (n == -1) { // 감소 이미지를 클릭 했을 때
		qty.value--;
	} else if (n == 1) { // 증가 이미지를 클릭했을 때
		qty.value++;
	}
	
	// 마지막에 주문수량과 재고량을 체크해 주문수량이 더 많으면 재고량으로
	if (parseInt(qty.value) > parseInt(stock.value)) {
		alert("현재 "+cart_pname.value+"상품의 재고량은 "+stock.value+" 개 입니다.\n재고량보다 주문수량을 작게 입력해주세요");
		qty.value = stock.value;
	}
	
	// 주문수량 최소 값 설정
	if (parseInt(qty.value) < 1) {
		alert("주문수량은 1개 이상 입력해주세요");
		qty.value = 1;
	}
	
	form.submit();
	
}
