Pace.on('done', function() {
    console.log('main.js ready!');

    $('.loading_resources').css('height', '0%');


    var swiper = new Swiper('.call_backs', {
        nextButton: '.slider-button-next',
        prevButton: '.slider-button-prev',
        // pagination: '.swiper-pagination',
        // paginationClickable: true,
        // Disable preloading of all images
        preloadImages: false,
        // Enable lazy loading
        autoplay: 5000,
        slidesPerView: 3,
        spaceBetween: 70,
        lazyLoading: true,
        // breakpoints: {
        //     1440: {
        //         slidesPerView: 3,
        //         spaceBetween: 70
        //     },
        //     1024: {
        //         slidesPerView: 2,
        //         spaceBetween: 70
        //     },
        //     768: {
        //         slidesPerView: 1,
        //         spaceBetween: 70
        //     },
        //     // 640: {
        //     //     slidesPerView: 2,
        //     //     spaceBetween: 20
        //     // },
        //     // 320: {
        //     //     slidesPerView: 1,
        //     //     spaceBetween: 10
        //     // }
        // }
    });

    var swiper2 = new Swiper('.testimonials-container', {
        nextButton: '.slider2-button-next',
        prevButton: '.slider2-button-prev',
        slidesPerView: 1,
        paginationClickable: true,
        autoplay: 5000,
        effect: 'flip',
        spaceBetween: 30
    });


    // подняться наверх
    var scrollDiv = $("#totop");
    $(scrollDiv).click(function() {
        jQuery("html:not(:animated),body:not(:animated)").animate({ scrollTop: 0 }, 1000, 'easeInOutExpo');
    });



    var scrollDiv2 = $(".arrow_bottom");
    $(scrollDiv2).click(function() {
        jQuery("html:not(:animated),body:not(:animated)").animate({ scrollTop: $(".main_width").offset().top }, 1000, 'easeOutQuad');
    });





    // $('.category_wr').packery({
    //     // options...
    //     itemSelector: '.category_item',
    //     gutter: 11
    // });

    $('.cert_list').packery({
        // options...
        itemSelector: '.cert_list_item',
        gutter: 20
    });

    // $(document).bind('mousewheel', function(e) {
    //     var nt = $(document.body).scrollTop() - (e.originalEvent.wheelDeltaY);
    //     e.preventDefault();

    //     $(document.body).stop().animate({
    //         scrollTop: nt
    //     }, 300);
    // });

    // скрываем меню при скроле вниз
    var menuoffsettop = $(".top_nav_wr").offset().top;
    $(window).scroll(function() {
        if ($(window).scrollTop() > menuoffsettop) {
            $(".top_nav_wr").css({
                "top": "-90px"
            });

        } else {
            $(".top_nav_wr").css({
                "top": "0"
            });

        }
    });

    // показываем меню после #showmenuhere
    var waypoint = new Waypoint({
        element: document.getElementById('showmenuhere'),
        handler: function(direction) {
            if (direction == 'down') {
                $(".top_nav_wr").addClass("top_nav__fixed");
            } else if (direction == 'up') {
                $(".top_nav_wr").removeClass("top_nav__fixed");
            }
        }
    });



    // var s = skrollr.init({
    //     smoothScrolling: true
    // });



    var s = skrollr.init();

    $('.callback_block_trigger').click(function() {
        $('.callback_block').toggleClass('callback_block_expand');
    });

});
