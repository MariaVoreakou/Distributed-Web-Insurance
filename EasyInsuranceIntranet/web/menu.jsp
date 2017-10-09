<%-- 
    Document   : menu
    Created on : Jan 8, 2017, 7:29:30 PM
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Menu Easy Insurance</title>
        <link rel="stylesheet" type="text/css" href="CSS/Main.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <% Cookie cookie = null;
            Cookie[] cookies = null;
            cookies = request.getCookies();
            boolean isLoggedIn = false;
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    cookie = cookies[i];
                    if (cookie.getName().equalsIgnoreCase("username")) {
                        if (cookie.getValue().length() < 1) {
                            response.sendRedirect("index.jsp");
                            return;
                        } else {
                            isLoggedIn = true;
                            break;
                        }
                    }
                }
            }
            if (!isLoggedIn) {
                response.sendRedirect("index.jsp");
                return;
            }
        %>
    </head>
    <body>
        <div class="grey-background">
            <div class="header_outer">                
                <div class="header_left">
                    <img src="img/logo_insurance.png" alt="Easy Insurance" style="height:145px;margin-left:5%;">

                </div>
                <div class="header_right">
                    <a href="menu.jsp"><p class="header_title">Easy Insurance</p></a>
                </div>
            </div>
            <div class="div-welcome-user">
                <div class="half_48">
                    <p>Welcome  ${cookie.first_name.value}  ${cookie.last_name.value}</p>
                </div>
                <div class="half_48">
                    <p style="text-align:right;"><a class="a-style-logout" href="logout">Logout</a></p>
                </div>
                <p class="clear_both"></p>
            </div>

            <div class="menu-outer">
                <p class="intruction-p menu-title">Welcome to Easy Insurance</p>
                <div class="menu-inner">
                    <ul>
                        <li class="li-style"><a class="a-style" href="create-customer.jsp">Create new customer</a></li>
                        <li class="li-style"><a class="a-style" href="add-vehicle.jsp">Add new vehicle to existing customer</a></li>
                        <li class="li-style"><a class="a-style" href="new-compensation.jsp">Add new compensation</a></li>
                        <li class="li-style"><a class="a-style" href="pendingCompensations">Pending Compensations</a></li>
                    </ul>
                </div>

            </div>  


        </div>
    </body>
</html>

