package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

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
			//int idProducto=Integer.parseInt(request.getParameter("id"));
			String comprador=request.getParameter("comprador");
			String direccion=request.getParameter("direccion");
			int telefono=Integer.parseInt(request.getParameter("telefono"));
			String dni=request.getParameter("dni");
			String carrito=request.getParameter("carrito");
			
			//inser factura en la BBDD y recojes la id de factura
			FacturaModel factura=new FacturaModel();
			factura.insertFactura(comprador,direccion,telefono, dni);
			
			//ProductoFacturaModel lineaFactura= new ProductoFacturaModel();
			//lineaFactura.insertLinea(carrito, idFactura);
			
			JSONArray arrCarrito =new JSONArray(carrito);
			
			//recorrer el carrito y hacer inserts en producto factura
			
			
			
			
			//System.out.println("comp:" + comprador + " Carrito:" +carrito );
			
			
	}

}
