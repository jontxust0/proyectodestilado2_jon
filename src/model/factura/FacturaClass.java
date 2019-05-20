package model.factura;

import java.util.Date;

import model.Connect;

public class FacturaClass extends Connect{

	protected int id;
	protected Date fecha_compra;
	protected String comprador;
	protected String direccion;
	protected String telefono;
	protected String dni;
	

	//----------------------\\
	public FacturaClass() {
		super();
	}

	/**
	 * @param id
	 * @param fecha_compra
	 * @param comprador
	 * @param direccion
	 * @param telefono
	 * @param dni
	 */
	public FacturaClass(int id, int cantidadTot, double precioTot, String productos, Date fecha_compra,
			String comprador, String direccion, String telefono) {
		super();
		this.id = id;
		this.fecha_compra = fecha_compra;
		this.comprador = comprador;
		this.direccion = direccion;
		this.telefono = telefono;
		this.dni = dni;
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
	public String getTelefono() {
		return telefono;
	}

	/**
	 * @param telefono the telefono to set
	 */
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	/**
	 * @return the dni
	 */
	public String getDni() {
		return dni;
	}

	/**
	 * @param dni the dni to set
	 */
	public void setDni(String dni) {
		this.dni = dni;
	}


	
}
