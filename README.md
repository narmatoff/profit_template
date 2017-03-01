### README ###

# Исходники шаблона в папке: #

```
SRC
```

# Файлы для продакшина в папке: #
```
DIST
```

# Используемые зависимости #

* "jquery": "^3.1.1" (http://api.jquery.com/)
* "swiper": "^3.4.1" (http://www.idangero.us/swiper/get-started/)
* "waypoints": "^4.0.1" (http://imakewebthings.com/waypoints/guides/getting-started)
* "skrollr": "scrollr#^0.6.30" (http://travis-ci.org/Prinzhorn/skrollr)
* "jquery.easing": "^1.3.1" (http://gsgd.co.uk/sandbox/jquery/easing/)
* "magnific-popup": "^1.1.0" (https://travis-ci.org/dimsemenov/Magnific-Popup)
* "jquery.inputmask": "^3.3.4" (http://robinherbots.github.io/jquery.inputmask)

## Некоторые инструкции ##

Для плавных якорей до объекта использовать:

```
    var VarNameOfAnchor = $("селекторссылкиякоря");
    $(VarNameOfAnchor).click(function() {
        jQuery("html:not(:animated),body:not(:animated)").animate({ scrollTop: $("селекторобъектаузладомдокторогонеобъодимодобраться").offset().top }, 2000, 'easeInOutExpo');
    });
    ```

Для плавных якорей до объекта использовать:

```
var VarNameOfAnchor = $("селекторссылкиякоря");
$(VarNameOfAnchor).click(function() {
    jQuery("html:not(:animated),body:not(:animated)").animate({ scrollTop: $("селекторобъектаузладомдокторогонеобъодимодобраться").offset().top }, 2000, 'easeInOutExpo');
});
```

Маски для инпутов, пример:

```
<input type="text" data-inputmask="'mask': '+7 (999)-999-99-99'"/>
```

Анимированные блоки при ресайзе вьюпорта

```
$('селекторродителяспискаблоков').packery({
    // options...
    itemSelector: 'селекторэлементасписка',
    gutter: отступвпикселах
});
```

Для галереи всплывающих окон использовать класс для родителя списка

```
.magnific_gallery
```

Для всплывающих окон использовать класс для элемента списка

```
.magnific_img
```