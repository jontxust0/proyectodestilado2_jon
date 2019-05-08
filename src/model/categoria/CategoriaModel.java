package model.categoria;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.subcategoria.SubcategoriaModel;

public class CategoriaModel extends CategoriaClass{

	ArrayList<CategoriaClass> categoria =new ArrayList<CategoriaClass>();
	
	public void loadData()
	{
		this.createConnection();
		
		Statement st;
		try {
			
			st = this.con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM categoria ");

			while (rs.next()) // reads the table line by line
			{
				CategoriaModel newD = new CategoriaModel();
				newD.id=Integer.parseInt(rs.getString(1));
				newD.nombre=rs.getString(2);
				
				this.categoria.add(newD);
			
			} 
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		this.disconnect();
	}
}
