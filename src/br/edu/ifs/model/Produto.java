package br.edu.ifs.model;

public class Produto {
	
	public Produto(int idProduto, long codigoBarra, String nome, String descricao, String marca, String valor,
			String modelo, int idUsuario, int idCategoria) {
		this.idProduto = idProduto;
		this.codigoBarra = codigoBarra;
		this.nome = nome;
		this.descricao = descricao;
		this.marca = marca;
		this.valor = valor;
		this.modelo = modelo;
		IdUsuario = idUsuario;
		IdCategoria = idCategoria;
	}
	
	public Produto(long codigoBarra, String nome, String descricao, String marca, String valor, String modelo,
			int idUsuario, int idCategoria) {
		this.codigoBarra = codigoBarra;
		this.nome = nome;
		this.descricao = descricao;
		this.marca = marca;
		this.valor = valor;
		this.modelo = modelo;
		IdUsuario = idUsuario;
		IdCategoria = idCategoria;
	}

	public Produto() {
	}

	private int idProduto;
	private long codigoBarra;
	private String nome;
	private String descricao;
	private String marca;
	private String valor;
	private String modelo;
	private int IdUsuario;
	private int IdCategoria;
	
	public int getIdProduto() {
		return idProduto;
	}
	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}
	public long getCodigoBarra() {
		return codigoBarra;
	}
	public void setCodigoBarra(long codigoBarra) {
		this.codigoBarra = codigoBarra;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	public int getIdUsuario() {
		return IdUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		IdUsuario = idUsuario;
	}
	public int getIdCategoria() {
		return IdCategoria;
	}
	public void setIdCategoria(int idCategoria) {
		IdCategoria = idCategoria;
	}
	
		
}
