/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import Datos.vproducto;
/**
 *
 * @author Ricardo Herrera
 */
public class fproducto {

    private conexion sqlServer = new conexion();
    private Connection cn = sqlServer.conectar();
    private String sSQL = "";
    public Integer totalregistros;

    public DefaultTableModel mostrar(String buscar) {
        DefaultTableModel modelo;

        String[] titulos = {"ID", "Nombre", "Descripcion", "Unidad de Medida", "Precio Venta"};
        String[] registros = new String[5];

        totalregistros = 0;
        modelo = new DefaultTableModel(null, titulos);

        sSQL = "select * from producto where nombre like '%" + buscar + "%' or descripcion like '% " + buscar + "  %' or unidad_medida like '%"+buscar+"%'  order by idproducto";

        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sSQL);

            while (rs.next()) {
                registros[0] = rs.getString("idproducto");
                registros[1] = rs.getString("nombre");
                registros[2] = rs.getString("descripcion");
                registros[3] = rs.getString("unidad_medida");
                registros[4] = rs.getString("precio_venta");

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

    public boolean insertar(vproducto dts) {
        sSQL = "insert into producto (nombre,descripcion,unidad_medida,precio_venta) "
                + " VALUES (?,?,?,?)";
        try {

            PreparedStatement pst = cn.prepareStatement(sSQL);

            pst.setString(1, dts.getNombre());
            pst.setString(2, dts.getDescripcion());
            pst.setString(3, dts.getUnidad_medida());
            pst.setDouble(4, dts.getPrecio_vanta());


            int n = pst.executeUpdate();

            if (n != 0) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException e) {
            mensajeError(e.getMessage());
            return false;
        }

    }

    public boolean editar(vproducto dts) {
        sSQL = "update producto set nombre = ?,descripcion = ?,unidad_medida = ?,precio_venta = ? where idproducto = ?";
        try {

            PreparedStatement pst = cn.prepareStatement(sSQL);

            pst.setString(1, dts.getNombre());
            pst.setString(2, dts.getDescripcion());
            pst.setString(3, dts.getUnidad_medida());
            pst.setDouble(4, dts.getPrecio_vanta());
            pst.setDouble(5, dts.getIdproducto());


            int n = pst.executeUpdate();

            if (n != 0) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException e) {
            JOptionPane.showConfirmDialog(null, e.getMessage());
            return false;
        }

    }

    public boolean eliminar(vproducto dts) {
        sSQL = "DELETE  FROM producto where idproducto=?";

        try {

            PreparedStatement pst = cn.prepareStatement(sSQL);

            pst.setInt(1, dts.getIdproducto());

            int n = pst.executeUpdate();

            if (n != 0) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            mensajeError(e.getMessage());
            return false;
        }

    }

}
