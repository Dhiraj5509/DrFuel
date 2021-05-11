<%@page import="DBProperties.DBConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>


            h2{
                font-size: 29px;
                text-align: center;
                color: darkviolet;
            }
            .header{
                text-align: center;
                font-size: 20px;
                color: #000000;
                padding-top: 10px ;  
                padding-bottom: 10px ; 
                background-color: #fee;
            }
            #dataTable , #dataTable1 , #dataTable2{
                margin-top: 20px;
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }
            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;

            }
            .pad{
                margin-top: 20px;
                margin-left: 5px;
                margin-right: 50px;
                font-size:15px;
                border-radius: 5px 5px;
                padding: 5px;

            }
            abbr{
                text-decoration: none;
            }

            #output{
                font-size: 20px;
            }
            .switch {
                margin: 20px;
                position: relative;
                display: inline-block;
                width: 90px;
                height: 34px;
            }

            .switch input {
                display: none;
            }

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ca2222;
                -webkit-transition: .4s;
                transition: .4s;
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

            input:checked+.slider {
                background-color: #2ab934;
            }

            input:focus+.slider {
                box-shadow: 0 0 1px #2196F3;
            }

            input:checked+.slider:before {
                -webkit-transform: translateX(55px);
                -ms-transform: translateX(55px);
                transform: translateX(55px);
            }

            /*------ ADDED CSS ---------*/
            .on {
                display: none;
            }

            .on,
            .off {
                color: white;
                position: absolute;
                transform: translate(-50%, -50%);
                top: 50%;
                left: 50%;
                font-size: 10px;
                font-family: Verdana, sans-serif;
            }

            input:checked+.slider .on {
                display: block;
            }

            input:checked+.slider .off {
                display: none;
            }

            /*--------- END --------*/

            /* Rounded sliders */
            .slider.round {
                border-radius: 34px;
            }

            .slider.round:before {
                border-radius: 50%;
            }
        </style>
    </head>
    <body>
        <audio id="audio" src="pristine-609.mp3"></audio>
        <div class="header" >
            <h1>Welcome to Dr. Fuel</h1>
        </div>
        <div>
            <table id="dataTable1">
                <tr>
                    <td>Your Id:</td>
                    <td><%= request.getAttribute("emailId")%>  </td>
                </tr>
            </table>

        </div>
        <div>
            <input type="text" id="latbox" hidden> 
            <input type="text" id="lngbox" hidden>
            <label class="switch">
                <input type="checkbox" name="checkbox" id="togBtn">
                <div class="slider round">
                    <!--ADDED HTML -->
                    <span class="on">ON</span>
                    <span class="off">OFF</span>
                    <!--END-->
                </div>
            </label>
        </div>
        <div id="output">

        </div>  
        <h2>The deliveries which you need to accept/reject</h2>
        <table id="dataTable2">
            <tr>
                <th>&marker;</th>
                <th>Client Id</th>
                <th>Latitude</th>
                <th>Longitude</th>
                <th>Request Date</th>
                <th>Request Time</th>
                <th>View Location</th>
                <th>Time Limit</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
        </table>
        <button type="button" class="btn btn-info pad" onclick="requestAccept()">Confirm Request</button>  
        <button class="btn btn-danger pad" onclick="requestReject()">Reject Request</button>
        <div style="margin:80px;">

        </div>
        <h2>The deliveries which you need to deliver</h2>
        <TABLE id="dataTable" >
            <tr>
                <th>&marker;</th>
                <th>Client Id</th>
                <th>Latitude</th>
                <th>Longitude</th>
                <th>Request Date</th>
                <th>Request Time</th>
                <th>View Location</th>
                <th>Time Limit</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>


            <% try {
                    String connectionURL = "jdbc:mysql://localhost:3306/student";

                    Connection connection = null;
                    PreparedStatement statement = null;
                    ResultSet rs = null;

                    Class.forName(DBConfig.getdName());
                    connection = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

                    String QueryString = "SELECT clientId , latitude , longitude ,  requestDate  , requestTime , price , quantity , timelimit from serviceDeliveredInfo where serviceId=? and status=?";

                    statement = connection.prepareStatement(QueryString, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                    statement.setString(1, (String) request.getAttribute("emailId"));
                    statement.setString(2, "pending");
                    rs = statement.executeQuery();%>                     
            <% while (rs.next()) {%>

            <TR>
                <td><input type="radio" name="chkbox[]"/></td>

                <td><%=rs.getString(1)%></td>

                <% String lati = rs.getString(2);%>          
                <td><%=lati%></td>

                <%String longi = rs.getString(3);%>
                <td><%=longi%></td>

                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>

                <% String s = "newjsp.jsp?lat=" + lati + "&long=" + longi;%>

                <td><a href="<%=s%>" target="_blank">Visit</a></td>
                <td><%=rs.getString(8)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>



            </TR>


            <% } %>

            <%
                rs.close();
                statement.close();
                connection.close();
            } catch (Exception ex) { %>
            <% System.out.println(ex);
                }%>
        </TABLE>

        <div id="submission"  >
            <button class="btn btn-info pad" onclick="deleteRowConfirm()">Confirm delivery</button>
        </div>

    </body>

    <script>
        var connectDelivery = 0;
        var checkbox = document.querySelector("input[name=checkbox]");

        var webSocket;
        var table1 = document.getElementById('dataTable');
        checkbox.addEventListener("change", function () {
            if (this.checked) {
                connectDelivery = 1;
                connect();
            } else {
                checkPendings();
            }
        });
        var webSocket;
        var output = document.getElementById("output");

        var wsUrl = (location.protocol === "https:" ? "wss://" : "ws://") + location.hostname + (location.port ? ':' + location.port : '') + "/SPD_PROJECT/toServiceLocation";
        <% String str = (String) request.getAttribute("emailId");%>
        var email = "<%=str%>";
        function connect() {
            // open the connection if one does not exist
            if (webSocket !== undefined
                    && webSocket.readyState !== WebSocket.CLOSED) {
                return;
            }

//            updateOutput("Trying to establish a WebSocket connection to <code>" + wsUrl + "</code>");

            // Create a websocket
            webSocket = new WebSocket(wsUrl);

            webSocket.onopen = function (event) {
//                updateOutput("Connected!");
                getLocation();

            };

            webSocket.onmessage = function (event) {
                var splited = event.data.split(" ");
                if (splited[0] === 'Service' && email === splited[1])
                {
                    console.log(event.data);
                    var clientId = splited[2];
                    var latitude = splited[3];
                    var longitude = splited[4];
                    var date = splited[5];
                    var time = splited[6];
                    var timeLimit = splited[7];
                    var price = splited[8];
                    var quantity = splited[9];
                    addRowRequest(clientId, latitude, longitude, date, time, timeLimit, price, quantity);
                }
            };

            webSocket.onclose = function (event) {
//                updateOutput("Connection Closed");
                checkbox.checked = false;
                connectDelivery = 0;
            };
        }
        function play() {
            var audio = document.getElementById("audio");
            audio.play();
        }
        function deleteRowConfirm()
        {
            var ask = confirm("Are u sure u delivered ?");
            if (ask === true)
            {
                deleteRow();
            } else
            {

            }
        }
        function checkPendings()
        {
            var table = document.getElementById('dataTable');
            var table2 = document.getElementById('dataTable2');
            var rowCount = table.rows.length;
            var rowCount2 = table2.rows.length;
            if (rowCount > 1 || rowCount2 > 1)
            {
                checkbox.checked = true;
                connectDelivery = 1;
                alert("Please complete your pending requests.......");

            } else
            {
                connectDelivery = 0;
                console.log("closed successfully");
                webSocket.close();
            }
        }
        function addRow(client, latitude, longitude, date, time, timeLimit, price, quantity) {

            var table = document.getElementById('dataTable');

            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);

            var cell1 = row.insertCell(0);
            var element1 = document.createElement("input");
            element1.type = "radio";
            element1.name = "chkbox[]";
            cell1.appendChild(element1);

            var cell2 = row.insertCell(1);
            cell2.innerHTML = client;

            var cell3 = row.insertCell(2);

            cell3.innerHTML = latitude;

            var cell4 = row.insertCell(3);

            cell4.innerHTML = longitude;

            var cell5 = row.insertCell(4);

            cell5.innerHTML = date;

            var cell6 = row.insertCell(5);

            cell6.innerHTML = time;

            var a = document.createElement('a');
            a.target = '_blank';

            var link = 'newjsp.jsp?lat=' + latitude + '&long=' + longitude;

            a.href = link;
            a.innerText = 'Visit';

            var cell7 = row.insertCell(6);

            cell7.appendChild(a);

            var cell8 = row.insertCell(7);

            cell8.innerHTML = timeLimit;

            var cell9 = row.insertCell(8);

            cell9.innerHTML = price;

            var cell10 = row.insertCell(9);

            cell10.innerHTML = quantity;


        }
        function addRowRequest(client, latitude, longitude, date, time, timeLimit, price, quantity) {
            play();
            var table = document.getElementById('dataTable2');

            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);

            var cell1 = row.insertCell(0);
            var element1 = document.createElement("input");
            element1.type = "radio";
            element1.name = "chkbox[]";
            cell1.appendChild(element1);

            var cell2 = row.insertCell(1);
            cell2.innerHTML = client;

            var cell3 = row.insertCell(2);

            cell3.innerHTML = latitude;

            var cell4 = row.insertCell(3);

            cell4.innerHTML = longitude;

            var cell5 = row.insertCell(4);

            cell5.innerHTML = date;

            var cell6 = row.insertCell(5);

            cell6.innerHTML = time;

            var a = document.createElement('a');
            a.target = '_blank';

            var link = 'newjsp.jsp?lat=' + latitude + '&long=' + longitude;

            a.href = link;
            a.innerText = 'Visit';

            var cell7 = row.insertCell(6);

            cell7.appendChild(a);

            var cell8 = row.insertCell(7);

            cell8.innerHTML = timeLimit;

            var cell9 = row.insertCell(8);

            cell9.innerHTML = price;

            var cell10 = row.insertCell(9);

            cell10.innerHTML = quantity;

        }


        function deleteRow() {
            var client;
            var date;
            var time;
            if (checkbox.checked === true)
            {
                try {
                    var table = document.getElementById('dataTable');
                    var rowCount = table.rows.length;

                    for (var i = 0; i < rowCount; i++) {
                        var row = table.rows[i];
                        var chkbox = row.cells[0].childNodes[0];
                        if (null !== chkbox && true === chkbox.checked) {

                            client = table.rows[i].cells[1].innerHTML;
                            date = table.rows[i].cells[4].innerHTML;
                            time = table.rows[i].cells[5].innerHTML;

                            table.deleteRow(i);

                            rowCount--;
                            i--;
                        }
                    }

                    sendIntimation(client, date, time);

                } catch (e) {
                    alert(e);
                }
            } else
            {
                alert("please connect first");
            }

        }
        function requestAccept()
        {
            let client, latitude, longitude, date, time, timeLimit, price, quantity;

            if (checkbox.checked === true)
            {
                try {
                    let table = document.getElementById('dataTable2');
                    let rowCount = table.rows.length;
                    if (rowCount !== 1)
                    {
                        for (var i = 0; i < rowCount; i++) {
                            var row = table.rows[i];
                            var chkbox = row.cells[0].childNodes[0];
                            if (null !== chkbox && true === chkbox.checked) {

                                client = table.rows[i].cells[1].innerHTML;
                                latitude = table.rows[i].cells[2].innerHTML;
                                longitude = table.rows[i].cells[3].innerHTML;
                                date = table.rows[i].cells[4].innerHTML;
                                time = table.rows[i].cells[5].innerHTML;
                                timeLimit = table.rows[i].cells[7].innerHTML;
                                price = table.rows[i].cells[8].innerHTML;
                                quantity = table.rows[i].cells[9].innerHTML;
                                table.deleteRow(i);

                                rowCount--;
                                i--;
                            }
                        }

                        console.log(price + " " + quantity);
                        addRow(client, latitude, longitude, date, time, timeLimit, price, quantity);
                        sendRequestInitimation2(client, date, time, latitude, longitude, price, quantity, timeLimit);

                    } else
                    {

                    }


                } catch (e) {
                    alert(e);
                }
            } else
            {
                alert("please connect first");
            }
        }

        function requestReject()
        {
            let client, latitude, longitude, date, time, timeLimit, price, quantity;
            if (checkbox.checked === true)
            {
                try {
                    var table = document.getElementById('dataTable2');
                    var rowCount = table.rows.length;

                    for (var i = 0; i < rowCount; i++) {
                        var row = table.rows[i];
                        var chkbox = row.cells[0].childNodes[0];
                        if (null !== chkbox && true === chkbox.checked) {

                            client = table.rows[i].cells[1].innerHTML;
                            latitude = table.rows[i].cells[2].innerHTML;
                            longitude = table.rows[i].cells[3].innerHTML;
                            date = table.rows[i].cells[4].innerHTML;
                            time = table.rows[i].cells[5].innerHTML;
                            timeLimit = table.rows[i].cells[7].innerHTML;
                            price = table.rows[i].cells[8].innerHTML;
                            quantity = table.rows[i].cells[9].innerHTML;

                            table.deleteRow(i);

                            rowCount--;
                            i--;
                        }
                    }

                    sendRequestInitimation1(client, date, time);

                } catch (e) {
                    alert(e);
                }
            } else
            {
                alert("please connect first");
            }
        }

        function sendRequestInitimation1(client, date, time)
        {
            let message = "ServiceRI " + email + " " + client + " " + date + " " + time + " no";
            webSocket.send(message);
        }

        function sendRequestInitimation2(client, date, time, latitude, longitude, price, quantity, timeLimit)
        {
            let message = "ServiceRI " + email + " " + client + " " + date + " " + time + " yes " + latitude + " " + longitude + " " + price + " " + quantity + " " + timeLimit;
            webSocket.send(message);
        }
        function send() {

            var text = "Service " + email + " " + lati + " " + longi;
            if (connectDelivery === 1)
            {
                webSocket.send(text);
            }

        }
        function sendIntimation(client, date, time)
        {
            var sendText = "ServiceI " + email + " " + client + " " + date + " " + time;
            console.log(sendText);
            webSocket.send(sendText);

            console.log(sendText);
            console.log("sent");
        }

        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.watchPosition(showPosition);
            }
            setTimeout(getLocation, 6000);
        }

        function showPosition(position) {
            lati = parseFloat(position.coords.latitude);
            longi = parseFloat(position.coords.longitude);
            document.getElementById('latbox').value = lati;
            document.getElementById('lngbox').value = longi;
            send();
        }

        function closeSocket() {
            connectDelivery = 0;
            checkbox.checked = true;
            webSocket.close();
        }
        function updateOutput(text) {
            output.innerHTML += "<br/>" + text;
        }
    </script>
</html>
