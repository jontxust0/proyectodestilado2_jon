	/**

	 * Esta clase contiene una arrayList de un clase para almacenar los datos  y metodos

	 * @author: Ibai Acha

	 * @version: 7/5/2019

	 */
package model.factura;

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
				newF.cantidadTot=Integer.parseInt(rs.getString("cantidadTot"));
				newF.precioTot=Double.parseDouble(rs.getString("precioTot"));
				newF.productos=rs.getString("productos");
				newF.fecha_compra=rs.getDate("fecha_compra");
				newF.comprador=rs.getString("comprador");
				newF.direccion=rs.getString("direccion");
				newF.telefono=rs.getInt("telefono");
				
				
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
				factura.setCantidadTot(rs.getInt("cantidadTot"));
				factura.setPrecioTot(rs.getDouble("precioTot"));
				factura.setProductos(rs.getString("productos"));
				factura.setFecha_compra(rs.getDate("fecha_compra"));
				factura.setComprador(rs.getString("comprador"));
				
				this.factura.add(factura);
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		this.disconnect();
		
	}
		
}