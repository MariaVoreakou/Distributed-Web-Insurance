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
        <link rel="stylesheet" type="text/css" href="CSS/policy.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="grey-background-policy">
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
                        <p class="intruction-p">Τιμολογιακή Πολιτική της Easy Insurance</p>

                        <p>
                            H easyInsurance Ασφαλιστική δημιούργησε τον δικτυακό τόπο easyInsurance με σκοπό την παροχή πληροφοριών και υπηρεσιών στους χρήστες σχετικά με τα ασφαλιστικά προϊόντα που προσφέρει, όπως επίσης και την δυνατότητα τιμολόγησης και online ασφάλιση οχημάτων. Η χρήση του easyInsurance διέπεται από τους παρόντες όρους και προϋποθέσεις, τους οποίους οι χρήστες καλούνται να διαβάσουν προσεκτικά και να συμμορφώνονται με αυτούς. Η χρήση του easyInsurance συνεπάγεται ανεπιφύλακτη αποδοχή των παρόντων Όρων Χρήσης.
                        </p>
                        <p>
                            Οι επισκέπτες που κάνουν χρήση του δικτυακού τόπου easyInsurance συμφωνούν και αποδέχονται τα κατωτέρω:
                        </p>
                        <p>
                            Ο δικτυακός τόπος easyInsurance χρησιμοποιείται «ως έχει», χωρίς την δυνατότητα τροποποιήσεων ή άλλων παρεμβάσεων από τους χρήστες. Με την επιφύλαξη συγκεκριμένων δικαιωμάτων τρίτων, όλο το περιεχόμενο που περιέχεται στον δικτυακό τόπο easyInsurance, όπως ενδεικτικά σήματα, διακριτικά γνωρίσματα, σχέδια, κείμενα, φωτογραφίες κλπ., αποτελεί πνευματική ιδιοκτησία της easyInsurance Ασφαλιστική και προστατεύεται από τις σχετικές διατάξεις του ελληνικού, κοινοτικού και διεθνούς δικαίου. Το περιεχόμενο αυτό δεν δύναται να αποτελέσει εν όλο ή εν μέρει αντικείμενο εμπορίου, αντιγραφής, αναπαραγωγής, αναμετάδοσης με οποιονδήποτε τρόπο χωρίς τη προηγούμενη γραπτή άδεια των δικαιούχων.
                        </p>
                        <p>
                            Τα εμπορικά σήματα και λογότυπα από τις ασφαλιστικές εταιρείες που χρησιμοποιούνται αποτελούν πνευματική ιδιοκτησία των ίδιων και χρησιμοποιούνται μόνον προς ενημέρωση των επισκεπτών της ιστοσελίδας.
                        </p>
                        <p>
                            Οι πληροφορίες που καταχωρούνται από εσάς στην ιστοσελίδα θα πρέπει να είναι αληθείς και σωστές. Σε διαφορετική περίπτωση η προσφορά για την ασφάλιση καθίσταται άκυρη και δεν ισχύει.
                        </p>
                        <p>
                            Η έναρξη ασφάλισης είναι δυνατό να ισχύσει το νωρίτερο την επομένη εργάσιμη ημέρα από την καταχώριση της αίτησης για ασφάλιση και εφόσον προηγηθεί η αποδοχή της ασφάλισης από την ασφαλιστική εταιρεία που έχετε επιλέξει.
                        </p>
                        <p>
                            Μετά την καταχώριση της αίτησης για ασφάλιση στο easyInsurance, υποχρεούστε να μας παράσχετε κάθε πιθανό παραστατικό (άδεια κυκλοφορίας, άδεια οδήγησης κ.λ.π.) το οποίο θα απαιτηθεί από την ασφαλιστική εταιρεία προκειμένου να κάνει αποδεκτή την αίτηση ασφάλισης του οχήματός σας.
                        </p>
                        <p>
                            Η καταχώριση της αίτησης για ασφάλιση δεν αποτελεί ασφαλιστήριο συμβόλαιο και δεν δεσμεύει την ISXYS insurance ούτε και την ασφαλιστική εταιρεία. Η ισχύς του ασφαλιστηρίου συμβολαίου θα είναι δυνατή μόνο εφόσον αποσταλεί από εμάς και κατά περίπτωση το προσωρινό σήμα ασφάλισης ή το ασφαλιστήριο συμβόλαιο.
                        </p>
                        <p>
                            Εάν το ασφαλιστήριο συμβόλαιο παρεκκλίνει σε σχέση με τα καταχωρηθέντα στοιχεία της αίτησης για ασφάλιση, σας δίνεται το δικαίωμα επιστροφής του ασφαλιστηρίου συμβολαίου σας εντός 30 ημερών. Εφόσον δεν υπάρχει παρέκκλιση αλλά επιθυμείτε για οποιοδήποτε λόγο να επιστρέψετε το ασφαλιστήριο συμβόλαιο, μπορείτε να το πράξετε σε διάστημα 14 ημερών.
                        </p>
                        <p>
                            Η Easy insurance υποχρεούται και στις δύο ανωτέρω περιπτώσεις να σας επιστρέψει στο ακέραιο το ποσό που έχετε καταβάλει.
                        </p>
                        <p>
                            Οποιαδήποτε τυχόν έκπτωση δοθεί από την easyInsurance Ασφαλιστική προς τους πελάτες της δεν έχει καμία σχέση με την τιμολογιακή πολιτική της εκάστοτε ασφαλιστικής εταιρείας.

                        </p>
                        <p>
                            Καταβάλλεται κάθε δυνατή προσπάθεια ώστε να εξασφαλιστεί η ασφάλεια στη χρήση καθώς και η ακρίβεια και η εγκυρότητα των πληροφοριών που περιέχονται στον δικτυακό τόπο, ωστόσο σε καμία περίπτωση η easyInsurance Ασφαλιστική δεν δεσμεύονται, ούτε εγγυώνται, ούτε αναλαμβάνουν κανενός είδους ευθύνη αναφορικά με την ασφάλεια και το περιεχόμενο του easyInsurance. εκτός αν το αντίθετο προβλέπεται ρητά. Για τον λόγο αυτό, οι χρήστες αποδέχονται ότι πρέπει να αξιολογούν το περιεχόμενο και ότι είναι υπεύθυνοι για κάθε κίνδυνο που μπορεί να προκαλέσει η χρήση του easyInsurance.
                            Ο δικτυακός τόπος δεν ευθύνεται για οποιοδήποτε λάθος ή ανακρίβεια στη διαβίβαση πληροφοριών και/ή εντολών από τον χρήστη, παρεμβολές, εσφαλμένη αναγραφή στοιχείων ή μη λειτουργία του συστήματος λόγω ανωτέρας βίας ή για οποιοδήποτε άλλο λόγο.
                        </p>
                        <p>
                            Οι σύνδεσμοι σε άλλους δικτυακούς τόπους που τυχόν υπάρχουν στο easyInsurance παρέχονται αποκλειστικά για την εξυπηρέτηση των χρηστών. Η easyInsurance Ασφαλιστική δεν αναλύουν ή ελέγχουν τις πληροφορίες που περιέχονται στους εν λόγω συνδέσμους και δικτυακούς τόπους και δεν ευθύνονται για το περιεχόμενό τους. Κατά συνέπεια η χρήση και η πρόσβαση στους συνδεόμενους δικτυακούς τόπους γίνεται με ευθύνη των χρηστών και σε κάθε περίπτωση η easyInsurance Ασφαλιστική δεν φέρουν καμία ευθύνη αναφορικά με τις πληροφορίες που περιέχονται στους εν λόγω συνδέσμους και δικτυακούς τόπους. Επίσης η easyInsurance Ασφαλιστική δεν φέρει καμία ευθύνη για τους όρους χρήσης και την πολιτική ασφαλείας των ανωτέρω δικτυακών τόπων ή για τον τρόπο με τον οποίο διαχειρίζονται τους ηλεκτρονικούς τους επισκέπτες. Για τον λόγο αυτό οι χρήστες οφείλουν να συμμορφώνονται με τους όρους χρήσης των εν λόγω δικτυακών τόπων και να απευθύνονται στους παρόχους αυτών για οτιδήποτε προκύψει από την σχετική επίσκεψη ή και χρήση αυτών.
                        </p>
                        <p>
                            Η easyInsurance Ασφαλιστική θα καταβάλλει εύλογες προσπάθειες για να διασφαλίσει τη διαθεσιμότητα του δικτυακού τόπου easyInsurance και των υπηρεσιών που προσφέρει. Παρά ταύτα, η διαθεσιμότητα του easyInsurance μπορεί να επηρεάζεται από τον εξοπλισμό των χρηστών, άλλα δίκτυα επικοινωνιών, ή από άλλες αιτίες.
                        </p>
                        <p>
                            Σε κάθε περίπτωση η easyInsurance Ασφαλιστική έχει το δικαίωμα οποτεδήποτε, με ή χωρίς προειδοποίηση, να διακόπτει προσωρινά ή οριστικά την λειτουργία ολόκληρου ή τμήματος του easyInsurance, να μεταβάλλει την φύση και το περιεχόμενό του, για λόγους συντήρησης, αναβάθμισης ή για οποιονδήποτε άλλο λόγο. Η easyInsurance Ασφαλιστική δεν φέρει καμία ευθύνη για οποιουδήποτε είδους ζημία προκληθεί από την χρήση ή την αδυναμία πρόσβασης των χρηστών στο easyInsurance, την διακοπή του συνόλου ή τμήματος αυτού, την καθυστέρηση ή κακή ποιότητα λήψης των υπηρεσιών του ή απώλειας του περιεχόμενου τους, ή την ύπαρξη κάθε είδους σφαλμάτων.
                        </p>
                        <p>
                            Σε κάθε περίπτωση η easyInsurance Ασφαλιστική έχει το δικαίωμα οποτεδήποτε, με ή χωρίς προειδοποίηση, να διακόπτει προσωρινά ή οριστικά την λειτουργία ολόκληρου ή τμήματος του easyInsurance, να μεταβάλλει την φύση και το περιεχόμενό του, για λόγους συντήρησης, αναβάθμισης ή για οποιονδήποτε άλλο λόγο. Η easyInsurance Ασφαλιστική δεν φέρει καμία ευθύνη για οποιουδήποτε είδους ζημία προκληθεί από την χρήση ή την αδυναμία πρόσβασης των χρηστών στο easyInsurance, την διακοπή του συνόλου ή τμήματος αυτού, την καθυστέρηση ή κακή ποιότητα λήψης των υπηρεσιών του ή απώλειας του περιεχόμενου τους, ή την ύπαρξη κάθε είδους σφαλμάτων.

                        </p>
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
