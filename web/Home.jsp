<!DOCTYPE html>
<html>
    <title>Dr.Fuel</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inconsolata">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <style>
        body,
        html {
            height: 100%;
            font-family: Century Gothlic;
        }

        .bgimg {
            background-position: center;
            background-size: cover;
            background-image: url("viktor-talashuk-dBHFVabsG4s-unsplash.jpg");
            min-height: 95%;
        }

        .menu {
            display: none;
        }

        .fontlarge {
            font-size: 20px;
        }
        .notification .badge {
            position: absolute;
            top: -10px;
            right: -10px;
            border-radius: 50%;
            background-color: white;
            color: black;
        }

        abbr {
            text-decoration: none;
        }
        .white{
            color: white;
        }
        .setP{
            padding: 64px;
        }

    </style>

    <body>
        <%@ page import="Inbox.Delivery" %>
        <%
            Delivery d = new Delivery();
            int badges = 0;
            badges = d.getBadges((String) session.getAttribute("email"));
        %>
        <div class="w3-top ">
            <div class="w3-row w3-padding ">
                <div class="w3-col s3 fontlarge">
                    <a href="#" class="w3-button w3-block white"> <i class="fa fa-home"></i> HOME</a>
                </div>
                <div class="w3-col s3 fontlarge ">
                    <a href="Location.jsp" class="w3-button  w3-block  white "><i class="fa fa-angle-double-left"></i> GET FUEL <i class="fa fa-angle-double-right"></i> </a>
                </div>
                <div class="w3-col s3 fontlarge">
                    <a href="ClientNotify.jsp" class="w3-button w3-block  white">
                        <span>
                            <i class="fa fa-th"></i> REQUEST'S</span>
                        <span class="badge"><%=badges%></span>
                    </a>
                </div>

                <div class="w3-col s3 fontlarge">
                    <div class="dropdown fontlarge">
                        <button class="btn btn-primary dropdown-toggle fontlarge" type="button" data-toggle="dropdown">More
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu fontlarge">

                            <li><a href="ContactUs.html"><i class="fa fa-envelope"></i> CONTACT US</a></li>
                            <li><a href="Logout" accesskey="1"><i class="fa fa-sign-out"></i> LOGOUT</a></li>
                            <li><a href="Careers.html"><i class="fa fa-briefcase"></i> CAREERS</a></li>
                            <li><a href="ChangePassword.html"><i class="fa fa-key icon"></i> CHANGE PASSWORD</a></li>
                            <li><a href="AboutUs.html"><i class="fa fa-user"></i> ABOUT US</a></li>
                            <li><a href="FAQ.html"><i class="fa fa-question-circle" aria-hidden="true"></i> FAQ'S</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>


        <header class="bgimg w3-display-container " id="home">
            <div class="w3-display-bottomleft w3-center w3-padding-large w3-hide-small">
                <span class="w3-tag">Open 24*7</span>
            </div>
            <div class="w3-display-middle w3-center setP">
                <span class="w3-text-white" style="font-size:50px;">DON'T PUSH YOUR BIKE , WE WILL MAKE SURE YOU
                    RIDE.</span>
                <br>
                <!--<span class="w3-text-white" style="font-size:50px;">Dr.Fuel</span>-->
            </div>

        </header>

        <!-- Add a background color and large text to the whole page -->
        <div class="w3-sand w3-grayscale w3-large">

            <!-- About Container -->
            <div class="w3-container" id="about">
                <div class="w3-content" style="max-width:700px">
                    <h2 class="w3-center w3-padding-64"><span class="w3-tag w3-wide">ABOUT DR. FUEL</span></h2>
                    <p>We believe the fuel that moves you and your business should be effortless and guilt free. At Dr.Fuel,
                        we bring fuel directly to you for the same price as a gas station. We do this because its better for
                        you, your city, and the planet. (And, because one day we got stuck in the rain waiting in line for
                        fuel in India and thought theres gotta be a better way. Think its easy to deliver fuel to cars? Its
                        not. It takes rethinking nearly a century old supply chain so that every Fuel station becomes a
                        community park. Thats why we build everything full-stack. We use the latest technology to deliver
                        good old-fashioned personal service, and a little bit of magic, in every boost.

                    </p>
                    <div class="w3-panel w3-leftbar w3-light-grey">
                        <p><i>"Reinventing the way , energy is delivered".</i></p>

                    </div>
                    <!--                    <img src="image_2021-02-26_09-32-49.png" style="width:100%;height: 500px; max-width:1000px"
                                             class="w3-margin-top">-->

                    <p><strong>Dr.Fuel </strong> India</p>
                </div>

            </div>
        </div>
        <footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge">
            <a href="https://www.google.com" target="_blank"><i class="fa fa-facebook-official w3-hover-opacity"></i></a>
            <a href="https://www.google.com" target="_blank"><i class="fa fa-instagram w3-hover-opacity"></i></a>
            <a href="https://www.google.com" target="_blank"><i class="fa fa-snapchat w3-hover-opacity"></i></a>
            <a href="https://www.google.com" target="_blank"><i class="fa fa-twitter w3-hover-opacity"></i></a>
            <a href="https://www.google.com" target="_blank"><i class="fa fa-linkedin w3-hover-opacity"></i></a>
            <p><a href="#" title="W3.CSS"  class="w3-hover-text-green">Designed by Dhiraj and Jaydutt</a></p>
        </footer>
    </body>

</html>