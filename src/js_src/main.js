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





    // Модальные окна
    /////////////////////////////////////////////////////////////////////////////////////////////////////
    // Галерея картинок
    $('.magnific_gallery').each(function() { // the containers for all your galleries
        $(this).magnificPopup({
            delegate: 'a', // the selector for gallery item
            type: 'image',
            gallery: {
                enabled: true
            },
            mainClass: 'mfp-with-zoom', // this class is for CSS animation below

            zoom: {
                enabled: true, // By default it's false, so don't forget to enable it

                duration: 300, // duration of the effect, in milliseconds
                easing: 'ease-in-out', // CSS transition easing function

                // The "opener" function should return the element from which popup will be zoomed in
                // and to which popup will be scaled down
                // By defailt it looks for an image tag:
                opener: function(openerElement) {
                    // openerElement is the element on which popup was initialized, in this case its <a> tag
                    // you don't need to add "opener" option if this code matches your needs, it's defailt one.
                    return openerElement.is('img') ? openerElement : openerElement.find('img');
                }
            }
        });
    });

    // всплывающие картинки
    $('.magnific_img').magnificPopup({
        // delegate: 'a', // the selector for gallery item
        type: 'image',
        image: {
            markup: '<div class="mfp-figure">' +
                '<div class="mfp-close"></div>' +
                '<div class="mfp-img"></div>' +
                // '<div class="mfp-bottom-bar">' +
                // '<div class="mfp-title"></div>' +
                // '<div class="mfp-counter"></div>' +
                '</div>' +
                '</div>', // Popup HTML markup. `.mfp-img` div will be replaced with img tag, `.mfp-close` by close button

            cursor: 'mfp-zoom-out-cur', // Class that adds zoom cursor, will be added to body. Set to null to disable zoom out cursor.

            // titleSrc: 'title', // Attribute of the target element that contains caption for the slide.
            // Or the function that should return the title. For example:
            // titleSrc: function(item) {
            //   return item.el.attr('title') + '<small>by Marsel Van Oosten</small>';
            // }

            verticalFit: true, // Fits image in area vertically

            tError: '<a href="%url%">Изображение</a> не открывается.' // Error message
        },
        gallery: {
            enabled: true
        }
    });


    $(":input").inputmask();

    // $('.inputmask_phone').inputmask({ "mask": "+7 (999) 999-99-99" }); //specifying options
    // $(selector).inputmask("99-9999999"); //static mask
    // $(selector).inputmask("9-a{1,3}9{1,3}"); //mask with dynamic syntax

});
