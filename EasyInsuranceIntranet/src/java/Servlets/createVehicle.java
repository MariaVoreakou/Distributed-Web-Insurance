/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.Customers;
import Entities.InsuranceProgram;
import Entities.Vehicles;
import static Servlets.createCustomer.em;
import java.io.IOException;
import java.util.Date;
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
public class createVehicle extends HttpServlet {

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
        Customers customer;
        TypedQuery<Customers> query
                = em.createNamedQuery("Customers.findByAfm", Customers.class).setParameter("afm", Integer.parseInt(request.getParameter("afm")));
        List<Customers> list = query.getResultList();
        if (list.size() == 1) {
            customer = list.get(0);
        } else {
            response.sendRedirect("fail.jsp?link=add-vehicle.jsp");
            return;
        }

        TypedQuery<Vehicles> query2
                = em.createNamedQuery("Vehicles.findByVehLicence", Vehicles.class).setParameter("vehLicence", request.getParameter("veh-number"));
        List<Vehicles> list2 = query2.getResultList();
        if (list2.size() > 0) {

            response.sendRedirect("fail.jsp?link=add-vehicle.jsp");
            return;
        }

        Vehicles vehicle = new Vehicles();
        vehicle.setCustomerID(customer.getCustomerID());
        vehicle.setVehLicence(request.getParameter("veh-number"));
        vehicle.setVehYear(Integer.parseInt(request.getParameter("veh-year")));
        vehicle.setVehcc(Integer.parseInt(request.getParameter("veh-cc")));
        if (request.getParameter("veh-type").equalsIgnoreCase("car")) {
            vehicle.setVehType(1);
        } else {
            vehicle.setVehType(2);
        }
        vehicle.setVehColor(request.getParameter("veh-color"));

        InsuranceProgram program = new InsuranceProgram();
        program.setVehLicense(vehicle.getVehLicence());

        int yearsOfExperience = new Date().getYear() - customer.getDateOfLicense().getYear();
        int tensOfYears = yearsOfExperience % 10;
        int startingCost = 0;
        if (vehicle.getVehcc() <= 1000) {
            startingCost = 250;
        } else if (vehicle.getVehcc() > 1000 && vehicle.getVehcc() <= 1400) {
            startingCost = 300;
        } else if (vehicle.getVehcc() > 1400 && vehicle.getVehcc() <= 1800) {
            startingCost = 350;
        } else if (vehicle.getVehcc() > 1800) {
            startingCost = 450;
        }

        for (int i = 0; i < tensOfYears; i++) {
            startingCost = (int) (startingCost * 0.9);
        }
        program.setCostInsur(startingCost);
        Date currentDate = new Date(System.currentTimeMillis());
        Date endingDate = new Date(System.currentTimeMillis() + (1000 * 60 * 60 * 24 * 365));

        program.setStartDate(currentDate);
        program.setEndDate(endingDate);

        em.getTransaction().begin();
        em.persist(vehicle);
        em.persist(program);

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
