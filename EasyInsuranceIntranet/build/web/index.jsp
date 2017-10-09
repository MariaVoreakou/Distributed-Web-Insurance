<%-- 
    Document   : index
    Created on : Jan 12, 2017, 11:05:26 AM
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Easy Insurance Intranet</title>
        <link rel="stylesheet" type="text/css" href="CSS/Main.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="grey-background">
            <div class="header_outer">                
                <div class="header_left">
                    <img src="img/logo_insurance.png" alt="Easy Insurance" style="height:145px;margin-left:5%;">
                </div>
                <div class="header_right">
                    <p class="header_title">Easy Insurance</p>
                </div>
            </div>



            <div class="login-form-outer">
                <div class="login-form">
                    <p class="intruction-p"> Login to intranet</p>

                    <form action="LoginServlet" method="post">
                        <p class="intruction-p">Username: <input type="text" name="username"></p>
                        <p class="intruction-p">Password: <input type="password" name="password"></p>
                        <p class="intruction-p"><input type="submit" value="Submit"></p>
                    </form>
                </div>
            </div>

            <div class="footer_outer">
                <p class="intruction-p">Copyright © 2017 Easy Insurance</p>
                
            </div>

        </div>


    </body>
</html>
