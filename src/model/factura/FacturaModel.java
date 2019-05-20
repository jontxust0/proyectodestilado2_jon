	/**

	 * Esta clase contiene una arrayList de un clase para almacenar los datos  y metodos

	 * @author: Ibai Acha

	 * @version: 7/5/2019

	 */
package model.factura;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class FacturaModel extends FacturaClass{

	ArrayList<FacturaClass> factura =new ArrayList<FacturaClass>();
	

	public FacturaModel() {
		super();
	}

	public FacturaModel(ArrayList<FacturaClass> factura) {
		super();
		this.factura = factura;
	}

	public ArrayList<FacturaClass> getFactura() {
		return factura;
	}


	public void setFactura(ArrayList<FacturaClass> factura) {
		this.factura = factura;
	}


	/**
	 * Carga los datos de los productos
	 */
	public void loadData()
	{
		this.createConnection();
		
		Statement st;
		try {
			
			st = this.con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM facturas");

			while (rs.next()) // reads the table line by line
			{
				FacturaModel newF = new FacturaModel();
				newF.id=Integer.parseInt(rs.getString("id"));
				newF.fecha_compra=rs.getDate("fecha_compra");
				newF.comprador=rs.getString("comprador");
				newF.direccion=rs.getString("direccion");
				newF.telefono=rs.getInt("telefono");
				newF.dni=rs.getString("id");
				
				this.factura.add(newF);
			
			} 
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		this.disconnect();
	}


	public void selectedFactura(int id) {
		this.createConnection();
		
		Statement st;
		try {
			st = this.con.createStatement();	
			ResultSet rs = st.executeQuery("SELECT * FROM facturas WHERE  id = "+id);
			
			while (rs.next()){
				
				FacturaClass factura = new FacturaClass();
				
				factura.setId(rs.getInt("id"));
				factura.setFecha_compra(rs.getDate("fecha_compra"));
				factura.setComprador(rs.getString("comprador"));
				factura.direccion=rs.getString("direccion");
				factura.telefono=rs.getInt("telefono");
				factura.dni=rs.getString("id");
				
				this.factura.add(factura);
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		this.disconnect();
		
	}
	/*
	String mensaje="";
	PreparedStatement pst;
	try {
		pst = this.con.prepareStatement("DELETE FROM LIBROS "
										 + " WHERE LIBROS.id=?");
		
		pst.setInt(1, this.id);

		
		pst.execute();
		mensaje="Libro borrado en la BD";
		
	} catch (SQLException e) {
		
		mensaje="No se ha podido borrado el libro en la BD";
	}
	return mensaje;
}
		*/

	public int insertFactura(String comprador, String direccion, int telefono, String dni) {
		this.createConnection();
		
		PreparedStatement pst;
		int idFactura=0;
		
		try {
			pst = this.con.prepareStatement("call InsertarFactura(?,?,?,?)");
			
			pst.setString(1, this.comprador);
			pst.setString(2, this.direccion);
			pst.setInt(3, this.telefono);
			pst.setString(4, this.dni);
	
			ResultSet rs= pst.executeQuery();
			
			if (rs.next()) {
				 idFactura= rs.getInt("idFactura");
			}
						
			} catch (SQLException e) {
			
		}
		
		this.disconnect();
		
		return idFactura;
		
	}

	/*public void newId() {
		this.createConnection();
		
		Statement st;
		try {
			
			st = this.con.createStatement();
			ResultSet rs = st.executeQuery("SELECT max(id) FROM `facturas`");

			while (rs.next()) // reads the table line by line
			{

			} 
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		this.disconnect();
	}*/

		
		
}