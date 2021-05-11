<%-- 
    Document   : UpdateDelivery
    Created on : 19 Feb, 2021, 8:17:25 PM
    Author     : LENOVO
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>


    <body>
        <% String clientId = request.getParameter("clientId"); %>
        <% String rdate = request.getParameter("rdate"); %>
        <% String rtime = request.getParameter("rtime"); %>
        <% String latitude = request.getParameter("latitude"); %>
        <% String longitude = request.getParameter("longitude"); %>
        <% String status = request.getParameter("status"); %>
        <% String serviceId = request.getParameter("serviceId"); %>
        <% String ctime = request.getParameter("ctime"); %>
        <% String cdate = request.getParameter("cdate");%>

        <div class="container">
            <h2>Please fill the below form to update the record</h2>
            <form action="UpdateDelivery">
                <div class="form-group">
                    <label for="email">Client Email:</label>
                    <input type="email" class="form-control" id="email" readonly="readonly"  name="clientId" value="<%=clientId%>">
                </div>
                
                
                <div class="form-group">
                    <label for="rdate">Request Date</label>
                    <input type="text" class="form-control" id="rdate" readonly="readonly"  name="rdate" value="<%=rdate%>">
                </div>
                
                <div class="form-group">
                    <label for="rtime">Request Time</label>
                    <input type="text" class="form-control" id="rtime" readonly="readonly"  name="rtime" value="<%=rtime%>">
                </div>
                
                <div class="form-group">
                    <label for="latitude">Latitude</label>
                    <input type="text" class="form-control" id="latitude"  name="latitude" value="<%=latitude%>">
                </div>
                
                <div class="form-group">
                    <label for="longitude">Latitude</label>
                    <input type="text" class="form-control" id="longitude"  name="longitude" value="<%=longitude%>">
                </div>
                
                <div class="form-group">
                    <label for="status">Status</label>
                    <input type="text" class="form-control" id="status"  name="status" value="<%=status%>">
                </div>
                
                <div class="form-group">
                    <label for="serviceId">Service Boy ID</label>
                    <input type="text" class="form-control" id="serviceId"  name="serviceId" value="<%=serviceId%>">
                </div>
                
                <div class="form-group">
                    <label for="ctime">Complete Time</label>
                    <input type="text" class="form-control" id="ctime"  name="ctime" value="<%=ctime%>">
                </div>
                
                <div class="form-group">
                    <label for="rtime">Complete Date</label>
                    <input type="text" class="form-control" id="cdate"  name="cdate" value="<%=cdate%>">
                </div>
                
                <button type="submit" class="btn btn-default">Update Now</button>
            </form>
        </div>
    </body>
</html>