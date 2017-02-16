Pace.on('done', function() {
    console.log('main.js');
    var swiper = new Swiper('.swiper-container', {
        nextButton: '.slider-button-next',
        prevButton: '.slider-button-prev',
        // pagination: '.swiper-pagination',
        // paginationClickable: true,
        // Disable preloading of all images
        preloadImages: false,
        // Enable lazy loading
        slidesPerView: 3,
        spaceBetween: 70,
        lazyLoading: true
        // breakpoints: {
        //     1024: {
        //         slidesPerView: 4,
        //         spaceBetween: 40
        //     },
        //     768: {
        //         slidesPerView: 3,
        //         spaceBetween: 30
        //     },
        //     640: {
        //         slidesPerView: 2,
        //         spaceBetween: 20
        //     },
        //     320: {
        //         slidesPerView: 1,
        //         spaceBetween: 10
        //     }
        // }
    });
});
