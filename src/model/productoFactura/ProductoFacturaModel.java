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
				newD.id=Integer.parseInt(rs.getString(1));
				newD.nombre=rs.getString(2);
				newD.id_categoria=Integer.parseInt(rs.getString(3));
				
				this.categoria.add(newD);
			
			} 
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		this.disconnect();
	}
	

}
