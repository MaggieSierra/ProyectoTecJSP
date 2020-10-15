package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import controlador.Conexion;
import modelo.Usuario;

public class LoginDAO {
	
	public static boolean validar(String user, String pass) {
		
		boolean status = false;
		String sql = "select * from usuario where usuario=? and contrasena=?";
		
		try {
			Connection con = Conexion.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();
			status = rs.next();
			
			con.close(); 
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static Usuario rolUsuario(String user_name, String pass) {
		Usuario user = new Usuario();
		String sql = "select id_rol, prefijo, nombre, primer_apellido, segundo_apellido from usuario where usuario=? and contraseña=?";		
		
		try {
			Connection con = Conexion.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user_name);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				user.setPrefijo(rs.getString(1));
				user.setNombre(rs.getString(2));
				user.setPrimer_apellido(rs.getString(3));
				user.setSegundo_apellido(rs.getString(4));
				user.setId_rol(rs.getInt(5));
			}
			
			con.close(); 
		} catch (Exception e) {
			System.out.println(e);
		}
		return user;
	}

}