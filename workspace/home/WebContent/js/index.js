$(document).ready(function() {

// ************************ 메인 슬라이더 ************************
	$('#banner_main').touchSlider({
		autoplay: {
			enable: true,
			pauseHover: true,
			addHoverTarget: '', // 다른 오버영역 추가 ex) '.someBtn, .someContainer'
			interval: 5000
		},
		
		controls: false,
		paging: false,
		speed: 2000,
		
		btn_prev: $('#banner_main').next().find('.banner_prev'),
		btn_next: $('#banner_main').next().find('.banner_next'),
		initComplete: function(e) {
			var _this = this;
			var paging = '';
			var len = Math.ceil(this._len / this._view);
	
			for(var i = 1; i <= len; i++) {
				paging += '<span class="banner_page"></span>';
			}
	
			$(this).next().find('.banner_paging').html(paging).find('.banner_page').on('click', function(e) {
				_this.go_page($(this).index());
			});
		},
		
		counter: function(e) {
			$(this).next().find('.banner_page').removeClass('on').eq(e.current-1).addClass('on');
		}
	});

// ************************ 인기상품 슬라이더 ************************
	$('#popular_product_touchslider').touchSlider({
		autoplay: {
			enable: true,
			pauseHover: true,
			addHoverTarget: '', // 다른 오버영역 추가 ex) '.someBtn, .someContainer'
			interval: 5000
		},
		
		controls: false,
		paging: false,
		speed: 1000,
		btn_prev: $('#popular_product_touchslider').next().find('.popular_product_prev'),
		btn_next: $('#popular_product_touchslider').next().find('.popular_product_next'),
		initComplete: function(e) {
			var _this = this;
			var paging = '';
			var len = Math.ceil(this._len / this._view);
	
			for(var i = 1; i <= len; i++) {
				paging += '<span class="popular_product_page"></span>';
			}
	
			$(this).next().find('.popular_product_paging').html(paging).find('.popular_product_page').on('click', function(e) {
				_this.go_page($(this).index());
			});
		},
		
		counter: function(e) {
			$(this).next().find('.popular_product_page').removeClass('on').eq(e.current-1).addClass('on');
		}
	});

// ************************ 신상품 슬라이더 ************************
	$('#new_product_touchslider').touchSlider({
		autoplay: {
			enable: true,
			pauseHover: true,
			addHoverTarget: '', // 다른 오버영역 추가 ex) '.someBtn, .someContainer'
			interval: 5000
		},
		
		controls: false,
		paging: false,
		speed: 1000,
		btn_prev: $('#new_product_touchslider').next().find('.new_product_prev'),
		btn_next: $('#new_product_touchslider').next().find('.new_product_next'),
		initComplete: function(e) {
			var _this = this;
			var paging = '';
			var len = Math.ceil(this._len / this._view);
	
			for(var i = 1; i <= len; i++) {
				paging += '<span class="new_product_page"></span>';
			}
	
			$(this).next().find('.new_product_paging').html(paging).find('.new_product_page').on('click', function(e) {
				_this.go_page($(this).index());
			});
		},
		
		counter: function(e) {
			$(this).next().find('.new_product_page').removeClass('on').eq(e.current-1).addClass('on');
		}
	});
	
// ************************ 소품 슬라이더 ************************	
	$('#prop_product_touchslider').touchSlider({
		autoplay: {
			enable: true,
			pauseHover: true,
			addHoverTarget: '', // 다른 오버영역 추가 ex) '.someBtn, .someContainer'
			interval: 5000
		},
		
		controls: false,
		paging: false,
		speed: 1000,
		btn_prev: $('#prop_product_touchslider').next().find('.prop_product_prev'),
		btn_next: $('#prop_product_touchslider').next().find('.prop_product_next'),
		initComplete: function(e) {
			var _this = this;
			var paging = '';
			var len = Math.ceil(this._len / this._view);
	
			for(var i = 1; i <= len; i++) {
				paging += '<span class="prop_product_page"></span>';
			}
	
			$(this).next().find('.prop_product_paging').html(paging).find('.prop_product_page').on('click', function(e) {
				_this.go_page($(this).index());
			});
		},
		
		counter: function(e) {
			$(this).next().find('.prop_product_page').removeClass('on').eq(e.current-1).addClass('on');
		}
	});
	
});