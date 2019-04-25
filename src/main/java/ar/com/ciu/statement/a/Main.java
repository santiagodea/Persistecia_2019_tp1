package ar.com.ciu.statement.a;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import ar.com.ciu.model.Cliente;

/**
 * 
 * Statement
 * 
 * @author Satiago
 *
 */
public class Main {

	private static Connection dbConnection = null;

	public static void main(String[] args) {
		try {
			
			Cliente titular = new Cliente("35","Marcelo", "Gallardo");
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			dbConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/facturacion", "root", "33269447");
			Statement statement = dbConnection.createStatement();
			
			//insert
			//String sql = "insert into titular (codigo, apellido, nombre) values ('35', 'Gallardo', 'Marcelo')";
			String sql = "insert into cliente (codigo, apellido, nombre) values ('" + titular.getCodigo() + "', '" + titular.getApellido() + "', '" + titular.getNombre() + "')";
			System.out.println(sql);
			statement.execute(sql);

			// select
			 String query = "select * from cliente";
			 ResultSet rs = statement.executeQuery(query);
			 while (rs.next()) {
				int id = rs.getInt("id_cliente");
				String cod = rs.getString("codigo");
				String ape = rs.getString("apellido");
				String nom = rs.getString("nombre");
				System.out.println("");
				System.out.print("id: " + id);
				System.out.print(" , codigo: " + cod);
				System.out.print(" , apellido: " + ape);
				System.out.print(" , nombre: " + nom);
			}

			statement.close();
			dbConnection.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
