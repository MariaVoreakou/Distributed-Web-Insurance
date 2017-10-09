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
@Table(name = "Empl_Depart")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EmplDepart.findAll", query = "SELECT e FROM EmplDepart e"),
    @NamedQuery(name = "EmplDepart.findByDepartmentID", query = "SELECT e FROM EmplDepart e WHERE e.departmentID = :departmentID"),
    @NamedQuery(name = "EmplDepart.findByEmployeeId", query = "SELECT e FROM EmplDepart e WHERE e.employeeId = :employeeId"),
    @NamedQuery(name = "EmplDepart.findByEmplDepartID", query = "SELECT e FROM EmplDepart e WHERE e.emplDepartID = :emplDepartID")})
public class EmplDepart implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "Department_ID")
    private int departmentID;
    @Basic(optional = false)
    @Column(name = "employee_id")
    private int employeeId;
    @Id
    @Basic(optional = false)
    @Column(name = "Empl_Depart_ID")
    private Integer emplDepartID;

    public EmplDepart() {
    }

    public EmplDepart(Integer emplDepartID) {
        this.emplDepartID = emplDepartID;
    }

    public EmplDepart(Integer emplDepartID, int departmentID, int employeeId) {
        this.emplDepartID = emplDepartID;
        this.departmentID = departmentID;
        this.employeeId = employeeId;
    }

    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public Integer getEmplDepartID() {
        return emplDepartID;
    }

    public void setEmplDepartID(Integer emplDepartID) {
        this.emplDepartID = emplDepartID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (emplDepartID != null ? emplDepartID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EmplDepart)) {
            return false;
        }
        EmplDepart other = (EmplDepart) object;
        if ((this.emplDepartID == null && other.emplDepartID != null) || (this.emplDepartID != null && !this.emplDepartID.equals(other.emplDepartID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.EmplDepart[ emplDepartID=" + emplDepartID + " ]";
    }
    
}
