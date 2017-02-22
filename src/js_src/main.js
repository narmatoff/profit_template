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
        autoplay:5000,
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
        autoplay:5000,
        effect:'flip',
        spaceBetween: 30
    });


    // подняться наверх
    var scrollDiv = $("#totop");
    scrollDiv.click(function() {
        $("html, body").animate({ scrollTop: 0 }, "slow");
    });
    var scrollDiv2 = $(".arrow_bottom__header");
    scrollDiv2.click(function() {
        $("html, body").animate({ scrollTop: 770 }, "slow");
    });


    $('.category_wr').packery({
        // options...
        itemSelector: '.category_item',
        gutter: 11
    });

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

    var s = skrollr.init({
        smoothScrolling: true
    });
});
