package ar.com.ciu.preparedStatement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import ar.com.ciu.model.Precio;


/**
 * 
 * PreparedStatement que retorna id.
 * 
 * @author Santiago
 *
 */

// 13. Mediante PreparedStatement cambiar el precio a un producto, esto implica crear un precio nuevo 
// (sin eliminar el que estaba de manera de dejar un historial) y actualizar el producto para que apunte al nuevo precio.



public class Main {

	private static Connection dbConnection = null;

	public static void main(String[] args) {
		try {
			
			Precio precio = new Precio(500, new Date(), 5);
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			dbConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/facturacion", "root", "33269447");
			String query = "insert into precio (monto, fecha, id_producto) values (?, ?, ?)";
	        PreparedStatement preparedStatement;
	        preparedStatement = dbConnection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	        preparedStatement.setDouble(1, precio.getMonto());
	        preparedStatement.setDate(2, new java.sql.Date(precio.getFecha().getTime()));
	        preparedStatement.setInt(3, precio.getId_producto());
	        preparedStatement.executeUpdate();
	        ResultSet rs = preparedStatement.getGeneratedKeys();
	        if (rs.next()) {
	            int idPrecio = rs.getInt(1);
	            System.out.println("id titular: " + idPrecio);
//	            UPDATE producto 
//		        SET id_precio = 2
//		        WHERE id_producto = 1;
  
				//LA IDEA CREO Q ERA HACER EL UPDATE CON ESTE FORMATO PERO NO ME SALIO LA CONSULTA.
//				String queryUpdate = "UPDATE producto SET id_precio = ? WHERE id_producto  = ?;";
//		        //PreparedStatement preparedStatement;
//		        preparedStatement = dbConnection.prepareStatement(queryUpdate);
//		        preparedStatement.setInt(1, idPrecio);
//		        preparedStatement.setInt(2, precio.getId_producto());
//		        preparedStatement.execute(queryUpdate);
		        
	            
	            System.out.println(idPrecio);
	            System.out.println(precio.getId_producto());
	            
		        String sql = "UPDATE producto SET id_precio = " + idPrecio + " WHERE id_producto  = " + precio.getId_producto();
				System.out.println(sql);
		        preparedStatement.execute(sql);
				

	        }
	        // luego con ese id puedo insertar los telefonos, pero es ¿es atómico?     
 
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}		
	}

}
