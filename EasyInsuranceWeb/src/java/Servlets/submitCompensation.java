/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.ApprovalType;
import Entities.Compensations;
import Entities.InsuranceProgram;
import Entities.Vehicles;
import Statics.Util;
import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Maria
 */
@WebServlet(name = "submitCompensation", urlPatterns = {"/submitCompensation"})
public class submitCompensation extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        TypedQuery<Vehicles> query
                = em.createNamedQuery("Vehicles.findByVehLicence", Vehicles.class).setParameter("vehLicence", request.getParameter("vehLicense"));
        List<Vehicles> list = query.getResultList();

        if (list.size() == 1) {
            Vehicles vehicle = list.get(0);

            TypedQuery<InsuranceProgram> insuranceQ
                    = em.createNamedQuery("InsuranceProgram.findByVehLicense", InsuranceProgram.class).setParameter("vehLicense", vehicle.getVehLicence());
            List<InsuranceProgram> insuranceList = insuranceQ.getResultList();

            InsuranceProgram insurance = insuranceList.get(0);
            if (!Util.isInsuranceValid(insurance)) {
                response.sendRedirect("fail.jsp?link=insuranceClaim.jsp");
                return;
            }

            if ((vehicle.getCustomerID() == Integer.parseInt(request.getParameter("customerID")))) {
                Compensations comp = new Compensations();
                comp.setCompCost(Float.parseFloat(request.getParameter("cost")));
                comp.setVehLicence(vehicle.getVehLicence());

                ApprovalType aprType = null;
                if (comp.getCompCost() <= 300) {
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
                comp.setApprovalType(aprType);

                em.getTransaction().begin();
                em.persist(comp);

                em.flush();
                em.getTransaction().commit();
                response.sendRedirect("success.jsp");
                return;

            } else {
                response.sendRedirect("fail.jsp?link=insuranceClaim.jsp");
                return;
            }

        } else {
            response.sendRedirect("fail.jsp?link=insuranceClaim.jsp");
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
