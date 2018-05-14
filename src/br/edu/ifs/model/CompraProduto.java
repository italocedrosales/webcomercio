package br.edu.ifs.model;

public class CompraProduto {

	public CompraProduto(int idCompraProduto, int idProduto, int idCompra, int quantidade) {
		this.idCompraProduto = idCompraProduto;
		this.idProduto = idProduto;
		this.idCompra = idCompra;
		this.quantidade = quantidade;
	}

	public CompraProduto(int idProduto, int idCompra, int quantidade) {
		this.idProduto = idProduto;
		this.idCompra = idCompra;
		this.quantidade = quantidade;
	}

	public CompraProduto() {
	}

	private int idCompraProduto;
	private int idProduto;
	private int idCompra;
	private int quantidade;

	public int getIdCompraProduto() {
		return idCompraProduto;
	}

	public void setIdCompraProduto(int idCompraProduto) {
		this.idCompraProduto = idCompraProduto;
	}

	public int getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}

	public int getIdCompra() {
		return idCompra;
	}

	public void setIdCompra(int idCompra) {
		this.idCompra = idCompra;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

}
