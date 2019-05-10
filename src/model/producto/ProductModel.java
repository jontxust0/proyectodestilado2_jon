package model.producto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.PreparedStatement;

import model.subcategoria.SubcategoriaModel;

public class ProductModel extends ProductClass{

	ArrayList<ProductClass> producto =new ArrayList<ProductClass>();
	
	public ProductModel() {
		super();
	}

	public ProductModel(int id, String nombre, String descripcion, String img, double precio, int id_categoria,
			ArrayList<ProductClass> producto) {
		super(id, nombre, descripcion, img, precio, id_categoria);
		this.producto = producto;
	}

	public ArrayList<ProductClass> getProducto() {
		return producto;
	}

	public void setProducto(ArrayList<ProductClass> producto) {
		this.producto = producto;
	}

	public void loadData()
	{
		this.createConnection();
		
		Statement st;
		try {
			
			st = this.con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM productos");

			while (rs.next()) // reads the table line by line
			{
				ProductClass newD = new ProductClass();
				
				newD.id=Integer.parseInt(rs.getString("id"));
				newD.nombre=rs.getString("nombre");
				newD.descripcion=rs.getString("descripcion");
				newD.img=rs.getString("img");
				newD.precio=Double.parseDouble(rs.getString("precio"));
				newD.id_categoria=Integer.parseInt(rs.getString("id_categoria"));
				
				
				this.producto.add(newD);
			
			} 
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		this.disconnect();
	}
	
	public void editarProducto(int id) 
		{
			this.createConnection();
			
			String mensaje="";
			PreparedStatement pst;
			try {
				pst = this.con.prepareStatement("UPDATE LIBROS " 
												+ " SET nombre=?,  "
												+" descripcion=? ,  "
												+" img=?  "
												+" precio=? , " 
												+" WHERE productos.id=?");

				pst.setInt(1, this.id);
				pst.setString(3, this.nombre);
				pst.setString(3, this.descripcion);
				pst.setString(4, this.img);
				pst.setDouble(5, this.precio);
				pst.setInt(6, this.id_categoria);
					
				pst.execute();
				
				 
			}catch (SQLException e) {
				
				e.printStackTrace();
			}
			this.disconnect();
		}
}
