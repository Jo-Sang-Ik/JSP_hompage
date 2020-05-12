$(document).ready(function() {
	// 작은 이미지를 클릭했을 때 큰 이미지를 변환

	// 1-1. 큰 이미지, 작은 이미지의 클래스를 변수로 저장
	var bigPic = document.querySelector(".big_img");
	var smallPics = document.querySelectorAll(".small_img");

	// 1-2. 작은 이미지를 클릭했을 때 이벤트리스너를 통한 이벤트를 발생
	for(var i=0; i<smallPics.length; i++) {
	    smallPics[i].addEventListener("click", changePic)
	}

	// 1-3. 이벤트 함수 작성
	function changePic() {
	    bigPic.src = this.src;
	}
});

function changeQty(n) {
	var form = document.productForm;
	var tot = document.getElementById("total_price");
	
	if(n == -1) { // 감소 이미지를 클릭 했을 때
		if(form.quantity.value == 1) return;
		form.quantity.value--;
	} else if(n == 1) { // 장가 이미지를 클릭했을 때
		form.quantity.value++;
	}
	
	var total = form.quantity.value * form.price.value;
	
	total = total + ""; 
    point = total.length % 3 ;
    len = total.length; 
   
    str = total.substring(0, point); 
    while (point < len) { 
        if (str != "") str += ","; 
        str += total.substring(point, point + 3); 
        point += 3; 
    } 

	tot.innerText = str+"원";
}

function buy(stock) {
	var form = document.productForm;
	var price = form.price.value;
	var quantity = form.quantity.value;
	
	var total = price * quantity;
	var uid = form.uid.value;
	var pid = form.pid.value;
	
	if(quantity <= 0) {
		alert("주문 수량을 1개 이상 입력해주세요.");
		return false; 
	}
	
	if(quantity > stock) {
		alert("주문 수량이 재고량보다 크게 입력되었습니다. 다시한번 확인해 주세요.");
		return false; 
	}

	location="../order/order.jsp?total=" + total + "&qty="+ quantity +"&productcount=1&uid=" + uid + "&pid=" + pid + "&mode=direct";
}
