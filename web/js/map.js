var diachikhachhang;
var diachishop = new google.maps.LatLng(20.996368   , 105.82675700000004);
var xemlai =document.getElementById('order-address');
var xemlaix =document.getElementById('order-locationx');
var xemlaiy =document.getElementById('order-locationy');
var dunglaxemlai= ( typeof xemlai !== "undefined" && xemlai  != null&& 
                    typeof xemlaix!== "undefined" && xemlaix != null&&
                    typeof xemlaiy!== "undefined" && xemlaiy != null);
 
if(dunglaxemlai){
    if(xemlai.value!=''&&xemlaix.value!=''&&xemlaiy.value!=''){
            diachikhachhang=new google.maps.LatLng(
            xemlaix.value   , 
            xemlaiy.value 
        );
    }else{
        dunglaxemlai=false;
    }
    
    
}
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
// This example adds a search box to a map, using the Google Place Autocomplete
// feature. People can enter geographical searches. The search box will return a
// pick list containing a mix of places and predicted search terms.
function initialize() {
    var markers = [];
    directionsDisplay = new google.maps.DirectionsRenderer();
    var map = new google.maps.Map(document.getElementById('map-canvas'), {
        mapTypeId: google.maps.MapTypeId.ROADMAP,
    });
    directionsDisplay.setMap(map);
    //khu vuc ha noi
    var defaultBounds = new google.maps.LatLngBounds(
        new google.maps.LatLng(21.02263695589728   , 105.78137392658687),
        new google.maps.LatLng(21.0303237824332    , 105.87470911750484)
    );
    if(!dunglaxemlai){
        map.fitBounds(defaultBounds);
        console.log('da vao day');
    }else{
        calcRoute() ;
        console.log('da vao duoi day');
    }
    // Create the search box and link it to the UI element.
    var input = /** @type {HTMLInputElement} */(
        document.getElementById('pac-input'));
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
    var searchBox = new google.maps.places.SearchBox(
      /** @type {HTMLInputElement} */(input));
    // [START region_getplaces]
    // Listen for the event fired when the user selects an item from the
    // pick list. Retrieve the matching places for that item.
    google.maps.event.addListener(searchBox, 'places_changed', function() {
        var listsearch= searchBox.getPlaces();
        var places =[];
        places.push(listsearch[0]);//lay mot dia chi dau tien
        for (var i = 0, marker; marker = markers[i]; i++) {
            marker.setMap(null);
        }
        // For each place, get the icon, place name, and location.
        markers = [];
        var bounds = new google.maps.LatLngBounds();
        for (var i = 0, place; place = places[i]; i++) {
            var image = {
                url: place.icon,
                size: new google.maps.Size(71, 71),
                origin: new google.maps.Point(0, 0),
                anchor: new google.maps.Point(17, 34),
                scaledSize: new google.maps.Size(2, 2)
            };
            // Create a marker for each place.
            var marker = new google.maps.Marker({
                map: map,
                icon: image,
                title: place.name,
                position: place.geometry.location
            });
            //nap vi tri vao the input
            $('#order-locationx').val(marker.getPosition().lat());
            $('#order-locationy').val(marker.getPosition().lng());
            $('#order-address').val(listsearch[0].formatted_address);
            diachikhachhang=new google.maps.LatLng(
                                marker.getPosition().lat()   , 
                                marker.getPosition().lng()
                            );
            markers.push(marker);
            bounds.extend(place.geometry.location);
        }
        map.fitBounds(bounds);
        //ve duong
        calcRoute() ;
        //set zoom khoang cach de nhin
        map.setZoom(15);
    });
    // [END region_getplaces]

    // Bias the SearchBox results towards places that are within the bounds of the
    // current map's viewport.
    google.maps.event.addListener(map, 'bounds_changed', function() {
        var bounds = map.getBounds();
        searchBox.setBounds(bounds);
    });
}
//ve duong di
function calcRoute() {
    var selectedMode = 'WALKING';
    var request = {
        origin: diachishop,
        destination: diachikhachhang,
        // Note that Javascript allows us to access the constant
        // using square brackets and a string value as its
        // "property."
        travelMode: google.maps.TravelMode[selectedMode]
    };
    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
      }
    });
}
google.maps.event.addDomListener(window, 'load', initialize);