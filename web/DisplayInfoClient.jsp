
<%@page import="DBProperties.DBConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>


    <head>
        <title>user data</title>

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
        <h2>Client Info</h2>
        <div class="container">
            <% try {
                    String connectionURL = "jdbc:mysql://localhost:3306/student";

                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;

                    Class.forName(DBConfig.getdName());
                    connection = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

                    statement = connection.createStatement();

                    String QueryString = "select u.email , u.password , l.date , l.time , l.ip from Log l inner join users u on u.email=l.email and role='guest' ";

                    rs = statement.executeQuery(QueryString);%>

            <TABLE id="dataTable">

                <TR>
                    <TD>
                        <%="Email"%>
                    </TD>
                    <TD>
                        <%="Password"%>
                    </TD>
                    <TD>
                        <%="Date"%>
                    </TD>
                    <TD>
                        <%="Time"%>
                    </TD>
                    <TD>
                        <%="IP"%>
                    </TD>

                    <TD>
                        <%="Actions"%>
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
                        <% String url = "DeleteClient?email=" + rs.getString(1) + "&page=DisplayInfoClient.jsp";%>
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


        </div>
        <h1><a href="Admin.html" style="font-size: 20px; margin: 20px; padding: 10px"  class="btn-primary">Home</a></h1>
    </body>

</html>