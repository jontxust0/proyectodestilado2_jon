package model.productoFactura;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.factura.FacturaModel;
import model.producto.ProductModel;
import model.subcategoria.SubcategoriaModel;

public class ProductoFacturaModel extends ProductoFacturaClass{

	ArrayList<ProductModel> product =new ArrayList<>(); 
	
	ArrayList<FacturaModel> factura =new ArrayList<>(); 
	
	public void loadData()
	{
		this.createConnection();
		
		Statement st;
		try {
			
			st = this.con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM subcategoria ");

			while (rs.next()) // reads the table line by line
			{
				SubcategoriaModel newD = new SubcategoriaModel();
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
