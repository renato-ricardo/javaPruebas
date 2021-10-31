/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import Datos.vcliente;
import Datos.vtrabajador;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Ricardo Herrera
 */
public class ftrabajador {

    private conexion sqlServer = new conexion();
    private Connection cn = sqlServer.conectar();
    private String sSQL = "";
    private String sSQL2 = "";
    public Integer totalregistros;

    public DefaultTableModel mostrar(String buscar) {
        DefaultTableModel modelo;

        String[] titulos = {"ID", "Nombre", "Apaterno", "Amaterno", "Doc", "Numero documento", "Direccion", "Telefono", "Email", "Sueldo",
            "Acceso", "Login", "Password", "Estado"};

        String[] registros = new String[14];

        totalregistros = 0;
        modelo = new DefaultTableModel(null, titulos);

        sSQL = "SELECT p.idpersona,p.nombre,p.apaterno,p.amaterno,p.tipo_documento,p.num_documento,p.direccion,p.telefono,p.email,"
                + "t.sueldo,t.acceso,t.login,t.password,t.estado FROM persona p inner join trabajador t on t.idpersona = p.idpersona WHERE p.nombre like '%" + buscar + "%' ";
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sSQL);

            while (rs.next()) {

                registros[0] = rs.getString("idpersona");
                registros[1] = rs.getString("nombre");
                registros[2] = rs.getString("apaterno");
                registros[3] = rs.getString("amaterno");
                registros[4] = rs.getString("tipo_documento");
                registros[5] = rs.getString("num_documento");
                registros[6] = rs.getString("direccion");
                registros[7] = rs.getString("telefono");
                registros[8] = rs.getString("email");
                registros[9] = rs.getString("sueldo");
                registros[10] = rs.getString("acceso");
                registros[11] = rs.getString("login");
                registros[12] = rs.getString("password");
                registros[13] = rs.getString("estado");

                totalregistros = totalregistros + 1;
                modelo.addRow(registros);

            }
            return modelo;
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
            return null;
        }

    }

    public void mensajeError(Object mensaje) {

        JOptionPane.showMessageDialog(null, mensaje);

    }

    public boolean insertar(vtrabajador dts) {
        sSQL = "INSERT INTO persona (nombre,apaterno,amaterno,tipo_documento,num_documento,direccion,telefono,email)"
                + " VALUES (?,?,?,?,?,?,?,?)";

        sSQL2 = "INSERT INTO trabajador (idpersona,sueldo,acceso,login,password,estado)"
                + "VALUES((select top 1 idpersona from persona order by idpersona desc),?,?,?,?,?)";

        try {

            PreparedStatement pst = cn.prepareStatement(sSQL);
            PreparedStatement pst2 = cn.prepareStatement(sSQL2);

            pst.setString(1, dts.getNombre());
            pst.setString(2, dts.getApaterno());
            pst.setString(3, dts.getAmaterno());
            pst.setString(4, dts.getTipo_documento());
            pst.setString(5, dts.getNumero_documento());
            pst.setString(6, dts.getDireccion());
            pst.setString(7, dts.getTelefono());
            pst.setString(8, dts.getEmail());

            System.out.println("Sueldo : " + dts.getSueldo() + "\n Acceso " + dts.getAcceso()
                    + "\n Login : " + dts.getLogin() + "\n Password " + dts.getPassword() + "\n Estado " + dts.getEstado());

            pst2.setDouble(1, dts.getSueldo());
            pst2.setString(2, dts.getAcceso());
            pst2.setString(3, dts.getLogin());
            pst2.setString(4, dts.getPassword());
            pst2.setString(5, dts.getEstado());

            int n = pst.executeUpdate();
            int n2 = pst2.executeUpdate();

            if (n != 0) {

                if (n2 != 0) {
                    return true;
                } else {
                    return false;
                }

            } else {
                return false;
            }

        } catch (SQLException e) {
            mensajeError(e.getMessage() + e.getLocalizedMessage());
            return false;
        }

    }

    public boolean editar(vtrabajador dts) {
        sSQL = "update persona set nombre = ?,apaterno = ?,amaterno = ?,tipo_documento = ?, num_documento = ?,"
                + "direccion = ?,telefono = ?,email = ? where idpersona = ?";

        sSQL2 = "update trabajador set sueldo = ?,acceso = ?, login = ?,password = ?, estado = ? where idpersona = ?";

        try {
            PreparedStatement pst = cn.prepareStatement(sSQL);
            PreparedStatement pst2 = cn.prepareStatement(sSQL2);

            pst.setString(1, dts.getNombre());
            pst.setString(2, dts.getApaterno());
            pst.setString(3, dts.getAmaterno());
            pst.setString(4, dts.getTipo_documento());
            pst.setString(5, dts.getNumero_documento());
            pst.setString(6, dts.getDireccion());
            pst.setString(7, dts.getTelefono());
            pst.setString(8, dts.getEmail());
            pst.setInt(9, dts.getIdpersona());

            pst2.setDouble(1, dts.getSueldo());
            pst2.setString(2, dts.getAcceso());
            pst2.setString(3, dts.getLogin());
            pst2.setString(4, dts.getPassword());
            pst2.setString(5, dts.getEstado());
            pst2.setInt(6, dts.getIdpersona());

            System.out.println("Sueldo : " + dts.getSueldo() + "\n Acceso " + dts.getAcceso()
                    + "\n Login : " + dts.getLogin() + "\n Password " + dts.getPassword() + "\n Estado " + dts.getEstado());

            int n = pst.executeUpdate();

            if (n != 0) {

                int n2 = pst2.executeUpdate();

                if (n2 != 0) {
                    return true;
                } else {
                    return false;
                }

            } else {
                return false;
            }

        } catch (SQLException e) {
            JOptionPane.showConfirmDialog(null, e.getMessage());
            return false;
        }

    }

    public boolean eliminar(vtrabajador dts) {
        sSQL = "DELETE  FROM trabajador where idpersona  = ?";
        sSQL2 = "DELETE FROM persona where idpersona = ?";

        try {

            PreparedStatement pst = cn.prepareStatement(sSQL);
            PreparedStatement pst2 = cn.prepareStatement(sSQL);

            pst.setInt(1, dts.getIdpersona());
            pst2.setInt(1, dts.getIdpersona());

            int n = pst.executeUpdate();

            if (n != 0) {

                int n2 = pst2.executeUpdate();

                if (n2 != 0) {
                    return true;
                } else {
                    return false;
                }

            } else {
                return false;
            }

        } catch (SQLException e) {
            mensajeError(e.getMessage());
            return false;
        }

    }

    public DefaultTableModel login (String login,String password) {
        DefaultTableModel modelo;

        String[] titulos = {"ID", "Nombre", "Apaterno", "Amaterno","Acceso", "Login", "Password", "Estado"};

        String[] registros = new String[8];

        totalregistros = 0;
        modelo = new DefaultTableModel(null, titulos);

        sSQL = "SELECT p.idpersona,p.nombre,p.apaterno,p.amaterno"
                + ",t.acceso,t.login,t.password,t.estado FROM persona p "
                + "inner join trabajador t on t.idpersona = p.idpersona WHERE t.login = '" + login + "' and t.password = '"+password+"' and t.estado ='A'";
        
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sSQL);

            while (rs.next()) {

                registros[0] = rs.getString("idpersona");
                registros[1] = rs.getString("nombre");
                registros[2] = rs.getString("apaterno");
                registros[3] = rs.getString("amaterno");
                
                registros[4] = rs.getString("acceso");
                registros[5] = rs.getString("login");
                registros[6] = rs.getString("password");
                registros[7] = rs.getString("estado");

                totalregistros = totalregistros + 1;
                modelo.addRow(registros);

            }
            return modelo;
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
            return null;
        }

    }

}
