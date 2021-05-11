<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inconsolata">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <title>Get Fuel</title>
        <style>

            *{
                margin:0 ; 
                padding:0 ;
            }
            #submit{
                margin-top: 18px;
            }
            body{
                background-image: url(lukas-ballier-XY2GIbKdZkA-unsplash.jpg) ; 
                background-size: cover;
                background-position: center;
            }
            .Dr{
                padding-top:  5px;
                text-align: center;
                font-size: 20px;
                color: yellow;
                padding: 5px ; 

            }
            
            #Mark{
                margin-top: 80px;
                margin-left: 40%;


            }
            #MyDiv
            {
                margin-left: auto; 
                margin-right: auto; 
                margin-top: 5px ;
                text-align: center;
            }
            #map{
                margin-top: 20px;
                height: 500px;
                width:70% ;
                float: right;
                margin-right: 40px;

            }
            .fontlarge{
                font-size: 20px;
            }
            #fuel {
                margin-top: 30px;
                width: 23% ; 
                float: left;
                margin-left: 0px;
                text-align: center;
                padding: 20px;

            }
            span{
                color:white;
                font-size: 20px;
                padding: 2px;
            }
            #Mark input[type="button"] , #fuel #submit {
                font-size:20px;
                color: white;
                border: 2px solid white;
                background: none;
                border-radius: 5px 5px;
                padding: 5px;
            }
            #fuel input[type="text"] {
                font-size:18px;
                color: black;
                border: 2px solid white;
                border-radius: 5px 5px;
            }
            #fuel input[type="number"] {
                font-size:18px;
                color: black;
                border: 2px solid white;
                border-radius: 5px 5px;
            }
            #Mark input[type="button"]:hover {
                cursor: pointer ;
                background: lightcyan;
                color:#000000;
            }
            #fuel #submit:hover{
                cursor: not-allowed;
                background: lightcyan;
                color: black;
            }
            /*            form{
                            float: left;
                            border: 2px #ddd dotted;
                            padding: 20px;
                        }*/
        </style>
    </head>
    <body>

        <%@ page import="Fuel.FuelInfo" %>
        <%
            float price = FuelInfo.getFuelPrice();
        %>
        <div class="w3-top">
            <div class="w3-row w3-padding w3-black">
                <div class="w3-col s3 fontlarge">
                    <a href="Home.jsp" class="w3-button w3-block w3-black"><i class="fa fa-home"></i> HOME</a>
                </div>
                <div class="w3-col s3 fontlarge">
                    <a href="#" class="w3-button w3-block w3-black"><i class="fa fa-angle-double-left"></i> GET FUEL <i class="fa fa-angle-double-right"></i></a>
                </div>
                <div class="w3-col s3 fontlarge">
                    <a href="AboutUs.html" class="w3-button w3-block w3-black"><i class="fa fa-user"></i> ABOUT US</a>
                </div>


                <div class="w3-col s3 fontlarge">
                    <div class="dropdown fontlarge">
                        <button class="btn btn-primary dropdown-toggle fontlarge" type="button" data-toggle="dropdown">More
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu fontlarge">

                            <li><a href="ContactUs.html"><i class="fa fa-envelope"></i> CONTACT US</a></li>
                            <li><a href="Logout" ><i class="fa fa-sign-out"></i>LOGOUT</a></li>
                            <li><a href="Careers.html"><i class="fa fa-briefcase"></i>  CAREERS</a></li>
                            <li><a href="ChangePassword.html"><i class="fa fa-key icon"></i> CHANGE PASSWORD</a></li>
                            <li><a href="AboutUs.html"><i class="fa fa-user"></i>  ABOUT US</a></li>
                            <li><a href="FAQ.html"><i class="fa fa-question-circle" aria-hidden="true"></i> FAQ'S</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
        <div id="Mark">
            <input type="button" onclick="getPermission()" value="Mark My Location"/>
            <i class="material-icons" style="font-size:36px;color:red">directions</i>


        </div>

        <div id="map">

        </div>

        <div id="fuel">

            <form action="LocationCatch.jsp" target="_Blank">
                <span>Fuel Price(Rupees)</span> <input id="price" name = "price" type="number" value="<%=price%>" readonly/>
                <br> <br>
                <h2><span>Quantity(Litre's)</span></h2> <input id="quantity" name="quantity" oninput="myFunction()" step="0.5" type="number"  value="1" min="0.5"/>
                <br><br>
                <h2><span>Time Limit(minutes)</span></h2>
                    <input type="number" id="TimeLimit" name="TimeLimit" step="5" value="60" min="25"    />                
                <input type="text" id="latbox" name="latitude" hidden /> 
                <input type="text" id="lngbox" name="longitude" hidden/>               
                <input  id="submit" type="submit" value="Get Fuel &#9734; " disabled  />

            </form>
        </div>
        <script>
            $(function () {

                $('input[type=number]').on('keydown', function (e) {
                    e.preventDefault();
                });

            });
            function myFunction()
            {
                let price = document.getElementById("price");
                let quantity = document.getElementById("quantity");
                let fuelPrice = <%=price%>
                price.value = quantity.value * fuelPrice;
            }
            function getPermission()
            {
                var reply = confirm("Dr Fuel wants to access your location");
                if (reply === true)
                {
                    getLocation();
                } else
                {

                }
            }
            function getLocation() {
                var x = document.getElementById("submit");
                x.disabled = false;
                x.style.cursor = "pointer";
                if (navigator.geolocation) {
                    navigator.geolocation.watchPosition(showPosition);
                }

            }
        </script>
        <script>
            function showPosition(position) {


                lati = parseFloat(position.coords.latitude);
                longi = parseFloat(position.coords.longitude);
                document.getElementById('latbox').value = lati;
                document.getElementById('lngbox').value = longi;
                loadScript();

            }
            function initMap() {

                var location = {lat: parseFloat(lati), lng: parseFloat(longi)};
                var map = new google.maps.Map(document.getElementById("map"), {
                    zoom: 7,
                    center: location
                });

                var marker = new google.maps.Marker({
                    position: location,
                    map: map,
                    draggable: true

                });


                google.maps.event.addListener(marker, 'dragend', function (event) {
                    document.getElementById("latbox").value = this.getPosition().lat();
                    document.getElementById("lngbox").value = this.getPosition().lng();
                });


                var infowindow = new google.maps.InfoWindow({
                    content: "This is your  location"
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


