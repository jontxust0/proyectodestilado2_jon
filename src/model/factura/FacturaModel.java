	/**

	 * Esta clase contiene una arrayList de un clase para almacenar los datos  y metodos

	 * @author: Ibai Acha

	 * @version: 7/5/2019

	 */
package model.factura;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.productoFactura.ProductoFacturaModel;


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
				newF.fecha_compra=rs.getDate("fecha_compra");
				newF.comprador=rs.getString("comprador");
				newF.direccion=rs.getString("direccion");
				newF.telefono=rs.getString("telefono");
				newF.dni=rs.getString("id");
				
				this.factura.add(newF);
			
			} 
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		this.disconnect();
	}


	public void selectedFactura(int idFactura) {
		this.createConnection();
		
		Statement st;
		try {
			st = this.con.createStatement();	
			ResultSet rs = st.executeQuery("SELECT * FROM facturas WHERE facturas.id="+idFactura);
			
			while (rs.next()){
				FacturaClass factura = new FacturaClass();
				
				factura.setId(rs.getInt("id"));
				factura.setFecha_compra(rs.getDate("fecha_compra"));
				factura.setComprador(rs.getString("comprador"));
				factura.direccion=rs.getString("direccion");
				factura.telefono=rs.getString("telefono");
				factura.dni=rs.getString("dni");
				
				this.factura.add(factura);
				

			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		this.disconnect();
		
	}

	public int insertFactura() {
		this.createConnection();
		
		PreparedStatement pst;
		int idFactura=0;
		
		try {
			pst = this.con.prepareStatement("call InsertarFactura(?,?,?,?)");
			
			pst.setString(1, this.comprador);
			pst.setString(2, this.direccion);
			pst.setString(3, this.telefono);
			pst.setString(4, this.dni);
	
			ResultSet rs= pst.executeQuery();
			
			if (rs.next()) {
				 idFactura= rs.getInt("idFactura");
			}
						
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		this.disconnect();
		
		return idFactura;
		
	}

	public void borrarFactura(int idFactura) {

        this.createConnection();
        
        	PreparedStatement pst;
        try  {
                pst = this.con.prepareStatement("call EliminarFactura(?)");
           
        	//DELETE FROM facturas WHERE id = _id
                pst.setInt(1, idFactura);

                pst.execute();
                pst.close();

            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                ex.printStackTrace();
            }
        }
}