  /* 불투명 배경 레이어 뛰우기 */
    function opacity_bg_layer() {
        if (!$('.opacity_bg_layer').length) {
            $('<div class="opacity_bg_layer"></div>').appendTo($('body'));
        }
        var oj = $(".opacity_bg_layer");
        // 화면의 가로, 세로 알아내기
        var w = $(document).width();
        var h = $(document).height();
        oj.css({
            'width': w,
            'height': h
        }); // 불투명 배경 레이어 크기 설정
        oj.fadeIn(500); // 불투명 배경 레이어 보이기 속도
    }

    /* 레이어 생성
    cls : class
    cont : 내용
    기본 : 숨기기
    */
    function layer_pop_crt(cls, cont) {
        if (!cls) return false;
        if (!$(cls).length) {
            $('<div class="' + cls + '">' + cont + '</div>').appendTo($('body'));
        }
        return true;
    }

    /* 레이어 띄우기
    oj : 레이어 객체
    */
    function layer_pop_center(oj) {
        if (!oj.length) return false;
        oj.layer_pop_center_set();
    }

    /* 레이어 팝업 위치 설정 */
    $.fn.layer_pop_center_set = function() {
        //this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
        //this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
        this.css("top", ($(window).height() - $(this).outerHeight()) / 2);
        this.css("left", ($(window).width() - $(this).outerWidth()) / 2);
        return this;
    }

    /* 레이어 닫기 후 삭제
    oj : 레이어 객체
    */
    function layer_pop_close(oj) {
        if (oj.length) {
            oj.fadeOut(500, function() {
                oj.remove();
            });
        }
        // 불투명 배경 레이어 삭제
        var oj = $('.opacity_bg_layer');
        if (oj.length) {
            oj.fadeOut(500, function() {
                oj.remove();
            });
        }
    }

    /* 화면을 불러온 후 처리 */
    $(document).ready(function() {
        var ly = 'layer_pop_center';
        var _ly;
        var ly_bg = $('.opacity_bg_layer');
        $(document).on('click', '.layer_pop_center_show', function() { // 레이어 팝업 띄우기
            if (!ly_bg.length) opacity_bg_layer(); // 불투명 배경 레이어 띄우기
            var str_html = "\
            <div class='modal_header'>\
            	<span>\
            		<span class='modal_title'>로그인</span>\
            		<a href='#' class='modal_close'>X</a>\
            	</span>\
            </div>\
            <div class='modal_body'>\
	            <a href='#' onclick='loginFB();'><img class='facebook' src='/resources/common/images/login_facebook.png'></img></a>\
	            <a href='#' id='customBtn'><img class='google' src='/resources/common/images/login_google.png' data-onsuccess='onSignIn'></img></a><script>startApp()</script>\
            </div>\
            	"; // 레이어 팝업 내용
            if (layer_pop_crt(ly, str_html)) {
                _ly = $('.' + ly); // 레이어 팝업 생성 후 재 선언
                layer_pop_center(_ly);
                _ly.fadeIn(500);
            } else {
                if (ly_bg.length) ly_bg.remove();
            }
        }).on('click', '.opacity_bg_layer', function() { // 불투명 배경 레이어를 클릭하면 닫기
            layer_pop_close(_ly);
        }).on('click', '.modal_close', function(e) { // 레이어 팝업 닫기
            if (_ly.length) layer_pop_close(_ly);
        });
    });

    // 브라우저 창 크기 변경에 따른 처리
    $(window).resize(function() {
        var oj = $('.layer_pop_center');
        if (oj.length) layer_pop_center(oj); // 레이어 팝업이 실행된 상태에서만 진행
        if ($('.opacity_bg_layer').length) opacity_bg_layer(); // 불투명 배경 레이어가 실행된 상태에서만 진행
    });