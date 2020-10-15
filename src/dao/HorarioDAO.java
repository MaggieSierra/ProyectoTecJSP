package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import controlador.Conexion;
import modelo.Horario;

public class HorarioDAO {
	
	public static int save(Horario h) {
		int status = 0;
		try {
			Connection con = Conexion.getConnection();
			String sql = "insert into horarios(id_usuario, id_materia, id_carrera, clave_horario, periodo, grupo, num_alumnos, aula, lunes,"
					+ "martes, miercoles, jueves, viernes) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,h.getId_usuario());
			ps.setInt(2, h.getId_materia());
			ps.setInt(3, h.getId_carrera());
			ps.setString(4, h.getClave_horario());
			ps.setString(5, h.getPeriodo());
			ps.setString(6,h.getGrupo());
			ps.setInt(7,h.getNum_alumnos());
			ps.setString(8,h.getAula());
			ps.setString(9, h.getLunes());
			ps.setString(10,h.getMartes());
			ps.setString(11,h.getMiercoles());
			ps.setString(12,h.getJueves());
			ps.setString(13,h.getViernes());

			status = ps.executeUpdate();
			
			int hrs = 0, creditos = 0;
			sql = "select creditos from materias where id_materia = ?";
			PreparedStatement ps2 = con.prepareStatement(sql);
			ps2.setInt(1, h.getId_materia());
			ResultSet rs = ps2.executeQuery();
			if (rs.next()) {
				creditos = rs.getInt(1);
			}
			
			sql = "select hrs_trabajo from usuarios where id_usuario = ?";
			ps2 = con.prepareStatement(sql);
			ps2.setInt(1, h.getId_usuario());
			rs = ps2.executeQuery();
			if (rs.next()) {
				hrs += rs.getInt(1);
			}
			
			hrs = hrs + creditos;
			
			//actualizar horas asignadas
			sql = "update usuarios set hrs_trabajo = ? where id_usuario = ?";
			ps2 = con.prepareStatement(sql);
			ps2.setInt(1,hrs);
			ps2.setInt(2,h.getId_usuario());
			ps2.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}
	
	public static int update(Horario h) {
		int status = 0;
		try {
			Connection con = Conexion.getConnection();
			//actualizar  hrs de trabajo asignadas
			int hrs = 0, nuevas_hrs = 0, creditosM = 0, creditos=0, id_user=0;
			String sql = "select materias.creditos from horarios inner join materias on "
					+ "horarios.id_materia = materias.id_materia where id_horario = ?";
			PreparedStatement ps2 = con.prepareStatement(sql);
			ps2.setInt(1, h.getId_horario());
			ResultSet rs = ps2.executeQuery();
			if (rs.next()) {
				creditosM = rs.getInt(1);
			}
			
			sql = "select usuarios.id_usuario, usuarios.hrs_trabajo from horarios inner join usuarios on horarios.id_usuario = usuarios.id_usuario"
					+ " where id_horario = ?";
			ps2 = con.prepareStatement(sql);
			ps2.setInt(1, h.getId_horario());
			rs = ps2.executeQuery();
			if (rs.next()) {
				id_user = rs.getInt(1);
				hrs = rs.getInt(2);
			}
			
			if(hrs != 0) {
				hrs = hrs - creditosM;
				sql = "update usuarios set hrs_trabajo = ? where id_usuario = ?";
				ps2 = con.prepareStatement(sql);
				ps2.setInt(1,hrs);
				ps2.setInt(2,id_user);
				ps2.executeUpdate();
			}
			
			sql = "update horarios set id_usuario = ?, id_materia = ?, id_carrera = ?, clave_horario = ?, periodo = ?, "
					+ "grupo = ?, num_alumnos = ?, aula = ?, lunes = ?, martes = ?, miercoles = ?, jueves = ?, viernes = ?"
					+ " where id_horario = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,h.getId_usuario());
			ps.setInt(2, h.getId_materia());
			ps.setInt(3, h.getId_carrera());
			ps.setString(4, h.getClave_horario());
			ps.setString(5, h.getPeriodo());
			ps.setString(6,h.getGrupo());
			ps.setInt(7,h.getNum_alumnos());
			ps.setString(8,h.getAula());
			ps.setString(9, h.getLunes());
			ps.setString(10,h.getMartes());
			ps.setString(11,h.getMiercoles());
			ps.setString(12,h.getJueves());
			ps.setString(13,h.getViernes());
			ps.setInt(14,h.getId_horario());

			status = ps.executeUpdate();
			
			sql = "select creditos from materias where id_materia = ?";
			ps2 = con.prepareStatement(sql);
			ps2.setInt(1, h.getId_materia());
			rs = ps2.executeQuery();
			if (rs.next()) {
				creditos = rs.getInt(1);
			}
			
			sql = "select hrs_trabajo from usuarios where id_usuario = ?";
			ps2 = con.prepareStatement(sql);
			ps2.setInt(1, h.getId_usuario());
			rs = ps2.executeQuery();
			if (rs.next()) {
				nuevas_hrs = rs.getInt(1);
			}
			
			nuevas_hrs = nuevas_hrs + creditos;
			
			//actualizar horas asignadas
			sql = "update usuarios set hrs_trabajo = ? where id_usuario = ?";
			ps2 = con.prepareStatement(sql);
			ps2.setInt(1,nuevas_hrs);
			ps2.setInt(2,h.getId_usuario());
			ps2.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}
	
	public static int delete(int id) {
		int status = 0;
		try {
			Connection con = Conexion.getConnection();
			//actualizar horas asignadas
			int hrs = 0, creditos = 0, id_user= 0;
			String sql = "select materias.creditos from horarios inner join materias on "
					+ "horarios.id_materia = materias.id_materia where id_horario = ?";
			PreparedStatement ps2 = con.prepareStatement(sql);
			ps2.setInt(1, id);
			ps2.executeQuery();
			ResultSet rs = ps2.executeQuery();
			if (rs.next()) {
				creditos = rs.getInt(1);
			}
			
			sql = "select usuarios.id_usuario, usuarios.hrs_trabajo from horarios inner join usuarios on horarios.id_usuario = usuarios.id_usuario"
					+ " where id_horario = ?";
			ps2 = con.prepareStatement(sql);
			ps2.setInt(1, id);
			rs = ps2.executeQuery();
			if (rs.next()) {
				id_user = rs.getInt(1);
				hrs += rs.getInt(2);
			}
			
			if(hrs != 0) {
				hrs = hrs - creditos;
			}else {
				hrs = creditos;
			}
			
			sql = "update usuarios set hrs_trabajo = ? where id_usuario = ?";
			ps2 = con.prepareStatement(sql);
			ps2.setInt(1,hrs);
			ps2.setInt(2,id_user);
			ps2.executeUpdate();
			
			//eliminar registro
			PreparedStatement ps = con.prepareStatement("delete from horarios where id_horario = ?");
			ps.setInt(1, id);
			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}
	
	public static Horario getHorarioById(int id) {
		Horario h = new Horario();
		try {
			Connection con = Conexion.getConnection();
			String sql = "SELECT horarios.*, usuarios.nombre, usuarios.prefijo, usuarios.primer_apellido, usuarios.segundo_apellido,"
					+ " materias.clave_materia,materias.nombre, materias.semestre, materias.hrs_teoria, materias.hrs_practica, materias.creditos,"
					+ "carreras.clave_carrera,carreras.nombre, carreras.turno FROM horarios JOIN usuarios ON usuarios.id_usuario = horarios.id_usuario "
					+ "JOIN materias ON materias.id_materia = horarios.id_materia JOIN carreras ON carreras.id_carrera = horarios.id_carrera "
					+ "WHERE horarios.id_horario = ? ORDER BY clave_horario;";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				h.setId_horario(rs.getInt(1));
				h.setId_usuario(rs.getInt(2));
				h.setId_materia(rs.getInt(3));
				h.setId_carrera(rs.getInt(4));
				h.setClave_horario(rs.getString(5));
				h.setPeriodo(rs.getString(6));
				h.setGrupo(rs.getString(7));
				h.setNum_alumnos(rs.getInt(8));
				h.setAula(rs.getString(9));
				h.setLunes(rs.getString(10));
				h.setMartes(rs.getString(11));
				h.setMiercoles(rs.getString(12));
				h.setJueves(rs.getString(13));
				h.setViernes(rs.getString(14));
				h.setNombre_usuario(rs.getString(15));
				h.setPrefijo(rs.getString(16));
				h.setPrimer_apellido(rs.getString(17));
				
				if(rs.getString(17) == null) {
					h.setSegundo_apellido("");
				}else {
					h.setSegundo_apellido(rs.getString(18));
				}
				
				h.setClave_materia(rs.getString(19));
				h.setNombre_materia(rs.getString(20));
				h.setSemestre(rs.getInt(21));
				h.setHrs_t(rs.getInt(22));
				h.setHrs_p(rs.getInt(23));
				h.setCreditos(rs.getInt(24));
				h.setClave_carrera(rs.getString(25));
				h.setNombre_carrera(rs.getString(26));
				h.setTurno(rs.getString(27));
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return h;
	}
	
	public static List<Horario> getHorarioByIdUser(int id) {
		List<Horario> list = new ArrayList<Horario>();
		try {
			Connection con = Conexion.getConnection();
			String sql = "SELECT horarios.*, usuarios.nombre, usuarios.prefijo, usuarios.primer_apellido, usuarios.segundo_apellido,"
					+ " materias.clave_materia,materias.nombre, materias.semestre, materias.hrs_teoria, materias.hrs_practica, materias.creditos,"
					+ "carreras.clave_carrera,carreras.nombre, carreras.turno FROM horarios JOIN usuarios ON usuarios.id_usuario = horarios.id_usuario "
					+ "JOIN materias ON materias.id_materia = horarios.id_materia JOIN carreras ON carreras.id_carrera = horarios.id_carrera "
					+ "WHERE horarios.id_usuario = ? ORDER BY clave_horario;";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Horario h = new Horario();
				h.setId_horario(rs.getInt(1));
				h.setId_usuario(rs.getInt(2));
				h.setId_materia(rs.getInt(3));
				h.setId_carrera(rs.getInt(4));
				h.setClave_horario(rs.getString(5));
				h.setPeriodo(rs.getString(6));
				h.setGrupo(rs.getString(7));
				h.setNum_alumnos(rs.getInt(8));
				h.setAula(rs.getString(9));
				h.setLunes(rs.getString(10));
				h.setMartes(rs.getString(11));
				h.setMiercoles(rs.getString(12));
				h.setJueves(rs.getString(13));
				h.setViernes(rs.getString(14));
				h.setNombre_usuario(rs.getString(15));
				h.setPrefijo(rs.getString(16));
				h.setPrimer_apellido(rs.getString(17));
				
				if(rs.getString(17) == null) {
					h.setSegundo_apellido("");
				}else {
					h.setSegundo_apellido(rs.getString(18));
				}
				
				h.setClave_materia(rs.getString(19));
				h.setNombre_materia(rs.getString(20));
				h.setSemestre(rs.getInt(21));
				h.setHrs_t(rs.getInt(22));
				h.setHrs_p(rs.getInt(23));
				h.setCreditos(rs.getInt(24));
				h.setClave_carrera(rs.getString(25));
				h.setNombre_carrera(rs.getString(26));
				h.setTurno(rs.getString(27));
		
				list.add(h);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public static List<Horario> getAllHorarios() {
		
		List<Horario> list = new ArrayList<Horario>();
		try {
			Connection con = Conexion.getConnection();
			String sql = "SELECT horarios.*, usuarios.nombre, usuarios.prefijo, usuarios.primer_apellido, usuarios.segundo_apellido,"
					+ " materias.clave_materia,materias.nombre, materias.semestre, materias.hrs_teoria, materias.hrs_practica, materias.creditos,"
					+ "carreras.clave_carrera,carreras.nombre, carreras.turno FROM horarios JOIN usuarios ON usuarios.id_usuario = horarios.id_usuario "
					+ "JOIN materias ON materias.id_materia = horarios.id_materia JOIN carreras ON carreras.id_carrera = horarios.id_carrera "
					+ "ORDER BY clave_horario;";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Horario h = new Horario();
				h.setId_horario(rs.getInt(1));
				h.setId_usuario(rs.getInt(2));
				h.setId_materia(rs.getInt(3));
				h.setId_carrera(rs.getInt(4));
				h.setClave_horario(rs.getString(5));
				h.setPeriodo(rs.getString(6));
				h.setGrupo(rs.getString(7));
				h.setNum_alumnos(rs.getInt(8));
				h.setAula(rs.getString(9));
				h.setLunes(rs.getString(10));
				h.setMartes(rs.getString(11));
				h.setMiercoles(rs.getString(12));
				h.setJueves(rs.getString(13));
				h.setViernes(rs.getString(14));
				h.setNombre_usuario(rs.getString(15));
				h.setPrefijo(rs.getString(16));
				h.setPrimer_apellido(rs.getString(17));
				
				if(rs.getString(17) == null) {
					h.setSegundo_apellido("");
				}else {
					h.setSegundo_apellido(rs.getString(18));
				}
				
				h.setClave_materia(rs.getString(19));
				h.setNombre_materia(rs.getString(20));
				h.setSemestre(rs.getInt(21));
				h.setHrs_t(rs.getInt(22));
				h.setHrs_p(rs.getInt(23));
				h.setCreditos(rs.getInt(24));
				h.setClave_carrera(rs.getString(25));
				h.setNombre_carrera(rs.getString(26));
				h.setTurno(rs.getString(27));
		
				list.add(h);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public static List<Horario> searchHorario(String texto) {
		List<Horario> list = new ArrayList<Horario>();
		
		try {
			Connection con = Conexion.getConnection();
			String sql = "SELECT horarios.*, usuarios.nombre, usuarios.prefijo, usuarios.primer_apellido, usuarios.segundo_apellido,"
					+ " materias.clave_materia,materias.nombre, materias.semestre, materias.hrs_teoria, materias.hrs_practica, materias.creditos,"
					+ "carreras.clave_carrera,carreras.nombre, carreras.turno FROM horarios JOIN usuarios ON usuarios.id_usuario = horarios.id_usuario "
					+ "JOIN materias ON materias.id_materia = horarios.id_materia JOIN carreras ON carreras.id_carrera = horarios.id_carrera "
					+ "WHERE horarios.clave_horario like ? OR materias.clave_materia like ? OR materias.nombre = ? OR usuarios.nombre like ? ORDER BY clave_horario;";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%"+texto+"%");
			ps.setString(2, "%"+texto+"%");
			ps.setString(3, "%"+texto+"%");
			ps.setString(4, "%"+texto+"%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Horario h = new Horario();
				h.setId_horario(rs.getInt(1));
				h.setId_usuario(rs.getInt(2));
				h.setId_materia(rs.getInt(3));
				h.setId_carrera(rs.getInt(4));
				h.setClave_horario(rs.getString(5));
				h.setPeriodo(rs.getString(6));
				h.setGrupo(rs.getString(7));
				h.setNum_alumnos(rs.getInt(8));
				h.setAula(rs.getString(9));
				h.setLunes(rs.getString(10));
				h.setMartes(rs.getString(11));
				h.setMiercoles(rs.getString(12));
				h.setJueves(rs.getString(13));
				h.setViernes(rs.getString(14));
				h.setNombre_usuario(rs.getString(15));
				h.setPrefijo(rs.getString(16));
				h.setPrimer_apellido(rs.getString(17));
				
				if(rs.getString(17) == null) {
					h.setSegundo_apellido("");
				}else {
					h.setSegundo_apellido(rs.getString(18));
				}
				
				h.setClave_materia(rs.getString(19));
				h.setNombre_materia(rs.getString(20));
				h.setSemestre(rs.getInt(21));
				h.setHrs_t(rs.getInt(22));
				h.setHrs_p(rs.getInt(23));
				h.setCreditos(rs.getInt(24));
				h.setClave_carrera(rs.getString(25));
				h.setNombre_carrera(rs.getString(26));
				h.setTurno(rs.getString(27));
		
				list.add(h);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
}
