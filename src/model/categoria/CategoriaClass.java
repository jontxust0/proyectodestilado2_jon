package model.categoria;

import model.Connect;
import model.subcategoria.SubcategoriaClass;

public class CategoriaClass extends Connect{

	protected int id;
	protected String nombre;
	
	//----------------------\\
	public CategoriaClass() {
		super();
	}
	

	public CategoriaClass(int id, String nombre) {
		super();
		this.id = id;
		this.nombre = nombre;
	}


	//----------------------\\
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
	
}
