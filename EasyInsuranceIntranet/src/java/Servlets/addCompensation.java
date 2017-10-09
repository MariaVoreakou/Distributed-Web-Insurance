/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.ApprovalType;
import Entities.Compensations;
import Entities.Vehicles;
import static Servlets.createVehicle.em;
import static Servlets.modifyCompensation.em;
import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Maria
 */
public class addCompensation extends HttpServlet {

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
        TypedQuery<Vehicles> query1
                = em.createNamedQuery("Vehicles.findByVehLicence", Vehicles.class).setParameter("vehLicence", request.getParameter("veh-number"));
        List<Vehicles> list = query1.getResultList();
        if (list.size() != 1) {
            response.sendRedirect("fail.jsp?link=new-compensation.jsp");
            return;
        }
        Compensations newComp = new Compensations();
        newComp.setVehLicence(request.getParameter("veh-number"));
        newComp.setCompCost(Float.parseFloat(request.getParameter("comp-cost")));

        ApprovalType aprType = null;
        if (newComp.getCompCost() <= 300) {
            TypedQuery<ApprovalType> query2
                    = em.createNamedQuery("ApprovalType.findByApprID", ApprovalType.class).setParameter("apprID", 2);
            List<ApprovalType> list2 = query2.getResultList();
            aprType = list2.get(0);
        } else {
            TypedQuery<ApprovalType> query2
                    = em.createNamedQuery("ApprovalType.findByApprID", ApprovalType.class).setParameter("apprID", 1);
            List<ApprovalType> list2 = query2.getResultList();
            aprType = list2.get(0);
        }
        newComp.setApprovalType(aprType);
        em.getTransaction().begin();
        em.persist(newComp);

        em.flush();
        em.getTransaction().commit();
        response.sendRedirect("success.jsp");
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
