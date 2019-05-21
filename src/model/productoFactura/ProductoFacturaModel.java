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

	ArrayList<ProductoFacturaClass> lineaFactura = new ArrayList<ProductoFacturaClass>();

	/**
	 * 
	 */
	public ProductoFacturaModel() {
		super();
	}

	/**
	 * @param id_factura
	 * @param id_producto
	 * @param nombre
	 * @param cantidad
	 * @param precio
	 * @param lineaFactura
	 */
	public ProductoFacturaModel(int id_factura, int id_producto, String nombre, int cantidad, double precio,
			ArrayList<ProductoFacturaClass> lineaFactura) {
		super(id_factura, id_producto, nombre, cantidad, precio);
		this.lineaFactura = lineaFactura;
	}

	//Metodos
	
	/**
	 * @return the lineaFactura
	 */
	public ArrayList<ProductoFacturaClass> getLineaFactura() {
		return lineaFactura;
	}

	/**
	 * @param lineaFactura the lineaFactura to set
	 */
	public void setLineaFactura(ArrayList<ProductoFacturaClass> lineaFactura) {
		this.lineaFactura = lineaFactura;
	}

	/**
	 * Carga los datos 
	 */
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

	public void selectedLineaFactura(int id) {
		this.createConnection();
		
		Statement st;
		try {
			st = this.con.createStatement();	
			ResultSet rs = st.executeQuery("call mostrarFacturas(?)");
			
			while (rs.next()){
				
				ProductoFacturaClass lineaFactura = new ProductoFacturaClass();
				
				
				lineaFactura.setId_factura(rs.getInt("id_factura"));
				lineaFactura.setId_producto(rs.getInt("id_producto"));
				lineaFactura.setNombre(rs.getString("nombre"));
				lineaFactura.setCantidad(rs.getInt("cantidad"));
				lineaFactura.setPrecio(rs.getInt("precio"));
				
				this.lineaFactura.add(lineaFactura);
				

			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		this.disconnect();
		

	
		
		
		
		
	}
	

}