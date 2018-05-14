package br.edu.ifs.model;

public class Categoria {

	public Categoria(int idCategoria, String nome) {
		IdCategoria = idCategoria;
		this.nome = nome;
	}

	public Categoria(String nome) {
		this.nome = nome;
	}

	public Categoria() {
	}

	private int IdCategoria;
	private String nome;

	public int getIdCategoria() {
		return IdCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		IdCategoria = idCategoria;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
