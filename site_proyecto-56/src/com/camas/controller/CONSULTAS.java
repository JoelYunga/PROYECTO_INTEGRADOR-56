package com.camas.controller;

import java.sql.ResultSet;

import com.camas.conexion.QUERY;
import com.camas.conexion.UPDATE;


public class CONSULTAS {
	private QUERY query;
	private UPDATE modificar;
	private ResultSet resultados = null;

	public CONSULTAS() {
		// TODO Auto-generated constructor stub
		query = new QUERY();
		modificar = new UPDATE();
	}

	public String etnias() {
		String resultado = "<SELECT name=\"cmbejes\" class=\"content-select\" id=\"cmbetnia\"\r\n"
				+ "				onchange='etnia()'>\r\n"
				+ "				<OPTION VALUE=\"0\">Seleccione una Etnia</OPTION>";
		try {
			resultados = query.consulta("select dim_etnia.pk_etnia,dim_etnia.nombre_etnia from dim_etnia");
			while (resultados.next()) {
				resultado += "<OPTION VALUE=" + resultados.getInt("pk_etnia") + ">"
						+ resultados.getString("nombre_etnia") + "</OPTION>";
			}
			resultado += "</SELECT>";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultado;
	}

	public String provincias() {
		String resultado = "<SELECT name=\"cmbejes\" class=\"content-select\" id=\"cmbgeo\"\r\n"
				+ "				onchange='geo()'>\r\n"
				+ "				<OPTION VALUE=\"0\">Seleccione una Provincia</OPTION>";
		try {
			resultados = query.consulta("select pk_provincia,nombre_provincia from dim_geografia\r\n"
					+ "group by pk_provincia,nombre_provincia\r\n" + "order by pk_provincia");
			while (resultados.next()) {
				resultado += "<OPTION VALUE=" + resultados.getInt("pk_provincia") + ">"
						+ resultados.getString("nombre_provincia") + "</OPTION>";
			}
			resultado += "</SELECT>";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultado;
	}

	public String causas() {
		String resultado = "<SELECT name=\"cmbejes\" class=\"content-select\" id=\"cmbcausas\"\r\n"
				+ "				onchange='causas()'>\r\n"
				+ "				<OPTION VALUE=\"0\">Seleccione una Causa de Divorcio</OPTION>";
		try {
			resultados = query.consulta("select dim_causa.pk_causa,dim_causa.nombre_causa from dim_causa");
			while (resultados.next()) {
				resultado += "<OPTION VALUE=" + resultados.getInt("pk_causa") + ">"
						+ resultados.getString("nombre_causa") + "</OPTION>";
			}
			resultado += "</SELECT>";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultado;
	}

}
