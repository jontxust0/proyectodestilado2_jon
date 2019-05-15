	/**
	 * Esta clase contiene una arrayList de un clase para almacenar los datos  
	 * @author: Ibai Acha
	 * @version: 7/5/2019
	 */
package model.productoFactura;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.factura.FacturaClass;
import model.producto.ProductClass;
import model.subcategoria.SubcategoriaModel;

public class ProductoFacturaModel extends ProductoFacturaClass{

	ArrayList<ProductClass> product =new ArrayList<>(); 
	
	ArrayList<FacturaClass> factura =new ArrayList<>(); 
	
	
	//Constructores y getters setters
	/**
	 * 
	 */
	public ProductoFacturaModel() {
		super();
	}

	/**
	 * @param producto
	 * @param Linea_factura
	 * @param cantidad
	 * @param product
	 * @param factura
	 */
	public ProductoFacturaModel(ProductClass producto, FacturaClass Linea_factura, int cantidad,
			ArrayList<ProductClass> product, ArrayList<FacturaClass> factura) {
		super(producto, Linea_factura, cantidad);
		this.product = product;
		this.factura = factura;
	}


	/**
	 * @return the product
	 */
	public ArrayList<ProductClass> getProduct() {
		return product;
	}


	/**
	 * @param product the product to set
	 */
	public void setProduct(ArrayList<ProductClass> product) {
		this.product = product;
	}


	/**
	 * @return the factura
	 */
	public ArrayList<FacturaClass> getFactura() {
		return factura;
	}


	/**
	 * @param factura the factura to set
	 */
	public void setFactura(ArrayList<FacturaClass> factura) {
		this.factura = factura;
	}


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
	

}