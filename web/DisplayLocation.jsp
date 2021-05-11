<%-- 
    Document   : DisplayLocation
    Created on : 30 Jan, 2021, 9:48:59 AM
    Author     : LENOVO
--%>

<%@page import="DBProperties.DBConfig"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


    <head>
        <title>Location Info</title>

        <style>
            #dataTable {
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
            body,html{

                text-align: center;
            }
            .container{
                width: 80% ; 
                margin-left: auto;
                margin-right: auto;

            } .action{
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
        <h2>Service Boy Location</h2>
        <div class="container">
            <% try {
                    String connectionURL = "jdbc:mysql://localhost:3306/student";

                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;

                    Class.forName(DBConfig.getdName());
                    connection = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

                    statement = connection.createStatement();

                    String QueryString = "SELECT * from Location";

                    rs = statement.executeQuery(QueryString);%>
            <!--#ffffcc-->
            <TABLE id="dataTable">

                <TR>
                    <TD>
                        <%="Latitude"%>
                    </TD>
                    <TD>
                        <%="Longitude"%>
                    </TD>
                    <TD>
                        <%="Status"%>
                    </TD>
                    <TD>
                        <%="Email"%>
                    </TD>
                    <TD>
                        <%="Date"%>
                    </TD>
                    <TD>
                        <%="Time"%>
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


                </TR>
                <% } %>


                <%
                    rs.close();
                    statement.close();
                    connection.close();
                } catch (Exception ex) { %>
                </font>
                <font  color="red"></b>
                <% out.println("Unable to connect to database.");
                    }%>
            </TABLE>

            </font>
        </div>
        <h1><a href="Admin.html" style="font-size: 20px; margin: 20px; padding: 10px"  class="btn-primary">Home</a></h1>

    </body>

</html>