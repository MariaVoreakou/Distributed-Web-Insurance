/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Statics;

import Entities.Customers;
import Entities.InsuranceProgram;
import Entities.Vehicles;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.http.Cookie;

/**
 *
 * @author Maria
 */
public class Util {

    @PersistenceContext
    static EntityManagerFactory emf = Persistence.createEntityManagerFactory("EasyInsuranceWebPU");
    static EntityManager em = emf.createEntityManager();

    public static String getMenu() {
        return " <div> "
                + "<p class=\"p-style-form-title\" style=\"color: #285A82;\">Κατηγορίες</h2>"
                
                + "<p><a class=\"a-style\" href=\"index.jsp\">Κεντρική Σελίδα</a></p>"
                + "<p><a class=\"a-style\" href=\"insuranceInformation.jsp\">Πληροφορίες ασφάλισης</a></p>"
                + "<p><a class=\"a-style\" href=\"insuranceClaim.jsp\">Αίτηση αποζημίωσης για τρίτο</p></a>"
                + "<p style=\"font-size:22px;\"><a class=\"a-style\" href=\"logout\">Έξοδος</a></p>"
                + "</div>";
    }

    public static boolean isInsuranceValid(InsuranceProgram ins) {
        if (ins.getEndDate().before(new Date(System.currentTimeMillis()))) {
            return false;
        } else {
            return true;
        }
    }

    public static String getVehichles(int customerID) {

        TypedQuery<Vehicles> query
                = em.createNamedQuery("Vehicles.findByCustomerID", Vehicles.class).setParameter("customerID", customerID);
        List<Vehicles> list = query.getResultList();

        ArrayList<InsuranceProgram> insurances = new ArrayList<InsuranceProgram>();

        for (int i = 0; i < list.size(); i++) {
            TypedQuery<InsuranceProgram> insuranceQ
                    = em.createNamedQuery("InsuranceProgram.findByVehLicense", InsuranceProgram.class).setParameter("vehLicense", list.get(i).getVehLicence());
            List<InsuranceProgram> insuranceList = insuranceQ.getResultList();

            for (int j = 0; j < insuranceList.size(); j++) {
                insurances.add(insuranceList.get(j));
            }
        }

        String resultSet = "<table class=\"table-comp\">\n";
        resultSet += "<tr>";
        resultSet += "<th>Αριθμός Κυκλοφορίας</th>";
        resultSet += "<th>Ποσό Ασφαλίστρου</th>";
        resultSet += "<th>Ημερομηνία Έναρξης</th>";
        resultSet += "<th>Ημερομηνία Λήξης</th>";
        resultSet += "<th>Κατάσταση</th>";
        resultSet += "<th>Ενέργεια</th>";
        resultSet += "</tr>";

        for (int i = 0; i < insurances.size(); i++) {
            resultSet += "<tr>";
            resultSet += "<td>" + insurances.get(i).getVehLicense() + "</td>";
            resultSet += "<td>" + insurances.get(i).getCostInsur() + "€</td>";
            resultSet += "<td>" + insurances.get(i).getStartDate().toLocaleString() + "</td>";
            resultSet += "<td>" + insurances.get(i).getEndDate().toLocaleString() + "</td>";
            if (!isInsuranceValid(insurances.get(i))) {
                resultSet += "<td>Έχει λήξει</td>";
                resultSet += "<td><a target=\"_blank\" href=\"renewInsurance?vehLicense=" + insurances.get(i).getVehLicense() + "\">Ανανέωση</a></td>";
            } else {
                resultSet += "<td>Σε ισχύ</td>";
                resultSet += "<td><a target=\"_blank\" href=\"printInsurance?vehLicense=" + insurances.get(i).getVehLicense() + "\">Εκτύπωση</a></td>";
            }

            resultSet += "</tr>";
        }

        resultSet += "</table>";

        return resultSet;
    }

    public static String getHeader() {

        return "                        <div class=\"categories-content\">\n"
                + "                            <div class=\"half_48\">\n"
                + "\n"
                + "                                <div class=\"half_48\">\n"
                + "\n"
                + "                                    <p><a class=\"a-style\" href=\"shops.jsp\">Καταστήματα</a></p>\n"
                + "\n"
                + "\n"
                + "                                </div>\n"
                + "                                <div class=\"half_48\">\n"
                + "                                    <p><a class=\"a-style\" href=\"safe-drive.jsp\">Ασφαλής οδήγηση</a></p>\n"
                + "                                </div>\n"
                + "                            </div>\n"
                + "\n"
                + "\n"
                + "                            <div class=\"half_48\">\n"
                + "\n"
                + "                                <div class=\"half_48\">\n"
                + "                                    <p><a class=\"a-style\" href=\"offers.jsp\">Προσφορές</a></p>\n"
                + "                                </div>\n"
                + "\n"
                + "\n"
                + "                                <div class=\"half_48\">\n"
                + "                                    <p><a class=\"a-style\" href=\"payment-policy.jsp\">Τιμολογιακή Πολιτική</a></p>\n"
                + "                                </div>\n"
                + "                            </div>\n"
                + "                        </div>";
    }
}
