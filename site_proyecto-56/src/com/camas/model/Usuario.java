/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.camas.model;

/**
 *
 * @author luisfer
 */
public class Usuario{

	private int id;
	private int perfil;
    private String nombres;
    private String apellidos;
    private String nombre_usuario;
    private String contrase�a;
    
    public Usuario(){
  
    }
    public Usuario(int id,int perfil,String nombres, String apellidos,String nombre_usuario,String contrase�a) {
    	this.id=id;
    	this.perfil=perfil;
    	this.nombres = nombres;
        this.apellidos = apellidos;
        this.nombre_usuario=nombre_usuario;
        this.contrase�a=contrase�a;
    }
    public Usuario(int perfil,String nombres, String apellidos,String nombre_usuario,String contrase�a) {
    	this.perfil=perfil;
    	this.nombres = nombres;
        this.apellidos = apellidos;
        this.nombre_usuario=nombre_usuario;
        this.contrase�a=contrase�a;
    }

    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getContrase�a() {
		return contrase�a;
	}

	public void setContrase�a(String contrase�a) {
		this.contrase�a = contrase�a;
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

	public int getPerfil() {
		return perfil;
	}

	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}
   
    
}
