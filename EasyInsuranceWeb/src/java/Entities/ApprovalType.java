/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Maria
 */
@Entity
@Table(name = "Approval_Type")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ApprovalType.findAll", query = "SELECT a FROM ApprovalType a"),
    @NamedQuery(name = "ApprovalType.findByApprID", query = "SELECT a FROM ApprovalType a WHERE a.apprID = :apprID"),
    @NamedQuery(name = "ApprovalType.findByDescription", query = "SELECT a FROM ApprovalType a WHERE a.description = :description")})
public class ApprovalType implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Appr_ID")
    private Integer apprID;
    @Column(name = "Description")
    private String description;
    @OneToMany(mappedBy = "approvalType")
    private List<Compensations> compensationsList;

    public ApprovalType() {
    }

    public ApprovalType(Integer apprID) {
        this.apprID = apprID;
    }

    public Integer getApprID() {
        return apprID;
    }

    public void setApprID(Integer apprID) {
        this.apprID = apprID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public List<Compensations> getCompensationsList() {
        return compensationsList;
    }

    public void setCompensationsList(List<Compensations> compensationsList) {
        this.compensationsList = compensationsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (apprID != null ? apprID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ApprovalType)) {
            return false;
        }
        ApprovalType other = (ApprovalType) object;
        if ((this.apprID == null && other.apprID != null) || (this.apprID != null && !this.apprID.equals(other.apprID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.ApprovalType[ apprID=" + apprID + " ]";
    }
    
}
