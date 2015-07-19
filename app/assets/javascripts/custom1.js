
jQuery(function() {
	var _scroll = {
		delay: 1000,
		easing: 'linear',
		items: 1,
		duration: 0.07,
		timeoutDuration: 0,
		pauseOnHover: 'immediate'
	};
	jQuery('.ticker-1').carouFredSel({
		width: 1000,
		align: false,
		items: {
			width: 'variable',
			height: 40,
			visible: 1
		},
		scroll: _scroll
	});

	//	set carousels to be 100% wide
	jQuery('.caroufredsel_wrapper').css('width', '100%');
});

jQuery(window).load(function () {
    jQuery('.home-slider').flexslider({
        animation: "slide",
        start: function (slider) {
            jQuery('body').removeClass('loading');
        }
    });

    jQuery('.entry-thumb-slider').flexslider({
        animation: "slide",
        start: function (slider) {
            jQuery('body').removeClass('loading');
        }
    });

    jQuery('.gallery-slider').flexslider({
        animation: "slide",
        start: function (slider) {
            jQuery('body').removeClass('loading');
        }
    });

    jQuery('.kopa-single-slider').flexslider({
        animation: "slide",
        start: function (slider) {
            jQuery('body').removeClass('loading');
        }
    });

});

jQuery(window).load(function () {

    jQuery('.kp-gallery-carousel').flexslider({
        animation: "slide",
        controlNav: false,
        slideshow: false,
        itemWidth: 149,
        itemMargin: 6,
        asNavFor: '.kp-gallery-slider'
    });

    jQuery('.kp-gallery-slider').flexslider({
        animation: "slide",
        controlNav: false,
        slideshow: false,
        sync: ".kp-gallery-carousel",
        start: function (slider) {
            jQuery('body').removeClass('loading');
        }
    });
});

