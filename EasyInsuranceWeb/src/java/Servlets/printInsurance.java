/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.Customers;
import Entities.InsuranceProgram;
import static Servlets.LoginServlet.em;
import Statics.Util;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Maria
 */
@WebServlet(name = "printInsurance", urlPatterns = {"/printInsurance"})
public class printInsurance extends HttpServlet {

    @PersistenceContext
    static EntityManagerFactory emf = Persistence.createEntityManagerFactory("EasyInsuranceWebPU");
    static EntityManager em = emf.createEntityManager();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        TypedQuery<InsuranceProgram> query
                = em.createNamedQuery("InsuranceProgram.findByVehLicense", InsuranceProgram.class).setParameter("vehLicense", request.getParameter("vehLicense"));
        List<InsuranceProgram> list = query.getResultList();
        if (list.size() == 1) {
            InsuranceProgram insurance = list.get(0);
            if (!Util.isInsuranceValid(insurance)) {
                response.sendRedirect("fail.jsp?link=insuranceInformation.jsp");
            }
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {


                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<meta charset=\"UTF-8\">");
                out.println("<meta http-equiv=\"Content-Type\" content=\"text/html;charset=UTF-8\">");
                out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/servlets.css\">");
                out.println("<title>Ασφάλιστρο " + request.getParameter("vehLicense") + "</title>");

                out.println("</head>");
                out.println("<body style=\"background-color:#F0F0F0;\">");
                out.println("<p class=\"p-style\">Easy Insurance Ασφαλιστική</p>");
                out.println("<p class=\"p-style\">Ασφάλιστρο Αυτοκινήτου</p>");
                out.println("<table class=\"ta\">\n"
                        + "  <tr>\n"
                        + "    <th class=\"tg-x795\">Αριθμός Κυκλοφορίας:</th>\n"
                        + "    <th class=\"tg-9ukx\">" + insurance.getVehLicense() + "</th>\n"
                        + "  </tr>\n"
                        + "  <tr>\n"
                        + "    <td class=\"tg-x795\">Ισχύς</td>\n"
                        + "    <td class=\"tg-9ukx\"></td>\n"
                        + "  </tr>\n"
                        + "  <tr>\n"
                        + "    <td class=\"tg-x795\">Από:</td>\n"
                        + "    <td class=\"tg-9ukx\">" + insurance.getStartDate().toLocaleString() + "</td>\n"
                        + "  </tr>\n"
                        + "  <tr>\n"
                        + "    <td class=\"tg-x795\">Ως:</td>\n"
                        + "    <td class=\"tg-9ukx\">" + insurance.getEndDate().toLocaleString() + "</td>\n"
                        + "  </tr>\n"
                        + "  <tr>\n"
                        + "    <td class=\"tg-x795\">Ποσό</td>\n"
                        + "    <td class=\"tg-9ukx\">" + insurance.getCostInsur() + "€</td>\n"
                        + "  </tr>\n"
                        + "</table>");
                out.println("<p></p>");
                out.println("<p style=\"text-align:center;\"><button onclick=\"window.print();\">Print this page</button></p>");
                out.println("<script type=\"text/javascript\">window.print()</script>");
                out.println("</body>");
                out.println("</html>");
            }
            response.sendRedirect("index.jsp");
            return;
        } else {
            response.sendRedirect("fail.jsp?link=insuranceInformation.jsp");
            return;
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
