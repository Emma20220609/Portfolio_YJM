/**
 * 
 */
jQuery(document).ready(function($){

	//gnb
	$(".gnb > li").on("mouseenter focusin", function(){
		$("#wrap").removeClass("transp");
		if ($(this).find(".gsnb").length > 0) {
			$(this).addClass("on").find(".gsnb").height(55);
			$(".h_inner").stop().animate({paddingBottom:55}, 200,'easeInOutQuint');
		}
	});

	$(".gnb > li").on("mouseleave focusout", function(){
		$("#wrap.main").addClass("transp");
		$(this).removeClass("on").find(".gsnb").height(0);
		$(".h_inner").stop().animate({paddingBottom:0}, 200);
	});
});


//페이지 맨 위로 보내기
function goPageTop(){
	$("html, body").stop().animate({scrollTop:0}, 1200, 'easeOutQuint');
}


function slick_start_func(){
	$(".f_insta").slick({
		variableWidth:true,
		centerMode:true,
		slidesToShow:5,
		slidesToScroll:5,
		swipe:true,
		arrows:false
	});
}