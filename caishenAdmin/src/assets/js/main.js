(function($) {
    "use strict";

    /*-------------------------------------
	Background image
	-------------------------------------*/
    $("[data-bg-image]").each(function() {
        var img = $(this).data("bg-image");
        $(this).css({
            backgroundImage: "url(" + img + ")"
        });
    });

    /*-------------------------------------
    After Load All Content Add a Class
    -------------------------------------*/
    window.onload = addNewClass();

    function addNewClass() {
        $('.fxt-template-animation').imagesLoaded().done(function(instance) {
            $('.fxt-template-animation').addClass('loaded');
        });
    }

    /*-------------------------------------
    Toggle Class
    -------------------------------------*/
    $(".toggle-password").on('click', function() {
        $(this).toggleClass("fa-eye fa-eye-slash");
        var input = $($(this).attr("toggle"));
        if (input.attr("type") == "password") {
            input.attr("type", "text");
        } else {
            input.attr("type", "password");
        }
    });

    /*-------------------------------------
    Youtube Video
    -------------------------------------*/
    if ($.fn.YTPlayer !== undefined && $("#fxtVideo").length) {
        $("#fxtVideo").YTPlayer({ useOnMobile: true });
    }

    /*-------------------------------------
    Vegas Slider
    -------------------------------------*/
    if ($.fn.vegas !== undefined && $("#vegas-slide").length) {
        var target_slider = $("#vegas-slide"),
            vegas_options = target_slider.data('vegas-options');
        if (typeof vegas_options === "object") {
            target_slider.vegas(vegas_options);
        }
    }

    /*-------------------------------------
    OTP Form (Focusing on next input)
    -------------------------------------*/
    $("#otp-form .otp-input").keyup(function() {
        if (this.value.length == this.maxLength) {
            $(this).next('.otp-input').focus();
        }
    });

    /*-------------------------------------
	Social Animation
	-------------------------------------*/
    $('#fxt-login-option >ul >li').hover(function() {
        $('#fxt-login-option >ul >li').removeClass('active');
        $(this).addClass('active');
    });

    /*-------------------------------------
    Preloader
    -------------------------------------*/
    $('#preloader').fadeOut('slow', function() {
        $(this).remove();
    });

})(jQuery);
$(function() {

  'use strict';

  $('.js-menu-toggle').click(function(e) {

  	var $this = $(this);

  	

  	if ( $('body').hasClass('show-sidebar') ) {
  		$('body').removeClass('show-sidebar');
  		$this.removeClass('active');
  	} else {
  		$('body').addClass('show-sidebar');	
  		$this.addClass('active');
  	}

  	e.preventDefault();

  });

  // click outisde offcanvas
	$(document).mouseup(function(e) {
    var container = $(".sidebar");
    if (!container.is(e.target) && container.has(e.target).length === 0) {
      if ( $('body').hasClass('show-sidebar') ) {
				$('body').removeClass('show-sidebar');
				$('body').find('.js-menu-toggle').removeClass('active');
			}
    }
	}); 

    

});