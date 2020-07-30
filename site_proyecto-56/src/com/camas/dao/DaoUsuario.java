package com.camas.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.camas.model.Cls_conexion;
import com.camas.model.Usuario;

public class DaoUsuario {
	ResultSet re;
	public ArrayList<Usuario> totalUsuarios() throws SQLException {
		ArrayList<Usuario> usuarios = new ArrayList<>();

		
		Cls_conexion cl = new Cls_conexion();
		re = cl.consulta("select * from usuario");
		Integer id;
		Integer perfil;
		String nombres;
		String apellidos;
		String nombre_usuario;
		String contrase�a;
		while (re.next()) {
			id = re.getInt("id_usuario");
			perfil = re.getInt("id_perfil");
			nombres = re.getString("nombres");
			apellidos = re.getString("apellidos");
			nombre_usuario = re.getString("usuario");
			contrase�a = re.getString("contrase�a");
			usuarios.add(new Usuario(id,perfil,nombres, apellidos, nombre_usuario,contrase�a));
			
		}
		return usuarios;
		
	}

	public ArrayList<Usuario> envioUser(int perfil,String nombres, String apellidos, String nombre_usuario, String contrase�a)
			throws SQLException {
		Usuario usuario = new Usuario(perfil,nombres, apellidos, nombre_usuario, contrase�a);
		usuario.setNombres(nombres);
		usuario.setApellidos(apellidos);
		usuario.setNombre_usuario(nombre_usuario);
		usuario.setContrase�a(contrase�a);

		Cls_conexion cl = new Cls_conexion();
		cl.ejecutar("insert into usuario values ("+perfil+",'" + nombres + "','" + apellidos + "','" + nombre_usuario
				+ "',�" + contrase�a + "');");
		
		return this.totalUsuarios();
		
	}
}
