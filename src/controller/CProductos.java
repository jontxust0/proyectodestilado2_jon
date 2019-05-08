package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.json.JSONStringer;

import model.producto.ProductModel;

/**
 * Servlet implementation class CCliente
 */
@WebServlet("/CCliente")
public class CProductos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CProductos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductModel productos = new ProductModel();
		productos.loadData();
		
		String jsonString = JSONStringer.valueToString(productos);
		 ArrayList<JSONObject> jsonArrayProducto=new ArrayList<JSONObject>();

         for (int i=0;i<productos.getProducto().size();i++){

             JSONObject jsonProducto=new JSONObject();
             
             jsonProducto.put("id", productos.getProducto().get(i).getId());
             jsonProducto.put("nombre", productos.getProducto().get(i).getNombre());
             jsonProducto.put("descripcion", productos.getProducto().get(i).getDescripcion());
             jsonProducto.put("img", productos.getProducto().get(i).getImg());
             jsonProducto.put("precio", productos.getProducto().get(i).getPrecio());
             jsonProducto.put("id_categoria", productos.getProducto().get(i).getId_categoria());
             
             
             jsonArrayProducto.add(jsonProducto);
         }

        PrintWriter out = response.getWriter();

        response.setHeader("Access-Control-Allow-Origin","*"); //jsonp deia denean ez da behar
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        out.print(jsonArrayProducto);
        out.flush();

        
		//request.getRequestDispatcher("view/vCliente.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
