function initMap() {
    var mapOptions = {
        zoom: 13,
        center: {
            lat: 59.972120,
            lng: 30.417012
        },
        scrollwheel: false,
        styles: [{
            "featureType": "all",
            "elementType": "labels",
            "stylers": [{
                "visibility": "off"
            }, {
                "saturation": "15"
            }]
        }, {
            "featureType": "all",
            "elementType": "labels.text.fill",
            "stylers": [{
                "saturation": 36
            }, {
                "color": "#333333"
            }, {
                "lightness": 40
            }, {
                "visibility": "on"
            }]
        }, {
            "featureType": "all",
            "elementType": "labels.text.stroke",
            "stylers": [{
                "visibility": "off"
            }, {
                "color": "#d41d1d"
            }, {
                "lightness": 16
            }]
        }, {
            "featureType": "all",
            "elementType": "labels.icon",
            "stylers": [{
                "visibility": "off"
            }]
        }, {
            "featureType": "administrative",
            "elementType": "geometry.fill",
            "stylers": [{
                "color": "#fefefe"
            }, {
                "lightness": 20
            }]
        }, {
            "featureType": "administrative",
            "elementType": "geometry.stroke",
            "stylers": [{
                "color": "#fefefe"
            }, {
                "lightness": 17
            }, {
                "weight": 1.2
            }]
        }, {
            "featureType": "administrative.country",
            "elementType": "geometry.fill",
            "stylers": [{
                "color": "#ffffff"
            }]
        }, {
            "featureType": "administrative.country",
            "elementType": "geometry.stroke",
            "stylers": [{
                "color": "#e1e1e1"
            }]
        }, {
            "featureType": "administrative.province",
            "elementType": "geometry.fill",
            "stylers": [{
                "color": "#ff0000"
            }]
        }, {
            "featureType": "administrative.province",
            "elementType": "labels",
            "stylers": [{
                "visibility": "simplified"
            }, {
                "color": "#c7c7c7"
            }]
        }, {
            "featureType": "administrative.locality",
            "elementType": "geometry.fill",
            "stylers": [{
                "color": "#ffffff"
            }]
        }, {
            "featureType": "administrative.locality",
            "elementType": "labels",
            "stylers": [{
                "visibility": "simplified"
            }]
        }, {
            "featureType": "administrative.neighborhood",
            "elementType": "labels",
            "stylers": [{
                "visibility": "off"
            }]
        }, {
            "featureType": "administrative.land_parcel",
            "elementType": "labels",
            "stylers": [{
                "visibility": "simplified"
            }]
        }, {
            "featureType": "landscape",
            "elementType": "geometry",
            "stylers": [{
                "color": "#f5f5f5"
            }, {
                "lightness": 20
            }]
        }, {
            "featureType": "landscape.natural.landcover",
            "elementType": "geometry.fill",
            "stylers": [{
                "color": "#ffffff"
            }]
        }, {
            "featureType": "landscape.natural.landcover",
            "elementType": "geometry.stroke",
            "stylers": [{
                "color": "#aeaeae"
            }]
        }, {
            "featureType": "landscape.natural.terrain",
            "elementType": "geometry.fill",
            "stylers": [{
                "color": "#eeeeee"
            }]
        }, {
            "featureType": "poi",
            "elementType": "geometry",
            "stylers": [{
                "color": "#f5f5f5"
            }, {
                "lightness": 21
            }]
        }, {
            "featureType": "poi.park",
            "elementType": "geometry",
            "stylers": [{
                "color": "#dedede"
            }, {
                "lightness": 21
            }]
        }, {
            "featureType": "road.highway",
            "elementType": "geometry.fill",
            "stylers": [{
                "color": "#ffffff"
            }, {
                "lightness": 17
            }]
        }, {
            "featureType": "road.highway",
            "elementType": "geometry.stroke",
            "stylers": [{
                "color": "#ffffff"
            }, {
                "lightness": 29
            }, {
                "weight": 0.2
            }]
        }, {
            "featureType": "road.arterial",
            "elementType": "geometry",
            "stylers": [{
                "color": "#ffffff"
            }, {
                "lightness": 18
            }]
        }, {
            "featureType": "road.local",
            "elementType": "geometry",
            "stylers": [{
                "color": "#ffffff"
            }, {
                "lightness": 16
            }]
        }, {
            "featureType": "transit",
            "elementType": "geometry",
            "stylers": [{
                "color": "#f2f2f2"
            }, {
                "lightness": 19
            }]
        }, {
            "featureType": "water",
            "elementType": "geometry",
            "stylers": [{
                "color": "#e9e9e9"
            }, {
                "lightness": 17
            }]
        }, {
            "featureType": "water",
            "elementType": "geometry.fill",
            "stylers": [{
                "color": "#d8f1fc"
            }]
        }]
    };
    var map = new google.maps.Map(document.getElementById("map"), mapOptions);
    var image = '/templates/sova/dist/img/svg/baloon_map.svg';
    var infoWindowContent = window.gmapInfoWindowContent;
    if (infoWindowContent !== undefined) {}
    var beachMarker = new google.maps.Marker({
        position: {
            lat: 59.972120,
            lng: 30.417012
        },
        map: map,
        title: "«Профит» Бухгалтерские и юридические услуги в Санкт-Петербурге",
        animation: google.maps.Animation.DROP,
        icon: image
    });
    if (infoWindowContent !== undefined) {
        var infowindow = new google.maps.InfoWindow({
            content: infoWindowContent,
            // closeBoxMargin: "10px 2px 2px 2px",
            pixelOffset: new google.maps.Size(360, 170)
        });
        infowindow.open(map, beachMarker);
        beachMarker.addListener('click', function() {
            infowindow.open(map, beachMarker);
        });
        // *
        // START INFOWINDOW CUSTOMIZE.
        // *
        google.maps.event.addListener(infowindow, 'domready', function() {
            // Reference to the DIV that wraps the bottom of infowindow
            var iwOuter = $('.gm-style-iw');
            // hidden InfoWindow arrow
            iwOuter.prev().css('display', 'none');
            // console.debug(iwOuter.prev());
            iwOuter.children().css({
                overflow: 'visible'
            });
            // Moves the infowindow 115px to the right.
            iwOuter.children().children().css({
                overflow: 'visible'
            });
            iwOuter.css({
                overflow: 'visible'
            });
            iwOuter.parent().css({
                overflow: 'visible'
            });
        });
    }
};
$(document).ready(function($) {
    $('.form').on('submit', function(event) {
        var url = $(this).attr('action');
        var that = $(this);
        $.ajax({
            url: url,
            type: 'POST',
            // dataType: 'json',
            data: $(this).serialize(),
        }).done(function(data) {
            that.html(data);
        }).fail(function(data) {
            console.log("error");
        });
        return false;
    });
    $('.form_faq').on('submit', function(event) {
        var url = $(this).attr('action');
        var formId = $('#faq_cat_id').val();
        var that = $(this);
        if (formId == null) {
            formId = $('#faq_cat_id option:not([disabled]):first').val();
        }
        url = url + formId + '/';
        $.ajax({
            url: url,
            type: 'POST',
            // dataType: 'json',
            data: $(this).serialize(),
        }).done(function(data) {
            that.html(data);
        }).fail(function(data) {
            console.log("error");
        });
        return false;
    });
    $('.show_more').on('click', function(e) {
        e.preventDefault();
        var url = $(this).data('requesurl');
        var page = $(this).data('page');
        var total = $(this).data('total');
        var perpage = $(this).data('perpage');
        var template = $(this).data('template');
        var that = $(this);
        var url = window.location.href;
        page++;
        if ((page + 1) * perpage >= total) {
            $(this).hide('slow');
        }
        $.ajax({
            url: url,
            dataType: 'text',
            data: {
                p: page,
                transform: template
            },
        }).done(function(data) {
            $(data).insertBefore('.show_more');
            window.history.pushState({}, null, updateQueryStringParameter(url, "p", page));
        }).fail(function() {
            console.log("error");
        }).always(function() {
            that.data('page', page);
        });
        console.log(url);
        console.log(page);
    });

    $('.tag_link').on('click', function(event) {
    	event.preventDefault();
    	var tagName = $(this).data('tag');
        var url = window.location.href;
    	var path = 'fields_filter\\[tags\\]\\[eq\\]\\[\\]';
    	
    	console.debug(updateQueryStringParameter(url, path, encodeURIComponent(tagName)));
    	// window.location
    });

    function updateQueryStringParameter(uri, key, value) {
        var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
        var separator = uri.indexOf('?') !== -1 ? "&" : "?";
        console.debug(re);
        if (uri.match(re)) {
            return uri.replace(re, '$1' + key + "=" + value + '$2');
        } else {
            return uri + separator + key + "=" + value;
        }
    }
});