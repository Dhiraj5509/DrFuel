<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Fuel</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@page import="Fuel.FuelInfo" %>
        <%
            float fuelPrice = FuelInfo.getFuelPrice();
        %>


        <script type="text/javascript">
            $(window).on('load', function () {
                $('#myModal').modal('show');
            });
        </script>

        <div class="modal fade" id="myModal" role="dialog">
            <form action="PriceController">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Set Fuel Price</h4>
                        </div>
                        <div class="modal-body">
                            Fuel Price: <input type="number" name="price" value="<%=fuelPrice%>"   />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" onclick="onClose()" >Close</button>
                            <button type="submit" class="btn btn-primary">Change Price</button>
                        </div>

                        <div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <script>
            function onClose()
            {
                window.location.href = 'Admin.html'; //Will take you to Google.
            }
        </script>

    </body>
</html>
