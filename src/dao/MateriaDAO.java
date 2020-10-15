package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import modelo.Materia;
import controlador.Conexion;

public class MateriaDAO {
	
	public static int save(Materia m) {
		int status = 0;
		try {
			Connection con = Conexion.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into materias(clave_materia,nombre,semestre,hrs_teoria,hrs_practica,creditos) values (?,?,?,?,?,?)");
			ps.setString(1, m.getClave_materia());
			ps.setString(2, m.getNombre());
			ps.setInt(3, m.getSemestre());
			ps.setInt(4, m.getHrs_teoria());
			ps.setInt(5, m.getHrs_practica());
			ps.setInt(6, m.getCreditos());

			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}
	
	public static int update(Materia m) {
		int status = 0;
		try {
			Connection con = Conexion.getConnection();
			PreparedStatement ps = con.prepareStatement("update materias set clave_materia = ?, nombre = ?, semestre = ?, hrs_teoria = ?, hrs_practica = ?, creditos = ? where id_materia = ?");
			ps.setString(1, m.getClave_materia());
			ps.setString(2, m.getNombre());
			ps.setInt(3, m.getSemestre());
			ps.setInt(4, m.getHrs_teoria());
			ps.setInt(5, m.getHrs_practica());
			ps.setInt(6, m.getCreditos());
			ps.setInt(7, m.getId_materia());

			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static int delete(int id) {
		int status = 0;
		try {
			Connection con = Conexion.getConnection();
			PreparedStatement ps = con.prepareStatement("delete from materias where id_materia = ?");
			ps.setInt(1, id);
			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}
	
	public static Materia getMateriaById(int id) {
		Materia m = new Materia();

		try {
			Connection con = Conexion.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from materias where id_materia = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				m.setId_materia(rs.getInt(1));
				m.setClave_materia(rs.getString(2));
				m.setNombre(rs.getString(3));
				m.setSemestre(rs.getInt(4));
				m.setHrs_teoria(rs.getInt(5));
				m.setHrs_practica(rs.getInt(6));
				m.setCreditos(rs.getInt(7));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return m;
	}

	public static List<Materia> getAllMaterias() {
		List<Materia> list = new ArrayList<Materia>();

		try {
			Connection con = Conexion.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from materias");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Materia m = new Materia();
				m.setId_materia(rs.getInt(1));
				m.setClave_materia(rs.getString(2));
				m.setNombre(rs.getString(3));
				m.setSemestre(rs.getInt(4));
				m.setHrs_teoria(rs.getInt(5));
				m.setHrs_practica(rs.getInt(6));
				m.setCreditos(rs.getInt(7));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public static List<Materia> searchMateria(String texto) {
		List<Materia> list = new ArrayList<Materia>();
		
		try {
			Connection con = Conexion.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from materias where clave_materia like ? or nombre like ? ");
			ps.setString(1, "%"+texto+"%");
			ps.setString(2, "%"+texto+"%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Materia m = new Materia();
				m.setId_materia(rs.getInt(1));
				m.setClave_materia(rs.getString(2));
				m.setNombre(rs.getString(3));
				m.setSemestre(rs.getInt(4));
				m.setHrs_teoria(rs.getInt(5));
				m.setHrs_practica(rs.getInt(6));
				m.setCreditos(rs.getInt(7));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
