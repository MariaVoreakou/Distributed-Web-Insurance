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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Maria
 */
@Entity
@Table(name = "Compensations")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Compensations.findAll", query = "SELECT c FROM Compensations c"),
    @NamedQuery(name = "Compensations.findByCompID", query = "SELECT c FROM Compensations c WHERE c.compID = :compID"),
    @NamedQuery(name = "Compensations.findByVehLicence", query = "SELECT c FROM Compensations c WHERE c.vehLicence = :vehLicence"),
    @NamedQuery(name = "Compensations.findByCompCost", query = "SELECT c FROM Compensations c WHERE c.compCost = :compCost")})
public class Compensations implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Comp_ID")
    private Integer compID;
    @Column(name = "Veh_Licence")
    private String vehLicence;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Comp_Cost")
    private Float compCost;
    @JoinColumn(name = "Approval_Type", referencedColumnName = "Appr_ID")
    @ManyToOne
    private ApprovalType approvalType;

    public Compensations() {
    }

    public Compensations(Integer compID) {
        this.compID = compID;
    }

    public Integer getCompID() {
        return compID;
    }

    public void setCompID(Integer compID) {
        this.compID = compID;
    }

    public String getVehLicence() {
        return vehLicence;
    }

    public void setVehLicence(String vehLicence) {
        this.vehLicence = vehLicence;
    }

    public Float getCompCost() {
        return compCost;
    }

    public void setCompCost(Float compCost) {
        this.compCost = compCost;
    }

    public ApprovalType getApprovalType() {
        return approvalType;
    }

    public void setApprovalType(ApprovalType approvalType) {
        this.approvalType = approvalType;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (compID != null ? compID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Compensations)) {
            return false;
        }
        Compensations other = (Compensations) object;
        if ((this.compID == null && other.compID != null) || (this.compID != null && !this.compID.equals(other.compID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Compensations[ compID=" + compID + " ]";
    }
    
}
