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
        <link rel="stylesheet" type="text/css" href="CSS/offers.css">
        <meta charset="UTF-8">
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






            <div class="sidebar">
                <div class="div-inner">

                    <% Cookie cookie = null;
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
                            out.print("<p class=\"intruction-p\"> Σύνδεση χρήστη</p>"
                                    + "<form action=\"LoginServlet\" method=\"post\">"
                                    + "<p class=\"intruction-p\">&nbsp;&nbsp;&nbsp;Email: <input type=\"text\" name=\"email\"></p>"
                                    + "<p class=\"intruction-p\">Password: <input type=\"password\" name=\"password\"></p>"
                                    + "<p class=\"intruction-p\"><input type=\"submit\" value=\"Submit\"></p>"
                                    + "</form>");
                        } else {
                            out.print(Util.getMenu());
                        }%>
                </div>
            </div>







            <div class="outer-content">


                <% out.print(Util.getHeader());%>

                <div class="inner-content">
                    <div class="white-back">
                        <p class="intruction-p">Προσφορές για νέους και υφιστάμενους πελάτες!</p>

                        <table class="tg">
                            <tr>
                                <th class="tg-qcsc">Kυβικά</th>
                                <th class="tg-uy8z">Ποσό/έτος</th>
                                <th class="tg-ri1t">Εμπειρία σε έτη (έκπτωση)</th>
                            </tr>
                            <tr>
                                <td class="tg-yw4l">Έως 1000</td>
                                <td class="tg-yw4l">250 ευρώ</td>
                                <td class="tg-s6z2" rowspan="4">10% ανά 10ετία</td>
                            </tr>
                            <tr>
                                <td class="tg-yw4l">1000-1400</td>
                                <td class="tg-yw4l">300 ευρώ</td>
                            </tr>
                            <tr>
                                <td class="tg-yw4l">1400-1800</td>
                                <td class="tg-yw4l">350 ευρώ</td>
                            </tr>
                            <tr>
                                <td class="tg-yw4l">&gt; 1800</td>
                                <td class="tg-yw4l">450 ευρώ</td>
                            </tr>
                        </table>






                        <div>
                        </div>
                    </div>   
                    <p class="clear_both"></p>
                </div>
            </div>
            <p class="clear_both"></p>

           


        </div>
        <div class="footer_outer" >
            <p class="intruction-p" style="padding-top: 20px;">Copyright © 2017 <span class="footer_title">Easy Insurance</span></p>

        </div>


    </body>
</html>
