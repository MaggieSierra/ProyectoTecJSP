package modelo;

public class Carrera {
	private int id_carrera;
	private String clave_carrera;
	private String nombre;
	
	public int getId_carrera() {
		return id_carrera;
	}
	
	public void setId_carrera(int id_carrera) {
		this.id_carrera = id_carrera;
	}
	
	public String getClave_carrera() {
		return clave_carrera;
	}
	
	public void setClave_carrera(String clave_carrera) {
		this.clave_carrera = clave_carrera;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
}
