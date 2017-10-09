/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.Customers;
import Entities.Employees;
import Entities.InsuranceProgram;
import Entities.Vehicles;
import static Servlets.LoginServlet.em;
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
public class createCustomer extends HttpServlet {

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
        Customers customer = new Customers();
        customer.setName(request.getParameter("name"));
        customer.setSurname(request.getParameter("surname"));
        customer.setIndentityCard(request.getParameter("adt"));
        customer.setEmail(request.getParameter("email"));
        customer.setPassword(request.getParameter("password"));

        TypedQuery<Customers> query
                = em.createNamedQuery("Customers.findByAfm", Customers.class).setParameter("afm", Integer.parseInt(request.getParameter("afm")));
        List<Customers> list = query.getResultList();
        if (list.size() > 0) {
            response.sendRedirect("fail.jsp?link=create-customer.jsp");
            return;
        }
        customer.setAfm(Integer.parseInt(request.getParameter("afm")));
        
        customer.setDateOfLicense(new Date(request.getParameter("date-licence")));
        customer.setCustomerHistory(request.getParameter("history"));
        Vehicles custVeh = new Vehicles();
        TypedQuery<Vehicles> query2
                = em.createNamedQuery("Vehicles.findByVehLicence", Vehicles.class).setParameter("vehLicence", request.getParameter("veh-number"));
        List<Vehicles> list2 = query2.getResultList();
        if (list2.size() > 0) {
            response.sendRedirect("fail.jsp?link=create-customer.jsp");
            return;
        }
        custVeh.setVehLicence(request.getParameter("veh-number"));

        custVeh.setVehYear(Integer.parseInt(request.getParameter("veh-year")));
        custVeh.setVehcc(Integer.parseInt(request.getParameter("veh-cc")));
        if (request.getParameter("veh-type").equalsIgnoreCase("car")) {
            custVeh.setVehType(1);
        } else {
            custVeh.setVehType(2);
        }
        custVeh.setVehColor(request.getParameter("veh-color"));
        
        
        InsuranceProgram program = new InsuranceProgram();
        program.setVehLicense(custVeh.getVehLicence());
        
        int yearsOfExperience =  new Date().getYear()-customer.getDateOfLicense().getYear();
        int tensOfYears = yearsOfExperience % 10;
        int startingCost = 0;
        if(custVeh.getVehcc()<=1000){
            startingCost = 250;
        } else if(custVeh.getVehcc()>1000 && custVeh.getVehcc()<=1400){
            startingCost = 300;
        } else if(custVeh.getVehcc()>1400 && custVeh.getVehcc()<=1800){
            startingCost = 350;
        }else if(custVeh.getVehcc()>1800){
            startingCost = 450;
        }
        
        for(int i=0;i<tensOfYears;i++){
            startingCost = (int) (startingCost*0.9);
        }        
        program.setCostInsur(startingCost);
        Date currentDate = new Date(System.currentTimeMillis());
        Date endingDate = new Date(System.currentTimeMillis()+(1000*60*60*24*365));
        
        program.setStartDate(currentDate);
        program.setEndDate(endingDate);
        
        em.getTransaction().begin();
        em.persist(customer);

        TypedQuery<Customers> query3
                = em.createNamedQuery("Customers.findByAfm", Customers.class).setParameter("afm", Integer.parseInt(request.getParameter("afm")));
        List<Customers> list3 = query3.getResultList();
        Customers newCust = list3.get(0);
        custVeh.setCustomerID(newCust.getCustomerID());
        
        
        

        em.persist(custVeh);
        em.persist(program);
        em.flush();
        em.getTransaction().commit();
        response.sendRedirect("success.jsp");
        //em.close();
        //emf.close();

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
