package modelo;

public class Usuario {
	private int id_usuario;
	private int id_rol;
	private String clave_usuario;
	private String prefijo;
	private String nombre;
	private String primer_apellido;
	private String segundo_apellido;
	private String usuario;
	private String contraseña;
	private int hrs_trabajo;
	
	public int getId_usuario() {
		return id_usuario;
	}
	
	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}
	
	public int getId_rol() {
		return id_rol;
	}
	
	public void setId_rol(int id_rol) {
		this.id_rol = id_rol;
	}
	
	public String getClave_usuario() {
		return clave_usuario;
	}
	
	public void setClave_usuario(String clave_usuario) {
		this.clave_usuario = clave_usuario;
	}
	
	public String getPrefijo() {
		return prefijo;
	}
	
	public void setPrefijo(String prefijo) {
		this.prefijo = prefijo;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getPrimer_apellido() {
		return primer_apellido;
	}
	
	public void setPrimer_apellido(String primer_apellido) {
		this.primer_apellido = primer_apellido;
	}
	
	public String getSegundo_apellido() {
		return segundo_apellido;
	}
	
	public void setSegundo_apellido(String segundo_apellido) {
		this.segundo_apellido = segundo_apellido;
	}
	
	public String getUsuario() {
		return usuario;
	}
	
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	
	public String getContraseña() {
		return contraseña;
	}
	
	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}
	
	public int getHrs_trabajo() {
		return hrs_trabajo;
	}
	
	public void setHrs_trabajo(int hrs_trabajo) {
		this.hrs_trabajo = hrs_trabajo;
	}
	
}
