package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import model.factura.FacturaModel;
import model.productoFactura.ProductoFacturaModel;

/**
 * Servlet implementation class CCrearFactura
 */
@WebServlet("/CCrearFactura")
public class CCrearFactura extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CCrearFactura() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			String comprador=request.getParameter("comprador");
			String direccion=request.getParameter("direccion");
			String telefono=request.getParameter("telefono");
			String dni=request.getParameter("dni");
			String carrito=request.getParameter("carrito");
			
			//inser factura en la BBDD y recojes la id de factura
			FacturaModel factura=new FacturaModel();
			factura.setComprador(comprador);
			factura.setDireccion(direccion);
			factura.setTelefono(telefono);
			factura.setDni(dni);
			
			int idFactura= factura.insertFactura();
			
			JSONArray arrCarrito =new JSONArray(carrito);
	
			
			//recorrer el carrito y hacer inserts en producto factura
			
			for (int i=0; i <arrCarrito.length();i++)  {
				
				ProductoFacturaModel lineaFactura= new ProductoFacturaModel();
				
				JSONObject compra=arrCarrito.getJSONObject(i);
				
				lineaFactura.setId_factura(idFactura);
				lineaFactura.setId_producto(compra.getInt("id"));
				lineaFactura.setNombre(compra.getString("nombre"));
				lineaFactura.setCantidad(compra.getInt("cantidad"));
				lineaFactura.setPrecio(compra.getDouble("precio"));
				
				//System.out.println(compra.toString());
				
				lineaFactura.insertLinea();
			}
			
			request.setAttribute("idFactura", idFactura);
			//request.getRequestDispatcher("view/vCompra.jsp").forward(request, response);
			
			//System.out.println("comp:" + comprador + " Carrito:" +carrito );
			
			
	}

}
