package br.edu.ifs.model;

public class Compra {

	public Compra(int idCompra, String data, int idUsuario) {
		this.idCompra = idCompra;
		this.data = data;
		this.idUsuario = idUsuario;
	}

	public Compra(String data, int idUsuario) {
		this.data = data;
		this.idUsuario = idUsuario;
	}

	public Compra() {
	}

	private int idCompra;
	private String data;
	private int idUsuario;

	public int getIdCompra() {
		return idCompra;
	}

	public void setIdCompra(int idCompra) {
		this.idCompra = idCompra;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

}
