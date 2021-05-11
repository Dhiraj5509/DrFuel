
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="bootstrap.min.css">


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Page</title>
        
        
    </head>
    <body>
       
        <div class="container" >
            <div class="col-lg-4"> </div>
            <div class="col-lg-4">
                <div class="jumbotron" style="margin-top: 150px">
                    <h3>Please Enter verification code!</h3><br>

                    <form action="VerifyCode" method="post">
                        <span>A verification code has been sent to your mail!</span>
                        <input type="text" name="otp">
                        <input type="submit" style="margin-top:10px;" name="verify">

                    </form>
                </div>
            </div>

            <div class="col-lg-4"></div>
        </div>

    </div>
</div>
</div>

</body>
</html>
