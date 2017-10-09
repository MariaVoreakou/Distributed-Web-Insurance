/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.InsuranceProgram;
import static Servlets.printInsurance.em;
import Statics.Util;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Maria
 */
public class renewInsurance extends HttpServlet {

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
            if (Util.isInsuranceValid(insurance)) {
                response.sendRedirect("fail.jsp?link=insuranceInformation.jsp");
            }
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
            
                String code = "";
                
                for(int i=0;i<insurance.getVehLicense().length();i++){
                    code+= (int) insurance.getVehLicense().charAt(i);
                }
                code+=insurance.getCostInsur();
            
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<meta charset=\"UTF-8\">");
                out.println("<meta http-equiv=\"Content-Type\" content=\"text/html;charset=UTF-8\">");
                out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/servlets.css\">");
                out.println("<title>Ταυτότητα Οφειλής για " + request.getParameter("vehLicense") + "</title>");

                out.println("</head>");
                out.println("<body style=\"background-color:#F0F0F0;\">");
                out.println("<p class=\"p-style\">Easy Insurance Ασφαλιστική</p>");
                out.println("<p class=\"p-style\">Ασφάλιστρο Αυτοκινήτου</p>");
                out.println("<p style=\"text-align:center; font-weight:bold; font-size:20px;\">Ταυτότητα Οφειλής για " + request.getParameter("vehLicense") + "</p>");
                out.println("<table class=\"ta\">\n"
                        + "  <tr>\n"
                        + "    <th class=\"tg-x795\">Αριθμός Κυκλοφορίας:</th>\n"
                        + "    <th class=\"tg-9ukx\">" + insurance.getVehLicense() + "</th>\n"
                        + "  </tr>\n"
                        + "  <tr>\n"
                        + "    <td class=\"tg-x795\">Ποσό</td>\n"
                        + "    <td class=\"tg-9ukx\">" + insurance.getCostInsur() + "€</td>\n"
                        + "  </tr>\n"
                        + "  <tr>\n"
                        + "    <td class=\"tg-x795\">Κωδικός Ηλεκτρονικής Πληρωμής</td>\n"
                        + "    <td class=\"tg-9ukx\">" + code + "</td>\n"
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
