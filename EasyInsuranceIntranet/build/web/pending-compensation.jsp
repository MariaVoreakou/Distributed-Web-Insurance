<%-- 
    Document   : pending-compensation
    Created on : Jan 12, 2017, 11:55:16 AM
    Author     : Maria
--%>

<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pending Compensations</title>
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
                        if (cookie.getValue().equalsIgnoreCase("")) {
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


            <div class="div-welcome-user-pages">
                <div class="half_48">
                    <p>Welcome  ${cookie.first_name.value}  ${cookie.last_name.value}</p>
                </div>
                <div class="half_48">
                    <p style="text-align:right;"><a class="a-style-logout" href="logout">Logout</a></p>
                </div>
                <p class="clear_both"></p>
            </div>

            <div class="sidebar">
                <div class="div-inner">
                    <p class="p-style-form-title">Menu</p>
                    <ul>
                        <li class="li-style-s"><a class="a-style" href="create-customer.jsp">Create new customer</a></li>
                        <li class="li-style-s"><a class="a-style" href="add-vehicle.jsp">Add new vehicle to existing customer</a></li>
                        <li class="li-style-s"><a class="a-style" href="new-compensation.jsp">Add new compensation</a></li>
                        <li class="li-style-s"><a class="a-style" href="pendingCompensations">Pending Compensations</a></li>
                    </ul>
                </div>
            </div>


            <div class="form-customer"> 
                <div>

                    <div class="div-inner p-style-form">
                        <p class="p-style-form-title">Εκκρεμείς Αιτήσεις Αποζημίωσης</p>


                        <table class="table-comp center">
                            <tr>
                                <th>Α/Α</th>
                                <th>Αριθμός Κυκλοφορίας</th>
                                <th>Ποσό</th>
                                <th>Ενέργεια</th>
                            </tr>
                            <%
                                for (int i = 0; i < cookies.length; i++) {
                                    cookie = cookies[i];
                                    if (cookie.getName().contains("compen")) {
                                        out.print(URLDecoder.decode(cookie.getValue()));
                                        cookies[i].setMaxAge(-1);
                                        cookies[i].setValue(null);
                                        cookies[i].setValue("");
                                        response.addCookie(cookie);                                        
                                    }                                    
                                }
                            %>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
