package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import controlador.Conexion;
import modelo.Carrera;

public class CarreraDAO {
	
	public static List<Carrera> getAllCarreras() {
		List<Carrera> list = new ArrayList<Carrera>();

		try {
			Connection con = Conexion.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from carreras");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Carrera c = new Carrera();
				c.setId_carrera(rs.getInt(1));
				c.setClave_carrera(rs.getString(2));
				c.setNombre(rs.getString(3));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
