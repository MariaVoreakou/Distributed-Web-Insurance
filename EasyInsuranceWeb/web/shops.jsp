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
        <link rel="stylesheet" type="text/css" href="CSS/shops.css">
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
                        <p class="intruction-p">Τα καταστήματα της Easy Insurance</p>




                        <div>
                            <div class="half_18">
                                <p style="font-weight:bold;">Αθήνα</p>
                                <img src="img/athens.jpg" style="height:145px; width: 90%;"></img>
                                <p>Διεύθυνση: Λ. Συγγρού 103-105, 117 45</p>
                                <p>Τηλ. Κέντρο: 18189 ή στο +302130318189 αν βρίσκεστε στο εξωτερικό</p>
                                <p>Fax: 210 90 99 021</p>

                            </div>
                            <div class="half_18">
                                <p style="font-weight:bold;">Θεσσαλονίκη</p>
                                <img src="img/thesaloniki.jpg" style="height:145px; width: 90%;"></img>

                                <p>Διεύθυνση: Μητροπόλεως 13, 546 24</p>
                                <p>Τηλ. Κέντρο: (2310) 021 317, 310, 335, 347, 352 ή στο +302130318189 αν βρίσκεστε στο εξωτερικό</p>
                                <p>Fax: (2310) 021 358</p>

                            </div>
                            <div class="half_18">
                                <p style="font-weight:bold;">Πάτρα</p>
                                <img src="img/patra.jpg" style="height:145px; width: 90%;"></img>

                                <p>Διεύθυνση: Μαιζώνος 51 & Ζαΐμη, 262 21</p>
                                <p>Τηλ. Κέντρο: (2610) 696 816, 06,18, 17 ή στο +302130318189 αν βρίσκεστε στο εξωτερικό</p>
                                <p>Fax: (2610) 696 800</p>

                            </div>
                            <div class="half_18">
                                <p style="font-weight:bold;">Κρήτη</p>
                                <img src="img/kriti.jpg" style="height:145px; width: 90%;"></img>
                                <p>Διεύθυνση: Αποστόλου Παύλου 11, 201 00</p>
                                <p>Τηλ.: (27410) 77 271 - 78 ή στο +302130318189 αν βρίσκεστε στο εξωτερικό</p>
                                <p>Fax: (27410) 77 270</p>


                            </div>
                            <div class="half_18">
                                <p style="font-weight:bold;">Πειραιάς</p>
                                <img src="img/peiraias.jpg" style="height:145px; width: 90%;"></img>
                                <p>Διεύθυνση: Πλ. Ελευθερίας, Μέγαρο «ΗΛΕΚΤΡΑ», 712 01</p>
                                <p>Τηλ. Κέντρο: (2810) 247 752, 53, 54, 55, 57, 58 ή στο +302130318189 αν βρίσκεστε στο εξωτερικό</p>
                                <p>Fax: (2810) 247 769, 50</p>

                            </div>
                            <p class="clear_both"></p>
                        </div>






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
