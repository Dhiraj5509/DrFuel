<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String latitude = request.getParameter("latitude");
    String longitude = request.getParameter("longitude");
    String price = request.getParameter("price");
    String quantity = request.getParameter("quantity");
    String email = (String) session.getAttribute("email");
    String TimeLimit = (String) request.getParameter("TimeLimit");
    String verify = "Client";
%>
<head>

    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        @import url(http://fonts.googleapis.com/css?family=Roboto:500,100,300,700,400);
        .loader{
            position: fixed;
            left: 0px;
            top: 0px;
            width: 100%;
            height: 100%;
            z-index: 9999;
            background: url('//upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Phi_fenomeni.gif/50px-Phi_fenomeni.gif') 
                50% 50% no-repeat rgb(249,249,249);
        }

    </style>
</head>
<body>
    <div class="loader"></div>
    <div class="header">


        <p id="messageT"></p>


        <p id="sucess">  </p>



    </div>
    <script>
        var webSocket;
        var county, region;
        var latitude = "<%=latitude%>";
        var longitude = "<%=longitude%>";
        var Client = "<%=verify%>";
        var price = "<%=price%>";
        var quantity = "<%=quantity%>";
        var TimeLimit = "<%=TimeLimit%>";
        var query1 = latitude + "," + longitude;
        var messageToTransfer = document.getElementById("messageT");
        var success = document.getElementById("sucess");
        var wsUrl = (location.protocol === "https:" ? "wss://" : "ws://") + location.hostname + (location.port ? ':' + location.port : '') + "/SPD_PROJECT/toServiceLocation";
        var email = "<%=email%>";
        getConfidence();
        function getConfidence()
        {
            connect();

        }
        function connect() {


            if (webSocket !== undefined
                    && webSocket.readyState !== WebSocket.CLOSED) {
                return;
            }

            webSocket = new WebSocket(wsUrl);
//            alert("Trying to connect with Dr.fuel ");

            webSocket.onopen = function (event) {
//                alert("Connected and Processing your request");
                send();

            };

            webSocket.onmessage = function (event) {
                console.log(event.data);
                var string = event.data;
                var splited = string.split(" ");
                let email = "<%=email%>";
                if (splited[0] === "Client" && splited[2] === "Be" && splited[1] === email)
                {
                    swal({
                        title: "Great!",
                        text: "Dear, " + email + "\n" + " Service boy-->" + splited[4] + " is coming to deliver your booster",
                        type: "success"
                    });


                } else if (splited[0] === "Client" && splited[1] === email)
                {
//                    updateOutput(event.data);
                    webSocket.close();
                    swal({
                        icon: 'error',
                        title: "OOPS!",
                        text: "Dear," + email + "\n" + " Service boy not available",
                        type: "failure"
                    }).then(function () {
                        window.location = "Home.jsp";
                    });


                } else if (splited[0] === "ClientRR" && splited[1] === email)
                {
//                    updateOutput(event.data);
                    webSocket.close();
                    swal({
                        icon: 'error',
                        title: "OOPS!",
                        text: "Dear," + email + "\n" + " Can't reach you that soon",
                        type: "failure"
                    }).then(function () {
                        window.location = "Home.jsp";
                    });


                } else if (splited[0] === "ClientI" && splited[1] === email)
                {
                    webSocket.close();
                    swal({
                        position: 'top-end',
                        icon: 'success',
                        title: "Great",
                        text: "Dear," + email + "\n" + " You successfully received booster"
                    }).then(function () {
                        window.location = "SubmitReview.jsp?email=" + splited[1] + "&rdate=" + splited[2] + "&rtime=" + splited[3];
                    });

                    messageToTransfer.style.display = "none";

                }
            };
            webSocket.onclose = function (event) {
                webSocket.close();
            };
        }
        function getLocationDetails()
        {
            $.ajax({
                url: 'http://api.positionstack.com/v1/reverse',
                data: {
                    access_key: '8b2c0c859e98620687126a846f586c9c',
                    query: query1,
                    limit: 1
                }
            }).done(function (data) {
                console.log(data.data[0].locality);
                console.log(data.data[0].county);
                console.log(data.data[0].region);
                console.log(data);
                county = data.data[0].county;
                region = data.data[0].region;
                webSocket.send(Client + " " + email + " " + latitude + " " + longitude + " " + price + " " + quantity + " " + TimeLimit + " " + county + " " + region);

            });
        }




        function send() {


            getLocationDetails();


        }
        function updateOutput(text) {
            messageToTransfer.innerHTML += text + "<br>";
        }
        function updateSuccess(text) {
            success.innerHTML += text + "<br>";
        }

    </script>
</body>


