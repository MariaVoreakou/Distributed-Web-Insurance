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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Maria
 */
@Entity
@Table(name = "VehicleTypes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VehicleTypes.findAll", query = "SELECT v FROM VehicleTypes v"),
    @NamedQuery(name = "VehicleTypes.findByVehType", query = "SELECT v FROM VehicleTypes v WHERE v.vehType = :vehType"),
    @NamedQuery(name = "VehicleTypes.findByDescription", query = "SELECT v FROM VehicleTypes v WHERE v.description = :description")})
public class VehicleTypes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Veh_Type")
    private Integer vehType;
    @Basic(optional = false)
    @Column(name = "Description")
    private String description;

    public VehicleTypes() {
    }

    public VehicleTypes(Integer vehType) {
        this.vehType = vehType;
    }

    public VehicleTypes(Integer vehType, String description) {
        this.vehType = vehType;
        this.description = description;
    }

    public Integer getVehType() {
        return vehType;
    }

    public void setVehType(Integer vehType) {
        this.vehType = vehType;
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
        hash += (vehType != null ? vehType.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof VehicleTypes)) {
            return false;
        }
        VehicleTypes other = (VehicleTypes) object;
        if ((this.vehType == null && other.vehType != null) || (this.vehType != null && !this.vehType.equals(other.vehType))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.VehicleTypes[ vehType=" + vehType + " ]";
    }
    
}
