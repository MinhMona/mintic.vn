jQuery(document).ready(function($){
    new WOW().init();

    $('.tab-wrapper').each(function() {
        let $tabWrapper, $tabID;
		$tabWrapper = $(this);
		$tabID = $tabWrapper.find('.tab-link.current').attr('data-tab');
        $tabWrapper.find($tabID).fadeIn().siblings().hide();
        $($tabWrapper).on('click', '.tab-link', function(e){
            e.preventDefault();
			$tabID = $(this).attr('data-tab');
			$(this).addClass('current').siblings().removeClass('current');
			$tabWrapper.find($tabID).fadeIn().siblings().hide();
        });
    });

    $('.main-menu-btn').on('click', function(){
        $(this).addClass('active');
        $('.main-menu').addClass('active');
    });

    $('.main-menu-overlay').on('click', function(){
        $('.main-menu-btn').removeClass('active');
        $('.main-menu').removeClass('active');
    });

    if ($('.scroll-top').length) {
		$(window).scroll(function() {
			$(this).scrollTop() > 100 ? $('.scroll-top').addClass('show') : $('.scroll-top').removeClass('show');
		});
		$('.scroll-top').on('click', function(){
			$('html, body').animate({ scrollTop: 0 }, 'slow');
		});
    };

    $(window).scroll(function () {
        var scroll = $(window).scrollTop();
        if (scroll >= 10) {
            $(".header").addClass("header-fixed");
        } else {
            $(".header").removeClass("header-fixed");
        }
    });
    // $('.services-slider').slick({
    //     dots: false,
    //     arrows: true,
    //     prevArrow: '<span class="main-slide-arrow prev-arrow"><i class="fa fa-angle-left" aria-hidden="true"></i></span>',
    //     nextArrow: '<span class="main-slide-arrow next-arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span>',
    //     infinite: true,
    //     autoplay: true,
    //     autoplaySpeed: 6000,
    //     pauseOnFocus: false,
    //     speed: 1000,
    //     rows: 2,
    //     slidesPerRow: 3,
    //     responsive: [
    //         {
    //             breakpoint: 769,
    //             settings: {
    //                 rows: 2,
    //                 slidesPerRow: 2,
    //                 dots: true,
    //                 arrows: false,
    //             }
    //         },
    //         {
    //             breakpoint: 501,
    //             settings: {
    //                 rows: 2,
    //                 slidesPerRow: 1,
    //                 dots: true,
    //                 arrows: false,
    //             }
    //         },
    //     ]
    // });

    $('.products-slider').slick({
        dots: false,
        arrows: true,
        prevArrow: '<span class="main-slide-arrow prev-arrow"><i class="fa fa-angle-left" aria-hidden="true"></i></span>',
        nextArrow: '<span class="main-slide-arrow next-arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span>',
        infinite: true,
        autoplay: true,
        autoplaySpeed: 6000,
        pauseOnFocus: false,
        speed: 1000,
        rows: 2,
        slidesPerRow: 4,
        responsive: [
            {
                breakpoint: 501,
                settings: {
                    rows: 2,
                    slidesPerRow: 2,
                    dots: true,
                    arrows: false,
                }
            },
        ]
    });

    // $('.reasons-slider').slick({
    //     dots: false,
    //     arrows: true,
    //     prevArrow: '<span class="main-slide-arrow prev-arrow"><i class="fa fa-angle-left" aria-hidden="true"></i></span>',
    //     nextArrow: '<span class="main-slide-arrow next-arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span>',
    //     infinite: true,
    //     autoplay: true,
    //     autoplaySpeed: 6000,
    //     pauseOnFocus: false,
    //     speed: 1000,
    //     rows: 2,
    //     slidesPerRow: 4,
    //     responsive: [
    //         {
    //             breakpoint: 769,
    //             settings: {
    //                 rows: 2,
    //                 slidesPerRow: 3,
    //                 dots: true,
    //                 arrows: false,
    //             }
    //         }, 
    //         {
    //             breakpoint: 501,
    //             settings: {
    //                 rows: 2,
    //                 slidesPerRow: 2,
    //                 dots: true,
    //                 arrows: false,
    //             }
    //         },
    //         {
    //             breakpoint: 321,
    //             settings: {
    //                 rows: 2,
    //                 slidesPerRow: 1,
    //                 dots: true,
    //                 arrows: false,
    //             }
    //         },
    //     ]
    // });

    $('.partners-slider').slick({
        dots: false,
        arrows: true,
        prevArrow: '<span class="main-slide-arrow prev-arrow"><i class="fa fa-angle-left" aria-hidden="true"></i></span>',
        nextArrow: '<span class="main-slide-arrow next-arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span>',
        infinite: true,
        autoplay: true,
        autoplaySpeed: 6000,
        pauseOnFocus: false,
        speed: 1000,
        slidesToShow: 4,
        slidesToScroll: 1,
        responsive: [
            {
                breakpoint: 769,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1,
                    dots: true,
                    arrows: false,
                }
            }, 
            {
                breakpoint: 501,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1,
                    dots: true,
                    arrows: false,
                }
            },
        ]
    });

    $('.main-menu-nav .dropdown > a').append('<i class="fa fa-angle-down" aria-hidden="true"></i>');
    $('.main-menu-nav .dropdown > a > .fa').on('click', function(e){
        e.preventDefault();
        $(this).closest('.dropdown').find('> .sub-menu-wrap').stop().slideToggle();
    });

    $(".acc-info-btn").on('click', function(e){
        e.preventDefault();
		$(".status-mobile").addClass("open");
		$(".overlay-status-mobile").show();
    });
    
	$(".overlay-status-mobile").on('click', function(){
		$(".status-mobile").removeClass("open");
		$(this).hide();
    });

    $(window).on('load resize', function(){
        const $header = $('.header')
        const $headerOffet = $header.offset().top;
        const $headerHeight = $header.outerHeight();
        const $main = $('.main');
        if($(window).scrollTop() > $headerOffet){
            $header.addClass('fixed');
            $main.css('margin-top', $headerHeight);
        }
        else{
            $header.removeClass('fixed')
            $main.css('margin-top', '');
        }
        $(window).on('scroll', function(){
            if($(window).scrollTop() > $headerOffet){
                $header.addClass('fixed');
                $main.css('margin-top', $headerHeight);
            }
            else{
                $header.removeClass('fixed')
                $main.css('margin-top', '');
            }
        });
    })
});