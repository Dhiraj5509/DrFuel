<!DOCTYPE html>
<html>
    <head>
        <title>Add Service boy</title>
        <style>
            input[type=text], input[type=password] , select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type=submit] {
                width: 15%;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }

            div {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
            }

        </style>
    </head>

    <body>

        <h3>Add Service Boy Details</h3>
        <script>
            var check = function () {
                if (document.getElementById('password').value === document.getElementById('cpassword').value) {
                    document.getElementById('message').style.color = 'green';
                    document.getElementById("dis").disabled = false;
                    document.getElementById('message').innerHTML = 'Password and Confirm password match!';
                    document.getElementById("dis").style.cursor = "pointer";
                } else {
                    document.getElementById('message').style.color = 'red';
                    document.getElementById("dis").disabled = true;
                    document.getElementById("dis").style.cursor = "not-allowed";
                    document.getElementById('message').innerHTML = 'Password and Confirm password does not match!';


                }
            }
        </script>
        <div>
            <form action="AddServiceBoy">
                <label for="email">Email</label>
                <input type="text" id="email" name="email" required placeholder="Your id ..">

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required  onkeyup="check()" placeholder="Your Password..">

                <label for="cpassword">Confirm Password</label>
                <input type="password" id="cpassword" name="cpassword" required onkeyup="check()" placeholder="Confirm Password..">
                <p id="message"></p>
                <input type="submit" value="Submit" id="dis">
            </form>
        </div>
         <h1><a href="Admin.html" style="font-size: 20px; margin: 20px; padding: 10px"  class="btn-primary">Home</a></h1>
   
    </body>
</html>
