<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String latitude = request.getParameter("lat");  %>
<% String longitude = request.getParameter("long");%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client's Location</title>
        <style>
             #map{
        height: 500px;
        width:100% ; 
        }
        </style>
    </head>
    <body>
       
        <div id="map">

        </div>
        <script>
            var lati =<%= latitude%>
            var longi = <%=longitude%>
            loadScript();
            function initMap() {

                var location = {lat: lati, lng: longi};
                var map = new google.maps.Map(document.getElementById("map"), {
                    zoom: 7,
                    center: location
                });

                var marker = new google.maps.Marker({
                    position: location,
                    map: map,
                    draggable: false

                });

                var infowindow = new google.maps.InfoWindow({
                    content: "This is Client's location"
                });

                infowindow.open(map, marker);
            }
            function loadScript() {
                var script = document.createElement('script');
                script.type = 'text/javascript';
                script.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyB5xRYslDSqPeXPWxqoq83wmRGDE-6C9pY&callback=initMap';
                document.body.appendChild(script);

            }
        </script>
    </body>
</html>
