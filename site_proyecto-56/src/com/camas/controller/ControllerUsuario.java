package com.camas.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import com.camas.dao.DaoUsuario;
import com.camas.model.Usuario;

public class ControllerUsuario {

	public void enviaDatoUsuario(int perfil,String nombres, String apellidos, String nombre_usuario, String contraseña)
			throws SQLException {

		DaoUsuario daoAlumno = new DaoUsuario();
		daoAlumno.envioUser(perfil,nombres, apellidos, nombre_usuario, contraseña);
	}

	public ArrayList<Usuario> ImprimirUsuarios() throws SQLException {
		DaoUsuario daousuario;
		daousuario = new DaoUsuario();
		return daousuario.totalUsuarios();
	}
}
