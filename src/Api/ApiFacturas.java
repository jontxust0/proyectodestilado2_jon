package Api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.factura.FacturaModel;

/**
 * Servlet implementation class ApiFacturas
 */
@WebServlet("/ApiFacturas")
public class ApiFacturas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApiFacturas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		FacturaModel factura = new FacturaModel();
		factura.loadData();

	//	String jsonString = JSONStringer.valueToString(productos);
		 ArrayList<JSONObject> jsonArrayFactura=new ArrayList<JSONObject>();

         for (int i=0;i<factura.getFactura().size();i++){

             JSONObject jsonFactura=new JSONObject();
             
             
             jsonFactura.put("id", factura.getFactura().get(i).getId());
             jsonFactura.put("cantidadTot", factura.getFactura().get(i).getCantidadTot());
             jsonFactura.put("precioTot", factura.getFactura().get(i).getPrecioTot());
             jsonFactura.put("productos", factura.getFactura().get(i).getProductos());
             jsonFactura.put("fecha_compra", factura.getFactura().get(i).getFecha_compra());
             jsonFactura.put("comprador", factura.getFactura().get(i).getComprador());
             jsonFactura.put("direccion", factura.getFactura().get(i).getDireccion());
             jsonFactura.put("telefono", factura.getFactura().get(i).getTelefono());
             
             jsonArrayFactura.add(jsonFactura);
         }

        PrintWriter out = response.getWriter();

        response.setHeader("Access-Control-Allow-Origin","*"); //jsonp deia denean ez da behar
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        out.print(jsonArrayFactura);
        out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
