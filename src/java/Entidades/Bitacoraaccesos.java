/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidades;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ASUS
 */
@Entity
@Table(name = "bitacoraaccesos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bitacoraaccesos.findAll", query = "SELECT b FROM Bitacoraaccesos b"),
    @NamedQuery(name = "Bitacoraaccesos.findById", query = "SELECT b FROM Bitacoraaccesos b WHERE b.id = :id"),
    @NamedQuery(name = "Bitacoraaccesos.findByUsuario", query = "SELECT b FROM Bitacoraaccesos b WHERE b.usuario = :usuario"),
    @NamedQuery(name = "Bitacoraaccesos.findByAccion", query = "SELECT b FROM Bitacoraaccesos b WHERE b.accion = :accion"),
    @NamedQuery(name = "Bitacoraaccesos.findByFechaIngreso", query = "SELECT b FROM Bitacoraaccesos b WHERE b.fechaIngreso = :fechaIngreso"),
    @NamedQuery(name = "Bitacoraaccesos.findByTablaModificada", query = "SELECT b FROM Bitacoraaccesos b WHERE b.tablaModificada = :tablaModificada"),
    @NamedQuery(name = "Bitacoraaccesos.findByIdRegistroModificado", query = "SELECT b FROM Bitacoraaccesos b WHERE b.idRegistroModificado = :idRegistroModificado")})
public class Bitacoraaccesos implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "Usuario")
    private Integer usuario;
    @Column(name = "Accion")
    private String accion;
    @Column(name = "Fecha_Ingreso")
    @Temporal(TemporalType.DATE)
    private Date fechaIngreso;
    @Column(name = "Tabla_Modificada")
    private String tablaModificada;
    @Column(name = "Id_Registro_Modificado")
    private String idRegistroModificado;

    public Bitacoraaccesos() {
    }

    public Bitacoraaccesos(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUsuario() {
        return usuario;
    }

    public void setUsuario(Integer usuario) {
        this.usuario = usuario;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public String getTablaModificada() {
        return tablaModificada;
    }

    public void setTablaModificada(String tablaModificada) {
        this.tablaModificada = tablaModificada;
    }

    public String getIdRegistroModificado() {
        return idRegistroModificado;
    }

    public void setIdRegistroModificado(String idRegistroModificado) {
        this.idRegistroModificado = idRegistroModificado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bitacoraaccesos)) {
            return false;
        }
        Bitacoraaccesos other = (Bitacoraaccesos) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entidades.Bitacoraaccesos[ id=" + id + " ]";
    }
    
}
