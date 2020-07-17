package com.camas.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import com.camas.dao.DaoUsuario;
import com.camas.model.Usuario;

public class ControllerUsuario {

	public void enviaDatoUsuario(int perfil,String nombres, String apellidos, String nombre_usuario, String contrase�a)
			throws SQLException {

		DaoUsuario daoAlumno = new DaoUsuario();
		daoAlumno.envioUser(perfil,nombres, apellidos, nombre_usuario, contrase�a);
	}

	public ArrayList<Usuario> ImprimirUsuarios() throws SQLException {
		DaoUsuario daousuario;
		daousuario = new DaoUsuario();
		return daousuario.totalUsuarios();
	}
}
