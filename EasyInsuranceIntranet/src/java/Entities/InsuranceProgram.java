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
import javax.persistence.Id;
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
@Table(name = "InsuranceProgram")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "InsuranceProgram.findAll", query = "SELECT i FROM InsuranceProgram i"),
    @NamedQuery(name = "InsuranceProgram.findByVehLicense", query = "SELECT i FROM InsuranceProgram i WHERE i.vehLicense = :vehLicense"),
    @NamedQuery(name = "InsuranceProgram.findByCostInsur", query = "SELECT i FROM InsuranceProgram i WHERE i.costInsur = :costInsur")})
public class InsuranceProgram implements Serializable {

    @Basic(optional = false)
    @Column(name = "StartDate")
    @Temporal(TemporalType.DATE)
    private Date startDate;
    @Basic(optional = false)
    @Column(name = "EndDate")
    @Temporal(TemporalType.DATE)
    private Date endDate;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Veh_License")
    private String vehLicense;
    @Basic(optional = false)
    @Column(name = "Cost_Insur")
    private int costInsur;

    public InsuranceProgram() {
    }

    public InsuranceProgram(String vehLicense) {
        this.vehLicense = vehLicense;
    }

    public InsuranceProgram(String vehLicense, int costInsur) {
        this.vehLicense = vehLicense;
        this.costInsur = costInsur;
    }

    public String getVehLicense() {
        return vehLicense;
    }

    public void setVehLicense(String vehLicense) {
        this.vehLicense = vehLicense;
    }

    public int getCostInsur() {
        return costInsur;
    }

    public void setCostInsur(int costInsur) {
        this.costInsur = costInsur;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (vehLicense != null ? vehLicense.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InsuranceProgram)) {
            return false;
        }
        InsuranceProgram other = (InsuranceProgram) object;
        if ((this.vehLicense == null && other.vehLicense != null) || (this.vehLicense != null && !this.vehLicense.equals(other.vehLicense))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.InsuranceProgram[ vehLicense=" + vehLicense + " ]";
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    
}
