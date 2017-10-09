/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Maria
 */
@Entity
@Table(name = "Vehicles")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Vehicles.findAll", query = "SELECT v FROM Vehicles v"),
    @NamedQuery(name = "Vehicles.findByVehLicence", query = "SELECT v FROM Vehicles v WHERE v.vehLicence = :vehLicence"),
    @NamedQuery(name = "Vehicles.findByVehYear", query = "SELECT v FROM Vehicles v WHERE v.vehYear = :vehYear"),
    @NamedQuery(name = "Vehicles.findByVehcc", query = "SELECT v FROM Vehicles v WHERE v.vehcc = :vehcc"),
    @NamedQuery(name = "Vehicles.findByVehType", query = "SELECT v FROM Vehicles v WHERE v.vehType = :vehType"),
    @NamedQuery(name = "Vehicles.findByVehColor", query = "SELECT v FROM Vehicles v WHERE v.vehColor = :vehColor"),
    @NamedQuery(name = "Vehicles.findByCustomerID", query = "SELECT v FROM Vehicles v WHERE v.customerID = :customerID")})
public class Vehicles implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Veh_Licence")
    private String vehLicence;
    @Basic(optional = false)
    @Column(name = "Veh_Year")
    private int vehYear;
    @Basic(optional = false)
    @Column(name = "Veh_cc")
    private int vehcc;
    @Basic(optional = false)
    @Column(name = "Veh_Type")
    private int vehType;
    @Basic(optional = false)
    @Column(name = "Veh_Color")
    private String vehColor;
    @Basic(optional = false)
    @Column(name = "Customer_ID")
    private int customerID;

    public Vehicles() {
    }

    public Vehicles(String vehLicence) {
        this.vehLicence = vehLicence;
    }

    public Vehicles(String vehLicence, int vehYear, int vehcc, int vehType, String vehColor, int customerID) {
        this.vehLicence = vehLicence;
        this.vehYear = vehYear;
        this.vehcc = vehcc;
        this.vehType = vehType;
        this.vehColor = vehColor;
        this.customerID = customerID;
    }

    public String getVehLicence() {
        return vehLicence;
    }

    public void setVehLicence(String vehLicence) {
        this.vehLicence = vehLicence;
    }

    public int getVehYear() {
        return vehYear;
    }

    public void setVehYear(int vehYear) {
        this.vehYear = vehYear;
    }

    public int getVehcc() {
        return vehcc;
    }

    public void setVehcc(int vehcc) {
        this.vehcc = vehcc;
    }

    public int getVehType() {
        return vehType;
    }

    public void setVehType(int vehType) {
        this.vehType = vehType;
    }

    public String getVehColor() {
        return vehColor;
    }

    public void setVehColor(String vehColor) {
        this.vehColor = vehColor;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (vehLicence != null ? vehLicence.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Vehicles)) {
            return false;
        }
        Vehicles other = (Vehicles) object;
        if ((this.vehLicence == null && other.vehLicence != null) || (this.vehLicence != null && !this.vehLicence.equals(other.vehLicence))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Vehicles[ vehLicence=" + vehLicence + " ]";
    }
    
}
