package modelo;

public class Materia {
	private int id_materia;
	private String clave_materia;
	private String nombre;
	private int semestre;
	private int hrs_teoria;
	private int hrs_practica;
	private int creditos;
	
	public int getId_materia() {
		return id_materia;
	}
	
	public void setId_materia(int id_materia) {
		this.id_materia = id_materia;
	}
	
	public String getClave_materia() {
		return clave_materia;
	}
	
	public void setClave_materia(String clave_materia) {
		this.clave_materia = clave_materia;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public int getSemestre() {
		return semestre;
	}
	
	public void setSemestre(int semestre) {
		this.semestre = semestre;
	}
	
	public int getHrs_teoria() {
		return hrs_teoria;
	}
	
	public void setHrs_teoria(int hrs_teoria) {
		this.hrs_teoria = hrs_teoria;
	}
	
	public int getHrs_practica() {
		return hrs_practica;
	}
	
	public void setHrs_practica(int hrs_practica) {
		this.hrs_practica = hrs_practica;
	}
	
	public int getCreditos() {
		return creditos;
	}
	
	public void setCreditos(int creditos) {
		this.creditos = creditos;
	}
	
	
}
