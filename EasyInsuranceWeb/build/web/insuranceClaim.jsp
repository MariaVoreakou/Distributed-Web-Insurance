
<%@page import="Statics.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Easy Insurance</title>
        <link rel="stylesheet" type="text/css" href="CSS/web-main.css">
        <meta charset="UTF-32">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="grey-background">
            <div class="header_outer">                
                <div class="header_left">
                    <a href="index.jsp"><img src="img/logo_insurance.png" alt="Easy Insurance" style="height:145px;margin-left:5%;"></a>
                </div>
                <div class="header_right">
                    <a href="index.jsp"><p class="header_title">Easy Insurance</p></a>
                </div>
            </div>
            <div>
                <div class="sidebar">
                    <div class="div-inner">

                        <%  Cookie cookie = null;
                            Cookie[] cookies = null;
                            cookies = request.getCookies();

                            boolean isLoggedIn = false;

                            if (cookies != null) {
                                for (int i = 0; i < cookies.length; i++) {
                                    cookie = cookies[i];
                                    if (cookie.getName().equalsIgnoreCase("email")) {
                                        if (cookie.getValue().equalsIgnoreCase("")) {

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
                            } else {
                                out.print(Util.getMenu());
                            }

                            String customerID = "";

                            for (int i = 0; i < cookies.length; i++) {
                                cookie = cookies[i];
                                if (cookie.getName().equalsIgnoreCase("customerID")) {
                                    customerID = cookie.getValue();
                                }
                            }

                        %>
                    </div>
                </div>
                <div class="outer-content">

                    <% out.print(Util.getHeader());%>
                    <div class="inner-content">
                        <div>
                            <p class="intruction-p" style="font-weight:bold;">Δημιουργία αίτησης για αποζημίωση τρίτου </h1>
                            <form action="submitCompensation" method="post">
                                <table class="tcomp">
                                    <tr>
                                        <th class="tg-69p6">Αριθμός Κυκλοφορίας Ιδίου Οχήματος</th>
                                        <th class="tg-2thk"><input name="vehLicense" type="text" pattern="[A-Za-zΑ-Ωα-ω]{1,3}[0-9]{1,4}" placeholder="Αριθμός Κυκλοφορίας"></th>
                                    </tr>
                                    <tr>
                                        <td class="tg-69p6">Ποσό</td>
                                        <td class="tg-2thk"><input name="cost" type="number" pattern="[0-9]" placeholder="Ποσό"></td>
                                    </tr>
                                </table>
                                <input type="hidden" name="customerID" value="${cookie.customerID.value}">
                                <br/>
                                <p style="text-align: center;"><input type="submit"></p>
                            </form>
                        </div>
                    </div>
                </div>   
                <p class="clear_both"></p>
            </div>

           

        </div>
        <div class="footer_outer" >
            <p class="intruction-p" style="padding-top: 20px;">Copyright © 2017 <span class="footer_title">Easy Insurance</span></p>

        </div>

    </body>
</html>
