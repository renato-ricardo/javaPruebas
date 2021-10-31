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
import Datos.vreserva;
/**
 *
 * @author Ricardo Herrera
 */
public class freserva {

    private conexion sqlServer = new conexion();
    private Connection cn = sqlServer.conectar();
    private String sSQL = "";
    public Integer totalregistros;

    public DefaultTableModel mostrar(String buscar) {
        DefaultTableModel modelo;

        String[] titulos =
        {"ID", "idhabitacion", "Numero", 
         "idcliente", "Cliente","idtrabajador","Trabajador","Tipo Reserva","Fecha Reserva",
         "Fecha Ingresa","Fecha Salida","Costo Alojamiento","Estado"};
        String[] registros = new String[13];

        totalregistros = 0;
        modelo = new DefaultTableModel(null, titulos);

        sSQL = "SELECT r.idreserva, r.idhabitacion,h.numero,r.idcliente, "+
                "(SELECT p.nombre from persona p where p.idpersona = r.idcliente) as clienten,"
                + "(SELECT p.apaterno from persona p where p.idpersona = r.idcliente ) as clienteap,"
                + "r.idtrabajador,(SELECT p.nombre from persona p where p.idpersona = r.idtrabajador) as trabajadorn,"
                + "(SELECT p.apaterno from persona p where p.idpersona = r.idtrabajador) as trabajadorap,"
                + "r.tipo_reserva,r.fecha_reserva,r.fecha_ingresa,r.fecha_salida,r.costo_alojamiento,r.estado"
                + "FROM reserva r inner join habitacion h on h.idhabitacion = r.idhabitacion where r.fecha_reserva like '%"+buscar+"%' order by idreserva desc ";

        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sSQL);

            while (rs.next()) {
                registros[0] = rs.getString("idreserva");
                registros[1] = rs.getString("idhabitacion");
                registros[2] = rs.getString("numero");
                registros[3] = rs.getString("idcliente");
                registros[4] = rs.getString("clienten") + " " + rs.getString("clienteap");
                registros[5] = rs.getString("idtrabajador");
                registros[6] = rs.getString("trabajadorn") + " " + rs.getString("trabajadorap");
                registros[7] = rs.getString("tipo_reserva");
                registros[8] = rs.getString("fecha_reserva");
                registros[9] = rs.getString("fecha_ingresa");
                registros[10] = rs.getString("fecha_salida");
                registros[11] = rs.getString("costo_alojamiento");
                registros[12] = rs.getString("estado");

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

    public boolean insertar(vreserva dts) {
        sSQL = "insert into reserva (idhabitacion,idcliente,idtrabajador,tipo_reserva,fecha_reserva,fecha_ingresa,fecha_salida,costo_alojamiento,estado) "
                + " VALUES (?,?,?,?,?,?,?,?,?)";
        try {

            PreparedStatement pst = cn.prepareStatement(sSQL);

            pst.setInt(1, dts.getIdhabitacion());
            pst.setInt(2, dts.getIdcliente());
            pst.setInt(3, dts.getIdtrabajador());
            pst.setString(4, dts.getTipo_reserva());
            pst.setDate(5, dts.getFecha_reserva());
            pst.setDate(6, dts.getFecha_ingresa());
            pst.setDate(7, dts.getFecha_salida());
            pst.setDouble(8, dts.getCosto_alojamiento());
            pst.setString(9, dts.getEstado());



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

    public boolean editar(vreserva dts) {
        sSQL = "update reserva set idhabitacion = ?,idcliente = ?,idtrabajador = ?,tipo_reserva = ?,fecha_reserva = ?,fecha_ingresa = ?,fecha_salida = ?,"
                + "costo_alojamiento = ?,estado =? where idreserva = ?";
        try {

            PreparedStatement pst = cn.prepareStatement(sSQL);

            pst.setInt(1, dts.getIdhabitacion());
            pst.setInt(2, dts.getIdcliente());
            pst.setInt(3, dts.getIdtrabajador());
            pst.setString(4, dts.getTipo_reserva());
            pst.setDate(5, dts.getFecha_reserva());
            pst.setDate(6, dts.getFecha_ingresa());
            pst.setDate(7, dts.getFecha_salida());
            pst.setDouble(8, dts.getCosto_alojamiento());
            pst.setString(9, dts.getEstado());
            pst.setInt(10, dts.getIdreserva());


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

    public boolean eliminar(vreserva dts) {
        sSQL = "DELETE  FROM reserva where idreserva=?";

        try {

            PreparedStatement pst = cn.prepareStatement(sSQL);

            pst.setInt(1, dts.getIdreserva());

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
