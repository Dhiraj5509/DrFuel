<!DOCTYPE html>
<html lang="en">
    <head>
        <title>How To Create Feedback Form With Star Rating HTML</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: arial;
            }

            .star-rating .thanks-msg {
                /*display: none;*/
                font-size: 20px;
                margin: 40px auto;
                color: #4caf50;
                background-color: rgba(76, 175, 80, 0.1411764705882353);
                padding: 8px 20px;
                border-left: 3px solid #4caf50;
                border-radius: 20px;
            }
            .star-rating input {
                display: none;
            }

            .star-rating {
                margin: 50px auto;
                display: table;
                width: 350px;
            }
            .star-rating label {
                padding: 10px;
                float: right;
                font-size: 44px;
                color: #eee;
            }
            .star-rating input:not(:checked) ~ label:hover,
            .star-rating input:not(:checked) ~ label:hover ~ label {
                color: #ffc107;
            }
            .star-rating input:checked ~ label {
                color: #ffc107;
            }
            .star-rating .rating-reaction:before {
                width: 100%;
                float: left;
                color: black;
            }
             #rating-1:checked ~  .rating-reaction:before {

                content: "I hate it";
            }
             #rating-2:checked ~  .rating-reaction:before {
                content: "I don't like it";
            }
             #rating-3:checked ~  .rating-reaction:before {
                content: "It is good";
            }
            #rating-4:checked ~ .rating-reaction:before {
                content: "I like it";
            }
            #rating-5:checked ~ .rating-reaction:before {
                content: "I love it";
            }
            .star-rating input:checked ~ form {
                border-top: 1px solid #ddd;
                width: 100%;
                padding-top: 15px;
                margin-top: 15px;
                display: inline-block;
            }
             .rating-reaction {
                font-size: 24px;
                float: left;
                text-transform: capitalize;
                background: lightgrey;

            }
            .star-rating form .submit-rating {
                border: none;
                outline: none;
                background: #795548;
                color: #ffc107;
                font-size: 18px;
                border-radius: 4px;
                padding: 5px 15px;
                cursor: pointer;
                float: right;
            }
            form .submit-rating:hover {
                background-color: #333;
            }
            
        </style>
    </head>

    <body>
        <script type="text/javascript">
            $(window).on('load', function () {
                $('#myModal').modal('show');
            });
        </script>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <form action="SubmitReview">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Feedback Form</h4>
                        </div>
                        <div class="modal-body">

                            <div class="star-rating">
                                <div class="thanks-msg">Thanks for your feedback !!!</div>
                                <div class="star-input">

                                    <input type="text" hidden name="email" value="<%=request.getParameter("email")%>"/>
                                    <input type="text" hidden name="rdate" value="<%=request.getParameter("rdate")%>"/>
                                    <input type="text" hidden name="rtime" value="<%=request.getParameter("rtime")%>"/>

                                    <input type="radio" required value="5" name="rating" id="rating-5">
                                    <label for="rating-5" class="fas fa-star"></label>
                                    <input type="radio" value="4" name="rating" id="rating-4">
                                    <label for="rating-4" class="fas fa-star"></label>
                                    <input type="radio" value="3" name="rating" id="rating-3">
                                    <label for="rating-3"  class="fas fa-star"></label>
                                    <input type="radio" value="2"name="rating" id="rating-2">
                                    <label for="rating-2" class="fas fa-star"></label>
                                    <input type="radio" value="1" name="rating" id="rating-1">
                                    <label for="rating-1" class="fas fa-star"></label>

                                    <span class="rating-reaction"></span>


                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            
                            <button type="button"   class="btn btn-default" onclick="onClose()" >Close</button>
                            <button type="submit" class="btn btn-primary">Submit Review</button>
                        </div>
                    </form>
                </div>


            </div>
        </div>

        <script>
            function onClose()
            {
                window.location.href = 'Home.jsp'; //Will take you to Google.
            }
        </script>

    </body>
</html>