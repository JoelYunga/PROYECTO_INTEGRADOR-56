package com.camas.bean;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import com.camas.controller.ControllerUsuario;
import com.camas.model.Usuario;

@Named(value = "UsuarioBean")
@SessionScoped
public class UsuarioBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int perfil;
	private String nombres;
	private String apellidos;
	private String nombre_usuario;
	private String contraseña;

	private Usuario usuario = new Usuario();

	public UsuarioBean() {

	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPerfil() {
		return perfil;
	}

	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getNombre_usuario() {
		return nombre_usuario;
	}

	public void setNombre_usuario(String nombre_usuario) {
		this.nombre_usuario = nombre_usuario;
	}
	
	public String getContraseña() {
		return contraseña;
	}


	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}


	public ArrayList<Usuario> listaUsuario() throws SQLException {
		ControllerUsuario controller = new ControllerUsuario();
		return controller.ImprimirUsuarios();
	}

	public void almaceneDatosUsuario() throws SQLException {
		int perfil = 1;
		ControllerUsuario controller = new ControllerUsuario();
		
		controller.enviaDatoUsuario(perfil,nombres, apellidos, nombre_usuario, contraseña);
	}

}
