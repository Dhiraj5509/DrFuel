
<%@page import="DBProperties.DBConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>


    <head>
        <title>Delivery data</title>

        <style>

            #dataTable {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }
            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 20px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
            body,html{

                text-align: center;
            }
            .container{
                width: 100% ; 
                margin-left: auto;
                margin-right: auto;

            }
            .action{
                padding-left:7px ;
                color: red;
                text-decoration: none; 
            }
            a:hover {
                text-decoration: underline;
            }
            table.center{
                margin-left: auto ; 
                margin-right: auto ; 
            }
        </style>

    </head>

    <body>
        <h2>Delivery Info</h2>
        <div class="container">
            <% try {
                    String connectionURL = "jdbc:mysql://localhost:3306/student";

                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;
                    ResultSet rs2 = null;
                    Class.forName(DBConfig.getdName());
                    connection = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

                    statement = connection.createStatement();

                    String QueryString = "select sdi.* , dl.district , dl.state from SERVICEDELIVEREDINFO sdi inner join DELIVERYLOG dl on sdi.CLIENTID=dl.CLIENTID and sdi.REQUESTDATE=dl.REQUESTDATE and sdi.REQUESTTIME = dl.REQUESTTIME";

                    rs = statement.executeQuery(QueryString);%>

            <TABLE id="dataTable">

                <TR>
                    <TD>
                        Customer Id
                    </TD>
                    <TD>
                        Request Date
                    </TD>
                    <TD>
                        Request Time
                    </TD>
                    <TD>
                        Latitude
                    </TD>
                    <TD>
                        Longitude
                    </TD>
                    <TD>
                        Status
                    </TD>    
                    <td>
                        Service Boy ID
                    </td>
                    <td>
                        Complete Time
                    </td>
                    <TD>
                        Complete Date
                    </TD>
                    <td>Total Price</td>

                    <td>Quantity(Litre)</td>
                    <td>Time limit</td>
                    <td>District</td>
                    <td>State</td>
                    <TD>
                        Actions
                    </TD>

                </TR>     
                <%! int count = 0;%>
                <% while (rs.next()) {%>
                <TR>

                    <TD>
                        <%=rs.getString(1)%>
                    </TD>
                    <TD>
                        <%=rs.getString(2)%>
                    </TD>
                    <TD>
                        <%=rs.getString(3)%>
                    </TD>
                    <TD>
                        <%=rs.getString(4)%>
                    </TD>
                    <TD>
                        <%=rs.getString(5)%>
                    </TD>
                    <TD>
                        <%=rs.getString(6)%>
                    </TD>
                    <TD>
                        <%=rs.getString(7)%>
                    </TD>
                    <TD>
                        <%=rs.getString(8)%>
                    </TD>
                    <TD>
                        <%=rs.getString(9)%>
                    </TD>
                    <TD>
                        <%=rs.getString(10)%>
                    </TD>
                    <TD>
                        <%=rs.getString(11)%>
                    </TD>
                    <TD>
                        <%=rs.getString(12)%>
                    </TD>
                    <TD>
                        <%=rs.getString(13)%>
                    </TD>
                    <TD>
                        <%=rs.getString(14)%>
                    </TD>
                    <TD>
                        <% String url = "DeleteDelivery?email=" + rs.getString(1) + "&date=" + rs.getString(2) + "&time=" + rs.getString(3);%>
                        <% String url1 = "UpdateDelivery.jsp?clientId=" + rs.getString(1) + "&rdate=" + rs.getString(2) + "&rtime=" + rs.getString(3) + "&latitude=" + rs.getString(4) + "&longitude=" + rs.getString(5) + "&status=" + rs.getString(6) + "&serviceId=" + rs.getString(7) + "&ctime=" + rs.getString(8) + "&cdate=" + rs.getString(9);%>                                                  

<!--<a href="<%=url1%>" class="action">Update</a>-->
                        <a href="<%=url%>" class="action">Delete</a>

                    </TD>

                </TR>
                <% } %>


                <%
                    rs.close();
                    statement.close();
                    connection.close();
                } catch (Exception ex) { %>

                <font  color="red"></b>
                <% out.println("Unable to connect to database.");
                    }%>
            </TABLE>

            <h1><a href="Admin.html" style="font-size: 20px; margin: 20px; padding: 10px"  class="btn-primary">Home</a></h1>

        </div>
    </body>

</html>