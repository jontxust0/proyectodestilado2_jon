package model.producto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.subcategoria.SubcategoriaModel;

public class ProductModel extends ProductClass{

	ArrayList<ProductClass> producto =new ArrayList<ProductClass>();
	
	public void loadData()
	{
		this.createConnection();
		
		Statement st;
		try {
			
			st = this.con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM subcategoria ");

			while (rs.next()) // reads the table line by line
			{
				ProductClass newD = new ProductClass();
				newD.id=Integer.parseInt(rs.getString(1));
				newD.nombre=rs.getString(2);
				newD.descripcion=rs.getString(3);
				newD.img=rs.getString(4);
				newD.precio=Double.parseDouble(rs.getString(5));
				newD.id_categoria=Integer.parseInt(rs.getString(3));
				
				this.producto.add(newD);
			
			} 
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		this.disconnect();
	}
	
	
}
