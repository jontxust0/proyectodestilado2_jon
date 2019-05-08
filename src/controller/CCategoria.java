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

import model.categoria.CategoriaModel;

/**
 * Servlet implementation class CCategoria
 */
@WebServlet("/CCategoria")
public class CCategoria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CCategoria() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		CategoriaModel categoria = new CategoriaModel();
		categoria.loadData();
		
		String jsonString = JSONStringer.valueToString(categoria);
		 ArrayList<JSONObject> jsonArrayCategoria=new ArrayList<JSONObject>();

         for (int i=0;i<categoria.getCategoria().size();i++){

             JSONObject jsonCategoria=new JSONObject();
             
             jsonCategoria.put("id", categoria.getCategoria().get(i).getId());
             jsonCategoria.put("nombre", categoria.getCategoria().get(i).getNombre());

             
             jsonArrayCategoria.add(jsonCategoria);
         }

        PrintWriter out = response.getWriter();

        response.setHeader("Access-Control-Allow-Origin","*"); //jsonp deia denean ez da behar
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        out.print(jsonArrayCategoria);
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