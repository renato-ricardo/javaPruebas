/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Ricardo Herrera
 */
public class conexion {

    public String db = "Sistema_de_Ventas;";
    public String user = "Ricardo;";
    public String pass = "rhvjinzo101212;";
    public String url = "jdbc:sqlserver://Localhost\\:1433;databaseName=" + db + "user=" + user + "password=" + pass;

    private Statement st;
    private ResultSet rs;
    

    public Connection conectar() {
        Connection link = null;
        int contador = 0;
        try {

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            link = DriverManager.getConnection(url);

   

        } catch (Exception e) {
            
            JOptionPane.showMessageDialog(null, "Error al conectar " + e.getMessage());
        }

        return link;

    }

    public void mostrarData() {
        Connection cn = conectar();
        int contador = 0;
        
        try {
             st = cn.createStatement();


            String sql = "select * from habitacion";

            rs = st.executeQuery(sql);
            //Estamos consumiendo por procedimientos
            //CallableStatement sts = link.prepareCall("[MostrarViajes]");

            while (rs.next()) {
                contador++;
                String NumeroEconomico = rs.getString(1);
                String Nombre = rs.getString(2);
                String NombreRuta = rs.getString(3);

                System.out.println(contador + " -. " + NumeroEconomico + " - " + Nombre + " - " + NombreRuta);

            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "No se pudieron obtener los datos");
        }

    }
    


}
