package modelo;

public class Horario {
	private int id_horario;
	private int id_usuario;
	private int id_materia;
	private int id_carrera;
	private String clave_horario;
	private String clave_materia;
	private String clave_carrera;
	private String nombre_materia;
	private String nombre_carrera;
	private String nombre_usuario;
	private String primer_apellido;
	private String segundo_apellido;
	private String periodo;
	private String turno;
	private String grupo;
	private int num_alumnos;
	private int semestre;
	private int hrs_t, hrs_p, hrs_asignadas;
	private int creditos;
	private String lunes;
	private String martes;
	private String miercoles;
	private String jueves;
	private String viernes;
	private String aula;
	private String prefijo;
	
	public int getId_horario() {
		return id_horario;
	}
	
	public void setId_horario(int id_horario) {
		this.id_horario = id_horario;
	}
	
	public int getId_usuario() {
		return id_usuario;
	}
	
	public void setId_usuario(int id_usurio) {
		this.id_usuario = id_usurio;
	}
	
	public int getId_materia() {
		return id_materia;
	}
	
	public void setId_materia(int id_materia) {
		this.id_materia = id_materia;
	}
	
	public int getId_carrera() {
		return id_carrera;
	}
	
	public void setId_carrera(int id_carrera) {
		this.id_carrera = id_carrera;
	}
	
	public String getClave_horario() {
		return clave_horario;
	}
	
	public void setClave_horario(String clave_horario) {
		this.clave_horario = clave_horario;
	}
	
	public String getClave_materia() {
		return clave_materia;
	}
	
	public void setClave_materia(String clave_materia) {
		this.clave_materia = clave_materia;
	}
	
	public String getClave_carrera() {
		return clave_carrera;
	}
	
	public void setClave_carrera(String clave_carrera) {
		this.clave_carrera = clave_carrera;
	}
	
	public String getNombre_materia() {
		return nombre_materia;
	}
	
	public void setNombre_materia(String nombre_materia) {
		this.nombre_materia = nombre_materia;
	}
	
	public int getHrs_t() {
		return hrs_t;
	}

	public void setHrs_t(int hrs_t) {
		this.hrs_t = hrs_t;
	}

	public int getHrs_p() {
		return hrs_p;
	}

	public void setHrs_p(int hrs_p) {
		this.hrs_p = hrs_p;
	}

	public String getNombre_carrera() {
		return nombre_carrera;
	}
	
	public void setNombre_carrera(String nombre_carrera) {
		this.nombre_carrera = nombre_carrera;
	}
	
	public String getNombre_usuario() {
		return nombre_usuario;
	}
	
	public void setNombre_usuario(String nombre_usuario) {
		this.nombre_usuario = nombre_usuario;
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

	public String getPeriodo() {
		return periodo;
	}
	
	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}
	
	public String getTurno() {
		return turno;
	}
	
	public void setTurno(String turno) {
		this.turno = turno;
	}
	
	public String getGrupo() {
		return grupo;
	}
	
	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}
	
	public int getNum_alumnos() {
		return num_alumnos;
	}
	
	public void setNum_alumnos(int num_alumnos) {
		this.num_alumnos = num_alumnos;
	}
	
	public int getSemestre() {
		return semestre;
	}
	
	public void setSemestre(int semestre) {
		this.semestre = semestre;
	}
	
	public int getCreditos() {
		return creditos;
	}
	
	public void setCreditos(int creditos) {
		this.creditos = creditos;
	}
	
	public String getLunes() {
		return lunes;
	}
	
	public void setLunes(String lunes) {
		this.lunes = lunes;
	}
	
	public String getMartes() {
		return martes;
	}
	
	public void setMartes(String martes) {
		this.martes = martes;
	}
	
	public String getMiercoles() {
		return miercoles;
	}
	
	public void setMiercoles(String miercoles) {
		this.miercoles = miercoles;
	}
	
	public String getJueves() {
		return jueves;
	}
	
	public void setJueves(String jueves) {
		this.jueves = jueves;
	}
	
	public String getViernes() {
		return viernes;
	}
	
	public void setViernes(String viernes) {
		this.viernes = viernes;
	}
	
	public String getAula() {
		return aula;
	}
	
	public void setAula(String aula) {
		this.aula = aula;
	}

	public String getPrefijo() {
		return prefijo;
	}

	public void setPrefijo(String prefijo) {
		this.prefijo = prefijo;
	}

	public int getHrs_asignadas() {
		return hrs_asignadas;
	}

	public void setHrs_asignadas(int hrs_asignadas) {
		this.hrs_asignadas = hrs_asignadas;
	}

	
}
