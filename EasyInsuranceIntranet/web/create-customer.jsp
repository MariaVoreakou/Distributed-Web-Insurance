<%-- 
    Document   : create-customer
    Created on : Jan 12, 2017, 11:54:22 AM
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create new customer</title>
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
                    <form action="createCustomer" method="post">
                        <div class="div-inner half_48 p-style-form">
                            <p class="p-style-form-title">Στοιχεία Πελάτη</p>

                            <div class="half_48">
                                <p>Όνομα: </p>
                                <p>Επώνυμο:</p>                                
                                <p>E-mail:</p>
                                <p>Password:</p>
                                <p>Α.Δ.Τ.:</p>

                                <p>Α.Φ.Μ.:</p>
                                <p>Ημερομηνία Διπλώματος:</p>

                            </div>

                            <div class="half_48">
                                <p><input type="text" name="name" pattern="[A-Za-zΑ-Ωα-ω]{4-20}" required></p>
                                <p><input type="text" name="surname" pattern="[A-Za-zΑ-Ωα-ω]{4-20}" required></p>
                                <p><input type="text" name="email" required></p>
                                <p><input type="password" name="password" pattern=".{8,45}" required></p>
                                <p><input type="text" name="adt" pattern="[A-Za-zΑ-Ωα-ω]{1,2}[0-9]{6}" required></p>
                                <p><input type="text" name="afm" pattern="[0-9]{9}" required></p>
                                <p><input type="text" name="date-licence" pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"required></p>

                            </div>
                            <p>*Μορφή ημερομηνίας: ΗΗ/ΜΜ/ΧΧΧΧ</p>

                            <p style="text-align:center;">Ιστορικό Συμβάντων:</p>
                            <p style="text-align:center;"><textarea name="history" rows="6" cols="50"></textarea></p>
                        </div>


                        <div class="div-inner half_48 p-style-form">
                            <p class="p-style-form-title">Στοιχεία Οχήματος</p>

                            <div class="half_48">
                                <p>Αριθμός Κυκλοφορίας:</p> 
                                <p>Έτος Κυκλοφορίας: </p>
                                <p>Κυβικά:</p> 
                                <p>Τύπος: </p>
                                <p>Χρώμα: </p>
                            </div>



                            <div class="half_48">
                                <p><input type="text" name="veh-number" pattern="[A-Za-zΑ-Ωα-ω]{2-4}[0-9]{3-4}" required></p>
                                <p><input type="number" name="veh-year" pattern="[0-9]{4}"required></p>
                                <p><input type="number" name="veh-cc" pattern="[0-9]{1-5}" required></p>
                                <p><select name="veh-type" required>
                                        <option value="car">Αυτοκίνητο</option>
                                        <option value="moto">Μοτοσυκλέτα</option>
                                    </select></p>
                                <p><input type="text" name="veh-color" pattern="[A-Za-z]{2-10}"required></p>
                            </div>


                            <p class="p-style-form-title"><input type="submit" value="Υποβολή"></p>
                        </div>

                    </form>


                </div>


            </div>






        </div>





    </body>
</html>
