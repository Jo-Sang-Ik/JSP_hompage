// JavaScript Document

// GNB 컨트롤
// 현재 스크롤바의 위치를 저장하는 변수 (px)
var currentScrollTop = 0;
// 비동기식 jQuery이므로 window load 후 jQuery를 실행해야 함
window.onload = function() {
    // 새로고침 했을 경우를 대비한 메소드 실행
    
	scrollController();
	// 스크롤을 하는 경우에만 실행됨
	$(window).on('scroll', function() {
		scrollController();
	});
}
	 
// 메인 메뉴의 위치를 제어하는 함수
function scrollController() {
    currentScrollTop = $(window).scrollTop();
    $("#header")
	if (currentScrollTop < 5) {
        $(".top_login").css("display", "block");
        $("header").css("paddingTop", 30);
        $("#submenu_nav").css("top", 91);
	} else {
        $('.top_login').css('display', "none");
        $("header").css("paddingTop", 0);
        $("#submenu_nav").css("top", 61);
    }
}