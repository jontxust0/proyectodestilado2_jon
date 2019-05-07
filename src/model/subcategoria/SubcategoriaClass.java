package model.subcategoria;

import model.Connect;

public class SubcategoriaClass extends Connect{

	protected int id;
	protected String nombre;
	protected int id_categoria;

	//----------------------\\
		public SubcategoriaClass() {
		super();
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

		public int getId_categoria() {
			return id_categoria;
		}

		public void setId_categoria(int id_categoria) {
			this.id_categoria = id_categoria;
		}
		
}
