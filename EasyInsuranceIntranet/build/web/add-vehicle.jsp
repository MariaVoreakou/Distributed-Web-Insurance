<%-- 
    Document   : add-vehicle
    Created on : Jan 12, 2017, 11:53:46 AM
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add new vehicle</title>
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
                    <form action="createVehicle" method="post">
                        <div class="div-inner p-style-form">
                            <p class="p-style-form-title">Προσθήκη νέου οχήματος σε υπάρχων πελάτη</p>

                            <div class="half_48 text-right">
                                <p>Α.Φ.Μ.:</p>
                            </div>

                            <div class="half_48">
                                <p><input type="number" name="afm" pattern="[0-9]{9}" required></p>
                            </div>
                            <p class="p-style-form-title">Στοιχεία Οχήματος</p>

                            <div class="half_48 text-right">
                                <p>Αριθμός Κυκλοφορίας:</p> 
                                <p>Έτος Κυκλοφορίας: </p>
                                <p>Κυβικά:</p> 
                                <p>Τύπος: </p>
                                <p>Χρώμα: </p>
                            </div>
                            <div class="half_48">
                                <p><input type="text" name="veh-number" pattern="[A-Za-z]{2-4}[0-9]{3-4}" required></p>
                                <p><input type="number" name="veh-year" pattern="[0-9]{4}" required></p>
                                <p><input type="number" name="veh-cc" pattern="[0-9]{1-5}" required></p>
                                <p><select name="veh-type" required>
                                        <option value="car">Αυτοκίνητο</option>
                                        <option value="moto">Μοτοσυκλέτα</option>
                                    </select></p>
                                <p><input type="text" name="veh-color" pattern="[A-Za-z]{2-10}"required></p>
                            </div>
                            <p class="clear_both"></p>
                            <p class="p-style-form-title"><input type="submit" value="Υποβολή"></p>



                        </div>




                    </form>


                </div>





            </div>
            <p class="clear_both"></p>





        </div>

    </body>
</html>
