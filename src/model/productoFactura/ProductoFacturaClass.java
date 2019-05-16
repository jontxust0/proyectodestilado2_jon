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
	
	protected ProductClass producto;
	protected FacturaClass Linea_factura;
	protected int cantidad;

	/**
	 * @param producto
	 * @param factura
	 * @param cantidad
	 */
	public ProductoFacturaClass(ProductClass producto, FacturaClass Linea_factura, int cantidad) {
		super();
		this.producto = producto;
		this.Linea_factura = Linea_factura;
		this.cantidad = cantidad;
	}

	public ProductoFacturaClass() {
		super();
	}

	/**
	 * @return the producto
	 */
	public ProductClass getProducto() {
		return producto;
	}

	/**
	 * @param producto the producto to set
	 */
	public void setProducto(ProductClass producto) {
		this.producto = producto;
	}

	/**
	 * @return the factura
	 */
	public FacturaClass getLinea_factura() {
		return Linea_factura;
	}

	/**
	 * @param factura the factura to set
	 */
	public void setLinea_factura(FacturaClass Linea_factura) {
		this.Linea_factura = Linea_factura;
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
	

}