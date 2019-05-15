package model.factura;

import java.util.Date;

import model.Connect;

public class FacturaClass extends Connect{

	protected int id;
	protected int cantidadTot;
	protected double precioTot;
	protected String productos;
	protected Date fecha_compra;
	protected String comprador;
	protected String direccion;
	protected int telefono;
	

	//----------------------\\
	public FacturaClass() {
		super();
	}

	/**
	 * @param id
	 * @param cantidadTot
	 * @param precioTot
	 * @param productos
	 * @param fecha_compra
	 * @param comprador
	 * @param direccion
	 * @param telefono
	 */
	public FacturaClass(int id, int cantidadTot, double precioTot, String productos, Date fecha_compra,
			String comprador, String direccion, int telefono) {
		super();
		this.id = id;
		this.cantidadTot = cantidadTot;
		this.precioTot = precioTot;
		this.productos = productos;
		this.fecha_compra = fecha_compra;
		this.comprador = comprador;
		this.direccion = direccion;
		this.telefono = telefono;
	}



	
	
	//----------------------\\
	
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the telefono
	 */
	public int getCantidadTot() {
		return cantidadTot;
	}
	/**
	 * @param cantidadTot the cantidadTot to set
	 */
	public void setCantidadTot(int cantidadTot) {
		this.cantidadTot = cantidadTot;
	}
	/**
	 * @return the precioTot
	 */
	public double getPrecioTot() {
		return precioTot;
	}
	/**
	 * @param precioTot the precioTot to set
	 */
	public void setPrecioTot(double precioTot) {
		this.precioTot = precioTot;
	}
	/**
	 * @return the productos
	 */
	public String getProductos() {
		return productos;
	}
	/**
	 * @param productos the productos to set
	 */
	public void setProductos(String productos) {
		this.productos = productos;
	}
	/**
	 * @return the fecha_compra
	 */
	public Date getFecha_compra() {
		return fecha_compra;
	}
	/**
	 * @param fecha_compra the fecha_compra to set
	 */
	public void setFecha_compra(Date fecha_compra) {
		this.fecha_compra = fecha_compra;
	}
	/**
	 * @return the comprador
	 */
	public String getComprador() {
		return comprador;
	}
	/**
	 * @param comprador the comprador to set
	 */
	
	public void setComprador(String comprador) {
		this.comprador = comprador;
	}
	
	/**
	 * @return the direccion
	 */
	
	public String getDireccion() {
		return direccion;
	}

	/**
	 * @param direccion the direccion to set
	 */
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	/**
	 * @return the telefono
	 */
	public int getTelefono() {
		return telefono;
	}

	/**
	 * @param telefono the telefono to set
	 */
	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}


	
}
