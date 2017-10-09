/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Maria
 */
@Entity
@Table(name = "Customers")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Customers.findAll", query = "SELECT c FROM Customers c"),
    @NamedQuery(name = "Customers.findByCustomerID", query = "SELECT c FROM Customers c WHERE c.customerID = :customerID"),
    @NamedQuery(name = "Customers.findByName", query = "SELECT c FROM Customers c WHERE c.name = :name"),
    @NamedQuery(name = "Customers.findBySurname", query = "SELECT c FROM Customers c WHERE c.surname = :surname"),
    @NamedQuery(name = "Customers.findByIndentityCard", query = "SELECT c FROM Customers c WHERE c.indentityCard = :indentityCard"),
    @NamedQuery(name = "Customers.findByAfm", query = "SELECT c FROM Customers c WHERE c.afm = :afm"),
    @NamedQuery(name = "Customers.findByLogin", query = "SELECT c FROM Customers c WHERE c.email = :email AND c.password = :password"),
    @NamedQuery(name = "Customers.findByDateOfLicense", query = "SELECT c FROM Customers c WHERE c.dateOfLicense = :dateOfLicense")})
public class Customers implements Serializable {

    @Column(name = "password")
    private String password;

    @Basic(optional = false)
    @Column(name = "email")
    private String email;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Customer_ID")
    private Integer customerID;
    @Basic(optional = false)
    @Column(name = "Name")
    private String name;
    @Basic(optional = false)
    @Column(name = "Surname")
    private String surname;
    @Basic(optional = false)
    @Column(name = "IndentityCard")
    private String indentityCard;
    @Basic(optional = false)
    @Column(name = "AFM")
    private int afm;
    @Basic(optional = false)
    @Column(name = "DateOfLicense")
    @Temporal(TemporalType.DATE)
    private Date dateOfLicense;
    @Basic(optional = false)
    @Lob
    @Column(name = "CustomerHistory")
    private String customerHistory;

    public Customers() {
    }

    public Customers(Integer customerID) {
        this.customerID = customerID;
    }

    public Customers(Integer customerID, String name, String surname, String indentityCard, int afm, Date dateOfLicense, String customerHistory) {
        this.customerID = customerID;
        this.name = name;
        this.surname = surname;
        this.indentityCard = indentityCard;
        this.afm = afm;
        this.dateOfLicense = dateOfLicense;
        this.customerHistory = customerHistory;
    }

    public Integer getCustomerID() {
        return customerID;
    }

    public void setCustomerID(Integer customerID) {
        this.customerID = customerID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getIndentityCard() {
        return indentityCard;
    }

    public void setIndentityCard(String indentityCard) {
        this.indentityCard = indentityCard;
    }

    public int getAfm() {
        return afm;
    }

    public void setAfm(int afm) {
        this.afm = afm;
    }

    public Date getDateOfLicense() {
        return dateOfLicense;
    }

    public void setDateOfLicense(Date dateOfLicense) {
        this.dateOfLicense = dateOfLicense;
    }

    public String getCustomerHistory() {
        return customerHistory;
    }

    public void setCustomerHistory(String customerHistory) {
        this.customerHistory = customerHistory;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (customerID != null ? customerID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customers)) {
            return false;
        }
        Customers other = (Customers) object;
        if ((this.customerID == null && other.customerID != null) || (this.customerID != null && !this.customerID.equals(other.customerID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Customers[ customerID=" + customerID + " ]";
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
