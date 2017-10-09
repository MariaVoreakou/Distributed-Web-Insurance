/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.Compensations;
import Entities.Employees;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Maria
 */
public class pendingCompensations extends HttpServlet {

    @PersistenceContext
    static EntityManagerFactory emf = Persistence.createEntityManagerFactory("WebApplication3PU");
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
        response.setContentType("text/html;charset=UTF-32");
        TypedQuery<Compensations> query
                = em.createNamedQuery("Compensations.pending", Compensations.class);
        List<Compensations> list = query.getResultList();

        String username = "";
        Cookie cookie = null;
        Cookie[] cookieList = null;
        cookieList = request.getCookies();
        if (cookieList != null) {
            for (int i = 0; i < cookieList.length; i++) {
                cookie = cookieList[i];
                if (cookie.getName().equalsIgnoreCase("username")) {
                    username = cookie.getValue();
                    break;
                }
            }
        }
        if (username.length() < 1) {
            response.sendRedirect("index.jsp");
            return;
        }
        TypedQuery<Employees> query2
                = em.createNamedQuery("Employees.findByUsername", Employees.class).setParameter("username", username);
        List<Employees> list2 = query2.getResultList();
        if (list2.size() == 0) {
            response.sendRedirect("fail.jsp?link=pending-compensation.jsp");
            return;
        }
        Employees empl = list2.get(0);
        ArrayList<Compensations> finalList = new ArrayList<Compensations>();
        int maxCost = 0;
        if (empl.getTypeOfEmployee() == 2) {
            maxCost = 2000;
        }
        if (empl.getTypeOfEmployee() == 3) {
            maxCost = Integer.MAX_VALUE;
        }

        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getCompCost() <= maxCost) {
                Cookie aCompensation = new Cookie("compen" + i,
                        URLEncoder.encode("<tr>"
                                + "<td>" + list.get(i).getCompID() + "</td>\n"
                                + "<td>" + list.get(i).getVehLicence() + "</td>\n"
                                + "<td>" + list.get(i).getCompCost() + "</td>\n"
                                + "<td><a href=\"modifyCompensation?id=" + list.get(i).getCompID() + "&action=2\">Accept</a><br/>"
                                + "<a href=\"modifyCompensation?id=" + list.get(i).getCompID() + "&action=3\">Decline</a></td>"
                                + "</tr>"));
                response.addCookie(aCompensation);
            }
        }

        response.sendRedirect("pending-compensation.jsp");

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
