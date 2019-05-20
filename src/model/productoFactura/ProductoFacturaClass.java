	/**
	 * Esta clase contiene los atributos de la base de datos, con getters, setters y 2 contructores uno vacio y el otro lleno 
	 * @author: Ibai Acha
	 * @version: 7/5/2019
	 */
package model.productoFactura;

import java.util.ArrayList;

import model.Connect;
import model.factura.FacturaClass;
import model.producto.ProductClass;

public class ProductoFacturaClass  extends Connect{
	
	protected int id_factura;
	protected int id_producto;
	protected String nombre;
	protected int cantidad;
	protected double precio;
	
	
	
	
	
	
	
	/**
	 * 
	 */
	public ProductoFacturaClass() {
		super();
	}
	/**
	 * @param id_factura
	 * @param id_producto
	 * @param nombre
	 * @param cantidad
	 * @param precio
	 */
	public ProductoFacturaClass(int id_factura, int id_producto, String nombre, int cantidad, double precio) {
		super();
		this.id_factura = id_factura;
		this.id_producto = id_producto;
		this.nombre = nombre;
		this.cantidad = cantidad;
		this.precio = precio;
	}
	/**
	 * @return the id_factura
	 */
	public int getId_factura() {
		return id_factura;
	}
	/**
	 * @param id_factura the id_factura to set
	 */
	public void setId_factura(int id_factura) {
		this.id_factura = id_factura;
	}
	/**
	 * @return the id_producto
	 */
	public int getId_producto() {
		return id_producto;
	}
	/**
	 * @param id_producto the id_producto to set
	 */
	public void setId_producto(int id_producto) {
		this.id_producto = id_producto;
	}
	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}
	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	/**
	 * @return the cantidad
	 */
	public int getCantidad() {
		return cantidad;
	}
	/**
	 * @param cantidad the cantidad to set
	 */
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	/**
	 * @return the precio
	 */
	public double getPrecio() {
		return precio;
	}
	/**
	 * @param precio the precio to set
	 */
	public void setPrecio(double precio) {
		this.precio = precio;
	}

	
	

}