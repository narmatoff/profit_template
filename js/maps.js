function initMap() {
    var mapOptions = {
        zoom: 13,
        center: {
            lat: 59.972120,
            lng: 30.417012
        },
    }
    var map = new google.maps.Map(document.getElementById("map"), mapOptions);
    var image = '/templates/sova/dist/img/svg/baloon_map.svg';
    var beachMarker = new google.maps.Marker({
        position: {
            lat: 59.972120,
            lng: 30.417012
        },
        map: map,
        animation: google.maps.Animation.DROP,
        icon: image
    });
}
