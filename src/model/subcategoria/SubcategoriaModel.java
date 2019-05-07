package model.subcategoria;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

public class SubcategoriaModel extends SubcategoriaClass {

	ArrayList<SubcategoriaClass> categoria =new ArrayList<SubcategoriaClass>();
	
	//-------Methods---------\\
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
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.disconnect();
	}
}
