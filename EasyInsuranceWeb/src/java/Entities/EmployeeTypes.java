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
@Table(name = "EmployeeTypes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EmployeeTypes.findAll", query = "SELECT e FROM EmployeeTypes e"),
    @NamedQuery(name = "EmployeeTypes.findByTypeOfEmployee", query = "SELECT e FROM EmployeeTypes e WHERE e.typeOfEmployee = :typeOfEmployee"),
    @NamedQuery(name = "EmployeeTypes.findByDescription", query = "SELECT e FROM EmployeeTypes e WHERE e.description = :description")})
public class EmployeeTypes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "TypeOfEmployee")
    private Integer typeOfEmployee;
    @Basic(optional = false)
    @Column(name = "Description")
    private String description;

    public EmployeeTypes() {
    }

    public EmployeeTypes(Integer typeOfEmployee) {
        this.typeOfEmployee = typeOfEmployee;
    }

    public EmployeeTypes(Integer typeOfEmployee, String description) {
        this.typeOfEmployee = typeOfEmployee;
        this.description = description;
    }

    public Integer getTypeOfEmployee() {
        return typeOfEmployee;
    }

    public void setTypeOfEmployee(Integer typeOfEmployee) {
        this.typeOfEmployee = typeOfEmployee;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (typeOfEmployee != null ? typeOfEmployee.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EmployeeTypes)) {
            return false;
        }
        EmployeeTypes other = (EmployeeTypes) object;
        if ((this.typeOfEmployee == null && other.typeOfEmployee != null) || (this.typeOfEmployee != null && !this.typeOfEmployee.equals(other.typeOfEmployee))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.EmployeeTypes[ typeOfEmployee=" + typeOfEmployee + " ]";
    }
    
}
