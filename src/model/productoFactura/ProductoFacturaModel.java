	/**
	 * Esta clase contiene una arrayList de un clase para almacenar los datos  
	 * @author: Ibai Acha
	 * @version: 7/5/2019
	 */
package model.productoFactura;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.json.JSONObject;

import model.factura.FacturaClass;
import model.producto.ProductClass;
import model.subcategoria.SubcategoriaModel;

public class ProductoFacturaModel extends ProductoFacturaClass{	


	//Metodos
	
	/**
	 * Carga los datos 
	 */
	public void loadData()
	{
		this.createConnection();
		
		Statement st;
		try {
			
			st = this.con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM producto_factura");

			while (rs.next()) // reads the table line by line
			{
				ProductoFacturaModel newD = new ProductoFacturaModel();
				
			
			} 
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		this.disconnect();
	}

	public void insertLinea() {
		
		//cada linea del carrito
		
		this.createConnection();
		
		PreparedStatement pst;

		try {
			pst = this.con.prepareStatement("call InsertLineaFactura(?,?,?,?,?)");
			
			pst.setInt(1, this.id_factura);
			pst.setInt(2, this.id_producto);
			pst.setString(3, this.nombre);
			pst.setInt(4, this.cantidad);
			pst.setDouble(5, this.precio);
			
			pst.execute();
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		this.disconnect();
		
	}
	

}