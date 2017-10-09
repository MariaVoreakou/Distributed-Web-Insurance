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
        <link rel="stylesheet" type="text/css" href="CSS/safedrive.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="grey-background-safe">
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

                        <p class="intruction-p">ΑΣΦΑΛΗΣ ΟΔΗΓΗΣΗ</p>
                        <p>Οδήγηση στο βρεγμένο</p>
                        <p>1. Ελέγχετε συστηματικά τα ελαστικά σας...</p>
                        <p>Ελέγχετε πάντα τα ελαστικά σας πριν βγείτε στο δρόμο. Βεβαιωθείτε ότι κάνετε την παρακάτω τυπική συντήρηση: Διατηρείτε τα ελαστικά σας σωστά φουσκωμένα. Η σωστή πίεση αέρα για τα ελαστικά σας προσδιορίζεται από τον κατασκευαστή του οχήματος και μπορείτε να τη βρείτε στο άκρο της πόρτας του οχήματος, το στύλο της πόρτας, και το πορτάκι της θήκης ή το πορτάκι των καυσίμων. Αναφέρεται επίσης στο εγχειρίδιο χρήστη. Ο αριθμός που αναφέρεται στο πλαινή όψη του ελαστικού δεν είναι η προτεινόμενη πίεση αέρα-είναι η μέγιστη πίεση αέρα του ελαστικού. Θα πρέπει να ελέγχετε την πίεση αέρα του ελαστικού σας τουλάχιστον μία φορά το μήνα. Ελέγξτε το βάθος πέλματος τών ελαστικών. Το κανονικό βάθος πέλματος σας βοηθά να αποφεύγετε την πλαγιολίσθηση και την υδρολίσθηση.
                        </p>
                        <p>2. Ελαττώστε ταχύτητα.</p>
                        <p>Καθώς πέφτει η βροχή, αναμειγνύεται με ρύπους και λάδι στο οδόστρωμα, δημιουργώντας ιδανικές συνθήκες ολισθηρότητας. Ο καλύτερος τρόπος να αποφύγετε την ολίσθηση είναι να ελαττώσετε ταχύτητα. Η οδήγηση με μικρότερη ταχύτητα επιτρέπει την μεγαλύτερη επαφή του πέλματος με το δρόμο, πράγμα που οδηγεί σε καλύτερη πρόσφυση.
                        </p>
                        <p>3. Μάθετε πώς να ανακτήσετε τον έλεγχο μετά από μια ολίσθηση.</p>
                        <p>Η ολίσθηση μπορεί να προκύψει ακόμη και στους προσεκτικότερους οδηγούς. Αν το αυτοκίνητό σας γλιστρήσει θυμηθείτε να μην πατήσετε απότομα τα φρένα. Μην πατάτε επαναλαμβανόμενα τα φρένα αν έχετε σύστημα φρένων κατά του κλειδώματος των τροχών (ABS). Αντί για αυτό εφαρμόστε έντονη, σταθερή πίεση στα φρένα και οδηγείστε προς την κατεύθυνση της ολίσθησης.
                        </p>
                        <p>4. Κρατάτε απόσταση από το προπορευόμενο αυτοκίνητο.</p>
                        <p>Η οδήγηση στη βροχή απαιτεί προσεκτική χρήση όλων των κύριων σημείων ελέγχου - τιμόνι, συμπλέκτη, φρένα και γκάζι - καθώς και μεγαλύτερο περιθώριο ασφάλειας για πιθανά λάθη και έκτακτες περιπτώσεις. Όταν ξεκινάτε ένα ταξίδι με βροχή, τα παπούτσια σας θα είναι βρεγμένα και θα γλιστράνε εύκολα από τα πεντάλ. Τρίψτε τις σόλες στο πατάκι του αυτοκινήτου πριν βάλετε μπροστά τον κινητήρα. Όλοι οι αυτοκινητιστές θα πρέπει να ελέγχουν τακτικά ότι τα φώτα πορείας τους, τα πίσω φώτα, τα φώτα φρένων και τα φλας δουλεύουν κανονικά. Η απόσταση φρεναρίσμος στο βρεγμένο είναι 3 φορές μεγαλύτερη από ότι σε στο στεγνό.Αφού απαιτείται μεγαλύτερη απόσταση για το φρενάρισμα, είναι σημαντικό να μην κολλάτε στον μπροστινό σας. Κρατήστε κάτι περισσότερο από την απόσταση δύο αυτοκινήτων μεταξύ του αυτοκινήτου σας και του προπορευόμενου οχήματος.
                        </p>
                        <p>5. Οδηγείτε στα ίχνη ενός προπορευόμενου αυτοκινήτου.</p>
                        <p>Αποφύγετε τη χρήση των φρένων σας. Όποτε είναι δυνατό ελαττώστε ταχύτητα παίρνοντας το πόδι σας από το γκάζι. Ανάψτε τα φώτα πορείας σας ακόμη και σε συνθήκες ελαφριάς βροχόπτωσης. Δεν βοηθούν μόνο να έσας να βλέπεται το δρόμο, αλλά βοηθούν και τους άλλους οδηγούς να βλέπουν εσάς. Ανάβετε τα φώτα πορείας σας ώστε είστε αντιλυπτοί από τα οχήματα που σας ακολουθούν.
                        </p>
                        <p>6. Προετοιμαστείτε για το ταξίδι σας.</p>
                        <p>Η οδήγηση στη βροχή απαιτεί προσεκτική χρήση όλων των κύριων σημείων ελέγχου - τιμόνι, συμπλέκτη, φρένα και γκάζι - καθώς και μεγαλύτερο περιθώριο ασφάλειας για πιθανά λάθη και έκτακτες περιπτώσεις. Όταν ξεκινάτε ένα ταξίδι με βροχή, τα παπούτσια σας θα είναι βρεγμένα και θα γλιστράνε εύκολα από τα πεντάλ. Τρίψτε τις σόλες στο πατάκι του αυτοκινήτου πριν βάλετε μπροστά τον κινητήρα. Όλοι οι αυτοκινητιστές θα πρέπει να ελέγχουν τακτικά ότι τα φώτα πορείας τους, τα πίσω φώτα, τα φώτα φρένων και τα φλας δουλεύουν κανονικά.
                        </p>
                        <p>7. Μάθετε πώς να αποφεύγετε και να αντιμετωπίζετε την υδρολίσθηση.</p>
                        <p>Η υδρολίσθηση συμβαίνει όταν ο ρυθμός συσσώρευσης του νερού μπροστά από τα ελασικά σας είναι μεγαλύτερος από αυτών που το βάρος του αυτοκινήτων σας είναι ικανό να απομακρύνει. Η πίεση του νερού αναγκάζει το όχημά σας να ολισθένει πάνω σε ένα λεπτό στρώμα νερού που δημιουργείται ανάμεσα στα ελαστικά σας και τον δρόμο. Σε αυτό το σημείο, το αυτοκίνητό σας μπορεί να χάσει πλήρος την επαφή του με τον δρόμο,διατρέχοντας τον κίνδυνο να γλιστρήσετε ή να βρεθείτε εκτός λωρίδας, ή ακόμη και εκτός δρόμου. Για να αποφύγετε την υδρολίσθηση, διατηρήστε τα ελαστικά σας με την σωστή πίεση αέρα, διατηρήστε καλό πέλμα στα ελαστικά σας και αντικαταστήστε τα όταν πρέπει, ελαττώστε ταχύτητα όταν ο δρόμος είναι βρεγμένος, και μείνετε μακριά από μικρές λίμνες. Δοκιμάστε να οδηγήσετε στα ίχνη ελαστικών από τα προπορευόμενα οχήματα. Αν βρεθείτε να υδρολισθαίνετε, μην φρενάρετε και μην στρίψετε απότομα. Αυτό θα μπορούσε να κάνει το αυτοκίνητό σας να γλιστρήσει. Χαλαρώστε το πόδι σας στο γκάζι μέχρι το αυτοκίνητο να ελαττώσει ταχύτητα και να μπορείτε να αισθανθείτε καλύτερη επαφή με το δρόμο. Αν χρειάζεται να φρενάρετε κάντε το απαλά με ελαφρές επαναλαμβανόμενες κινήσεις. Αν το αυτοκίνητό σας έχει ABS, τότε φρενάρετε κανονικά, ο υπολογιστής του αυτοκινήτου θα προσομοιώσει την επαναλαμβανόμενη κίνηση όποτε είναι απαραίτητο.
                        </p>
                        <p>8. Αν η βροχή είναι πολύ δυνατή σταματήστε!</p>
                        <p>Η δυνατή βροχή μπορεί να υπερφορτώσει τους υαλοκαθαριστήρες, αφήνοντας ένα σχεδόν αδιάκοπο κάλυμμα νερού να καλύπτει το παρμπρίζ. Όταν η ορατότητα είναι τόσο περιορισμένη ώστε τα άκρα του δρόμου ή των άλλων αυτοκινήτων να μην είναι ορατά από απόσταση ασφαλείας, είναι ώρα να βγείτε απο το δρόμο και να περιμένετε να κοπάσει η βροχή. Είναι καλύτερα να σταματήσετε σε χώρους στάθμευσης ή άλλες προστατευμένες περιοχές. Αν η άκρη του δρόμου είναι η μόνη σας επιλογή, κάντε όσο πιο άκρη μπορείτε και περιμένετε να περάσει η καταιγίδα. Κρατήστε τα φώτα πορείας σας αναμμένα και ανάψτε τα φώτα κινδύνου (alarm) για να ειδοποιήτε τους άλλους οδηγούς.
                        </p>
                        <p>9. Οι πρώτες σταγόνες βροχής κάνουν το δρόμο πολύ ολισθηρό.</p>
                        <p>Οι πρώτες σταγόνες βροχής καθιστούν την οδήγηση εξαιρετικά δύσκολη, καθώς η λάσπη και το λάδι στο στεγνό δρόμο συνδυάζονται με το νερό και σχηματίζουν μια ολισθηρή επιφάνεια Οι οδηγοί είναι δυνατόν να αντιμετωπίσουν απώλεια ελέγχου και συνιστάται να έιναι εξαιρετικά προσεχτικοί για την πρώτη μισή ώρα μετά την έναρξη της βροχής.
                        </p>
                        <p>10. Ο συννεφιασμένος καιρός μειώνει την ορατότητα.</p>
                        <p>Προσέξτε ιδιαίτερα κατά την προσπέραση άλλων οχημάτων.</p>

                        <p>11. "Στεγνώστε" τα φρένα σας όταν περάσετε μέσα από λιμνάζοντα νερά.</p>
                        <p>Αν έχετε οδηγήσει μέσα από λιμνάζοντα νερά βάθους ικανού να βρέξουν τα τακάκια των φρένων σας, φρενάρετε απαλά για να τα "στεγνώσετε".
                        </p>
                        <p>12. Μην οδηγείτε κουρασμένοι.</p>
                        <p>Σταματήστε τουλάχιστον κάθε δύο ώρες ή κάθε 150 χλμ για να ξεκουραστείτε.
                        </p>
                        <p>Συμβουλές για επιδόσεις</p>
                        <p>Η υψηλή επίδοση δεν απατείται μόνο από οδηγούς αγώνων. Είστε έτοιμοι να βγείτε στο δρόμο;</p>
                        <p>1. Μην γίνεστε επιθετικός οδηγός.</p>
                        <p>Το να φωνάζετε, να πατάτε το κλάξον, να φρενάρετε απότομα μπροστά από κάποιον που κολλά επάνω σας, να πατάτε στο άκρο του δρόμου, να τρέχετε, να κάνετε άσεμνες χειρονομίες... όλα αυτά μπορούν να δημιουργήσουν γρήγορα επικίνδυνες καταστάσεις. Προσέξτε τον πραγματικό κίνδυνο και κρατήστε τον έλεγχό σας. Μην οδηγείτε όταν είστε θυμωμένοι, πολύ κουρασμένοι, ή στενoχωρημένοι. Αποφύγετε τις συγκρούσεις ακόμη και εάν έχετε δίκιο. Προβλέψτε περισσότερο χρόνο για να αποφύγετε την κυκλοφοριακή συμφόρηση όποτε είναι δυνατό.
                        </p>
                        <p>2. Αποφύγετε τους επιθετικούς οδηγούς.</p>
                        <p>Αν ένας οδηγός ενεργεί επιθετικά προς εσάς μην τον προκαλείτε ή τον αντιμετωπίζετε. Αποφύγετέ τον. Μην τον κοιτάτε. Κρατήστε τις πόρτες σας κλειδωμένες και τα παράθυρά σας ανεβασμένα. Μην υποτιμάτε τη δυνατότητα του άλλου οδηγού στην επιθετικότητα.
                        </p>
                        <p>3. Να είστε σε ετοιμότητα.</p>
                        <p>Να είστε χαλαροί, ήρεμοι και να μην είστε υπό την επήρεια αλκοόλ ή άλλων ναρκωτικών. Αποφύγετε δραστηριότητες που αποσπούν την προσοχή σας όπως το φαγητό ή τη συζήτηση με τους επιβάτες.
                        </p>
                        <p>4. Αποφύγετε την υπνηλία της εθνικής οδού.</p>
                        <p>Η υπνηλία της εθνικής οδού - η υπερβολική τάση ύπνου που προκαλείται από επαναλαμβανόμενα οπτικά ερεθίσματα και κόπωση - είναι ένας από τους μεγαλύτερους κινδύνους της οδήγησης. Όταν οδηγείτε μεγάλες αποστάσεις, κάνετε συχνές στάσεις κατά τις οποίες μπορείτε να κοιμηθείτε για λίγο ή να κάνετε ασκήσεις. Εξασκήστε τα μάτια σας διαβάζοντας οδικές πινακίδες ή μεταθέτοντας την εστίαση των ματιών σας σε διαφορετικά σημεία του δρόμου. Βεβαιωθείτε ότι έχετε ξεκουραστεί αρκετά. Αν νιώσετε ότι αποκοιμιέστε και χάνετε τη συγκέντρωσή σας - ΣΤΑΜΑΤΗΣΤΕ! Ξεκουραστείτε όσο χρειάζεται, και μετά συνεχίστε.
                        </p>
                        <p>5. Οδηγείτε αμυντικά.</p>
                        <p>Χρησιμοποιήστε τη φαντασία σας. Να είστε πάντα έτοιμοι να αντιδράσετε απέναντι στους άλλους οδηγούς, εάν δεν κάνουν αυτό που πρέπει - ή αυτό που νομίζετε ότι πρέπει να κάνουν. Αν δεν μπορείτε να αποφύγετε τη σύγκρουση, δοκιμάστε να αποφύγετε την πιο επικίνδυνη επιλογή. Για παράδειγμα, έχετε περισσότερες πιθανότητες να επιβιώσετε βγαίνοντας από τον δρόμο αντί να χτυπήσετε με ένα άλλο όχημα μετωπικά.
                        </p>
                        <p>Συμβουλές οδήγησης για όλες τις εποχές</p>
                        <p>Συμβουλές για να κινηθείτε άνετα όλες τις εποχές.</p>
                        <p>1. Προσαρμόστε το αυτοκίνητό σας στο χειμώνα</p>
                        <p>Προσθέστε την κατάλληλη ποσότητα αντιψυκτικού στο ψυκτικό της μηχανής. Θα προστατέψει το αυτοκίνητό σας από τον πάγο και τη διάβρωση. Ελέγξτε την μπαταρία για να βεβαιωθείτε ότι έχετε αρκετή ισχύ για τις εκκινήσεις στο κρύο του χειμώνα. Ελέγξτε τα φρένα σας. Αν τα φρένα δεν αποδίδουν σωστά το αυτοκίνητο μπορεί να έλκεται στο πλάι κατά το σταμάτημα. Έχετε μαζί σας εξοπλισμό ανάγκης. Ένας φακός, μια κουβέρτα, άμμος ή αλάτι και μια ξύστρα χιονιού είναι απαραίτητα. Ελέγξτε το καλοριφέρ και τον αποψύκτη. Θα σας εξασφαλίσουν άνεση και θα κρατήσουν το παρμπρίζ σας καθαρό από πάγο και συγκεντρώσεις ατμών. Αλλάξτε τα λάδια. Τα λιπαντικά για χειμερινές συνθήκες εξασφαλίζουν εύκολη εκκίνηση. Χρησιμοποιήστε τα κατάλληλα υγρά για το παρμπρίζ. Με κατάλληλους υαλοκαθαριστήρες, ένα αντιψυκτικό διάλυμα θα κρατά πάντα καθαρό το παρμπρίζ.
                        </p>
                        <p>2. Αποκτήστε ικανότητες οδήγησης για χειμερινές συνθήκες.</p>
                        <p>Προβλέψτε παραπάνω χρόνο για να φθάσετε στον προορισμό σας. Διπλασιάστε την απόσταση ασφαλείας. Η παραπάνω απόσταση ανάμεσα σε εσάς και το προπορευόμενο αυτοκίνητο θα σας δώσει αρκετό χρόνο να σταματήσετε. Κρατήστε το αυτοκίνητό σας καθαρό. Το τακτικό ξέπλυμα με καθαρό νερό μειώνει τη διάβρωση που προκαλείται απο τα χημικά, το αλάτι και το χαλίκι που χρησιμοποιείται για την απόψυξη των δρόμων. Προσοχή στις γέφυρες και άνω διαβάσεις. Σε αυτές τις επιφάνειες ο πάγος τείνει να σχηματίζεται γρηγορότερα, για αυτό προσαρμόστε ανάλογα την οδήγησή σας. Να βλέπετε και να σας βλέπουν. Φροντίστε την ορατότητα κρατώντας τα φώτα σας αναμμένα και το παρμπρίζ σας καθαρό. Να ξέρετε τι πρέπει να κάνετε αν κολλήσετε σε πάγο ή χιόνι. Μην περιστρέφετε (σπινιάρετε) τους τροχούς σας. Αφαιρέστε το χιόνι γύρω από τα ελαστικά σας και κουνήστε ελαφρά μπρος-πίσω το αυτοκίνητό σας.
                        </p>
                        <p>3. Καθώς οι εποχές αλλάζουν, ιδιαίτερα την άνοιξη και το φθινόπωρο, να είστε προετοιμασμένοι για έντονες βροχοπτώσεις.</p>
                        <p>Διαβάστε το "Συμβουλές για οδήγηση σε βρεγμένο δρόμο" στο δικτυακό αυτό τόπο. Υπάρχουν πολλά σημαντικά πράγματα που πρέπει να ξέρετε όπως: Υδρολίσθηση και πώς να την αποφύγετε. Οι βρεγμένοι δρόμοι είναι οι πιο επικίνδυνοι - Πώς να αντιμετωπίσετε τις ολισθήσεις - Η σημασία της ελάττωσης της ταχύτητας - Πώς να διατηρείτε τη σωστή απόσταση από τα άλλα οχήματα και να διατηρείτε την έλξη.
                        </p>
                        <p>4. Συγκεντρώστε το πληρέστερο κουτί πρώτων βοηθειών που μπορείτε, ιδίως για την χειμερινή οδήγηση σε απομακρυσμένες περιοχές.
                        </p><p>Προετοιμαστείτε για την περίπτωση που κολλήσετε κάπου. Για το κουτί σας χρησιμοποιήστε ένα συμπαγές δοχείο (μια βαριά τσάντα ή θήκη). Μερικά πράγματα που πρέπει να συμπεριλάβετε: φωτοβολίδες δρόμου, μάλλινες κουβέρτες, καλώδια βραχυκύκλωσης, σνακ, ένα μικρό φουρνάκι, έτοιμες σούπες, κατσαρολικά και σύνεργα φαγητού, χοντρές κάλτσες, καπέλο, γάντια, φάρμακα, αλυσίδες ελαστικών, φτυάρι χιονιού, κερί, αναπτήρα και σπίρτα, φακό και ραδιόφωνο με καινούργιες μπαταρίες, και κάτι να διαβάσετε κατά τη μεγάλη αναμονή. Μην ξεχνάτε τα φάρμακα και τις απαραίτητες προμήθειες προσωπικών ειδών. Να διαθέτετε πάντα κουτί πρώτων βοηθειών. Εξασφαλίστε ότι το κινητό σας έχει αρκετή ισχύ μπαταρίας.
                        </p>
                        <p>5. Προετοιμαστείτε νωρίτερα για να καλύψετε τις ειδικές απαιτήσεις των διαφορετικών εποχών.</p>
                        <p>Πρέπει να προετοιμάσετε το αυτοκίνητο και τα ελαστικά σας από πολύ νωρίτερα για το χειμώνα όπως και για τις άλλες εποχές. Η ομίχλη, οι έντονες βροχοπτώσεις, το χιόνι και ο πάγος, η αντηλιά και η θερμότητα χρειάζονται ειδικές ρυθμίσεις και συντήρηση. Δείτε τις συμβουλές μας για οδήγηση σε χειμερινές συνθήκες και την ενότητα "Συντήρηση ελαστικού" στον δικτυακό τόπο για περισσότερες πληροφορίες. Συμβουλευτείτε επίσης έναν αντιπρόσωπο της Goodyear.
                        </p>
                        <p>6. Μάθετε πώς να αντιμετωπίσετε την ομίχλη.</p>
                        <p>Το καλύτερο είναι να μην οδηγείτε με ομίχλη, αν πρέπει όμως πάρτε τα ακόλουθα μέτρα: –Ελαττώστε ταχύτητα. Αν βλέπετε φώτα πορείας ή πίσω φώτα ελαττώστε και άλλο την ταχύτητά σας. Ένας οδηγός μπορεί να οδηγεί στο κέντρο του δρόμου ή μπορεί να έχει σταματήσει ή μόλις να κινείται. –Οδηγείτε με τα φώτα πορείας σας ρυθμισμένα σε θαμπό φως, ή χρησιμοποιήστε φώτα ομίχλης. –Μην υπερφορτώνετε τα φώτα πορείας σας. Μείνετε μέσα στα όρια του οπτικού σας πεδίου. Μπορεί να χρειαστεί να σταματήσετε απότομα. Αν η ομίχλη είναι πολύ πυκνή, βγείτε από το δρόμο και σταματήστε. Μην οδηγείτε στα πέντε ή 10 μίλια την ώρα. –Χρησιμοποιήστε τα φλας πολύ πριν στρίψετε και φρενάρετε σύντομα όταν πλησιάζετε σε στοπ για να προειδοποιήσετε τους άλλους οδηγούς.
                        </p>
                        <p>7. Μάθετε πώς να αντιμετωπίσετε τους έντονους ανέμους.</p>
                        <p>Όταν οδηγείτε σε έντονους ανέμους να έχετε υπόψη σας τα εξής: -Οι οδηγοί φορτηγών, οχημάτων αναψυχής, οι "καμπινίστες" και όσοι σύρουν τρέιλερ πρέπει να είναι ιδιαίτερα προσεκτικοί. -Ελαττώστε την ταχύτητά σας και διορθώστε το τιμόνι σας όταν πηγαίνετε από μία προστατευμένη σε μια ανοικτή περιοχή . -Ελαττώστε την ταχύτητά σας όταν συναντάτε μεγάλα οχήματα όπως φορτηγά και λεωφορεία. -Η έντονη βροχή ή το χαλάζι πολλές φορές συνοδεύουν τους ισχυρούς ανέμους. Θα πρέπει να είστε προετοιμασμένοι για βρεγμένες ή ολισθηρές περιοχές και να προβλέπετε τέτοιες συνθήκες.
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