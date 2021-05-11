<%@page import="DBProperties.DBConfig"%>
<html>
    <head>
        <title>
            Pending deliveries
        </title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <style>

            body{
                background: #f1f1f1;
            }
            #dataTable , #dataTable1 {
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
            h2{
                font-size: 29px;
                text-decoration: none;
                display:block;
                text-align: center;
                color: firebrick;
            }
        </style>
    </head>

    <body>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.io.*" %>

        <% try {
                String connectionURL = "jdbc:mysql://localhost:3306/student";

                Connection connection = null;
                PreparedStatement statement = null;
                ResultSet rs = null;

                Class.forName(DBConfig.getdName());
                connection = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

                String QueryString = "SELECT clientId , serviceId , requestDate , requestTime , price , quantity from serviceDeliveredInfo where clientId=? and status=?";

                statement = connection.prepareStatement(QueryString, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                statement.setString(1, (String) (session.getAttribute("email")));
                statement.setString(2, "pending");
                rs = statement.executeQuery();%>

        <%int rowcount = 0;
            if (rs.last()) {
                rowcount = rs.getRow();
                rs.beforeFirst();
            }%>


        <% if (rowcount == 0) { %>

        <h1> No Pending requests.. </h1>

        <% } else { %>
        <h2>View Pending request</h2>
        <table id="dataTable"> 

            <tr>
                <th>Your Id</th>
                <th>Service</th>
                <th>Request Date</th>
                <th>Request Time</th>
                <th>Total price(Rupees)</th>
                <th>Total Quantity(Litre's)</th>
            </tr>

            <% while (rs.next()) {%>

            <TR>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
            </TR>


            <% } %>
            <%
                    rs.close();
                    statement.close();
                    connection.close();
                }
            } catch (Exception ex) { %>
            <% System.out.println(ex);
                }%>
        </table>


        <% try {
                String connectionURL = "jdbc:mysql://localhost:3306/student";

                Connection connection = null;
                PreparedStatement statement = null;
                ResultSet rs = null;

                Class.forName("org.apache.derby.jdbc.ClientDriver");

                connection = DriverManager.getConnection("jdbc:derby://localhost:1527/DrFuel", "DrFuel", "DrFuel");
                String QueryString = "SELECT clientId , serviceId , requestDate , requestTime , price, quantity  ,  completeDate, completeTime  from serviceDeliveredInfo where clientId=? and status=?";

                statement = connection.prepareStatement(QueryString, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                statement.setString(1, (String) (session.getAttribute("email")));
                statement.setString(2, "success");
                rs = statement.executeQuery();%>

        <%int rowcount = 0;
            if (rs.last()) {
                rowcount = rs.getRow();
                rs.beforeFirst();
            }%>


        <% if (rowcount == 0) { %>

        <h1> No Past requests.. </h1>

        <% } else { %>
        <h2>View Past Request</h2>
        <table id="dataTable1"> 

            <tr>
                <th>Your Id</th>
                <th>Service</th>
                <th>Request Date</th>
                <th>Request Time</th>
                <th>Total Price(Rupess)</th>
                <th>Total Quantity(Litre's)</th>
                <th>Complete Date</th>
                <th>Complete Time</th>
                <th>Submit your Review</th>
            </tr>

            <% while (rs.next()) {%>

            <TR>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
                <td><%=rs.getString(8)%></td>
                <% String urlStringReview = "AddReview?email=" + rs.getString(1) + "&rdate=" + rs.getString(3) + "&rtime=" + rs.getString(4);%>
                <td><a class="btn btn-primary" href="<%=urlStringReview%>">Click to give Review</a></td>
            </TR>

            <% } %>
            <%
                    rs.close();
                    statement.close();
                    connection.close();
                }
            } catch (Exception ex) { %>
            <% System.out.println(ex);
                }%>
        </table>
        <h1><a href="Home.jsp" style="font-size: 20px; margin: 20px; padding: 10px"  class="btn-primary">Home</a></h1>
    </body>

</html>