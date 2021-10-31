/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import Datos.vcliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class fcliente {

    private conexion sqlServer = new conexion();
    private Connection cn = sqlServer.conectar();
    private String sSQL = "";
    private String sSQL2 = "";
    public Integer totalregistros;

    public DefaultTableModel mostrar(String buscar) {
        DefaultTableModel modelo;

        String[] titulos = {"ID", "Nombre", "Apaterno", "Amaterno", "Doc", "Numero documento", "Direccion", "Telefono", "Email", "codigoCliente"};
        String[] registros = new String[10];

        totalregistros = 0;
        modelo = new DefaultTableModel(null, titulos);

        sSQL = "SELECT p.idpersona,p.nombre,p.apaterno,p.amaterno,p.tipo_documento,p.num_documento,p.direccion,p.telefono,p.email,c.codigo_cliente FROM persona p inner join cliente c on c.idpersona = p.idpersona WHERE p.nombre like '%" + buscar + "%' ";
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
                registros[9] = rs.getString("codigo_cliente");

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

    public boolean insertar(vcliente dts) {
        sSQL = "INSERT INTO persona (nombre,apaterno,amaterno,tipo_documento,num_documento,direccion,telefono,email)"
                + " VALUES (?,?,?,?,?,?,?,?)";

        sSQL2 = "INSERT INTO cliente (idpersona,codigo_cliente)"
                + "VALUES((select top 1 idpersona from persona order by idpersona desc),?)";

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
            System.out.println(dts.getDireccion());

            pst2.setString(1, dts.getCodigo_cliente());
            System.out.println("El codigo de cliente " + dts.getCodigo_cliente());

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

    public boolean editar(vcliente dts) {
        sSQL = "update persona set nombre = ?,apaterno = ?,amaterno = ?,tipo_documento = ?, num_documento = ?,"
                + "direccion = ?,telefono = ?,email = ? where idpersona = ?";

        sSQL2 = "update cliente set codigo_cliente = ? where idpersona = ?";

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

            pst2.setString(1, dts.getCodigo_cliente());
            pst2.setInt(2, dts.getIdpersona());

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

    public boolean eliminar(vcliente dts) {
        sSQL = "DELETE  FROM cliente where idpersona  = ?";
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

}
