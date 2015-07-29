var searchmap=document.getElementById('map');
//Kiểm tra xem có bản đồ để search hay không?
if(typeof searchmap !== "undefined" && searchmap != null)
{
    $(function(){
        $('.chkbox').click(function(){
            $(':checkbox').attr('checked',false);
            $('#'+$(this).attr('id')).attr('checked',true);
            search_types(map.getCenter());
        });

    });
    var marker;
    var map;
    var markersArray = [];
    var toadox=document.getElementById('order-locationx'),
        toadoy=document.getElementById('order-locationy'),
        toado=( typeof toadox !== "undefined" && toadox != null &&
                typeof toadoy !== "undefined" && toadoy != null );
    var pyrmont;
    var geocoder = new google.maps.Geocoder();
    var infowindow = new google.maps.InfoWindow();
    if(toado){
        if(toadox.value!= ''&& toadoy.value!= ''){
            pyrmont = new google.maps.LatLng(toadox.value, toadoy.value);
            showMap();
        }else{
            document.getElementById('order-address').value='Hà nội, Việt nam';
            pyrmont = new google.maps.LatLng(21.00331240148827, 105.82194328308105);
        }
        
    }else{
        document.getElementById('order-address').value='Hà nội, Việt nam';
        pyrmont = new google.maps.LatLng(21.00331240148827, 105.82194328308105);
    }
    
    // var waypoints = [];                  
    function initialize() {
        map = new google.maps.Map(document.getElementById('map'), {
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            center: pyrmont,
            zoom: 14
        });
        infowindow = new google.maps.InfoWindow();
        //document.getElementById('directionsPanel').innerHTML='';
        search_types();
       }

    function createMarker(place,icon) {
        var placeLoc = place.geometry.location;
        var marker = new google.maps.Marker({
            map: map,
            position: place.geometry.location,
            icon: icon,
            visible:true  

        });

        markersArray.push(marker);
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.setContent("<b>Name:</b>"+place.name+"<br><b>Address:</b>"+place.vicinity+"<br><b>Reference:</b>"+place.reference+"<br><b>Rating:</b>"+place.rating+"<br><b>Id:</b>"+place.id);
            infowindow.open(map, this);
        });

    }
    var source="";
    var dest='';

    function search_types(latLng){
        clearOverlays(); 

        if(!latLng){
            var latLng = pyrmont;
        }
        var type = $('.chkbox:checked').val();
        var icon = "images/"+type+".png";


        var request = {
            location: latLng,
            radius: 2000,
            types: [type] //e.g. school, restaurant,bank,bar,city_hall,gym,night_club,park,zoo
        };

        var service = new google.maps.places.PlacesService(map);
        service.search(request, function(results, status) {
            map.setZoom(14);
            if (status == google.maps.places.PlacesServiceStatus.OK) {
                for (var i = 0; i < results.length; i++) {
                    results[i].html_attributions='';
                    createMarker(results[i],icon);
                }
            }
        });

     }


    // Deletes all markers in the array by removing references to them
    function clearOverlays() {
        if (markersArray) {
            for (i in markersArray) {
                markersArray[i].setVisible(false)
            }
            //markersArray.length = 0;
        }
    }
    google.maps.event.addDomListener(window, 'load', initialize);

    function clearMarkers(){
        $('#show_btn').show();
        $('#hide_btn').hide();
        clearOverlays()
    }
    function showMarkers(){
        $('#show_btn').hide();
        $('#hide_btn').show();
        if (markersArray) {
            for (i in markersArray) {
                markersArray[i].setVisible(true)
            }

        }
    }

    function showMap(){

        var imageUrl = 'http://chart.apis.google.com/chart?cht=mm&chs=24x32&chco=FFFFFF,008CFF,000000&ext=.png';
        var markerImage = new google.maps.MarkerImage(imageUrl,new google.maps.Size(24, 32));
        var input_addr=$('#order-address').val();
        geocoder.geocode({address: input_addr}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var latitude = results[0].geometry.location.lat();
                var longitude = results[0].geometry.location.lng();
                var latlng = new google.maps.LatLng(latitude, longitude);
                if (results[0]) {
                    //map.setZoom(14);
                    map.setCenter(latlng);
                    marker = new google.maps.Marker({
                        position: latlng, 
                        map: map,
                        icon: markerImage,
                        draggable: true 

                    }); 
                    //$('#btn').hide();
                    $('#order-locationx,#order-locationy').show();
                    $('#order-address').val(results[0].formatted_address);
                    $('#order-locationx').val(marker.getPosition().lat());
                    $('#order-locationy').val(marker.getPosition().lng());
                    infowindow.setContent(results[0].formatted_address);
                    infowindow.open(map, marker);
                    search_types(marker.getPosition());
                    google.maps.event.addListener(marker, 'click', function() {
                        infowindow.open(map,marker);

                    });


                    google.maps.event.addListener(marker, 'dragend', function() {

                        geocoder.geocode({'latLng': marker.getPosition()}, function(results, status) {
                            if (status == google.maps.GeocoderStatus.OK) {
                                if (results[0]) {
                                    //$('#btn').hide();
                                    $('#latitude,#longitude').show();
                                    $('#order-address').val(results[0].formatted_address);
                                    $('#order-locationx').val(marker.getPosition().lat());
                                    $('#order-locationy').val(marker.getPosition().lng());
                                }

                                infowindow.setContent(results[0].formatted_address);
                                var centralLatLng = marker.getPosition();
                                search_types(centralLatLng);
                                infowindow.open(map, marker);
                            }
                        });
                    });

                } else {
                    alert("No results found");
                }
            } else {
                alert("Geocoder failed due to: " + status);
            }
        });

    }   
}
    