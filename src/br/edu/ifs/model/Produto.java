package br.edu.ifs.model;

public class Produto {
	
	public Produto(int idProduto, long codigoBarra, String nome, String descricao, String marca, float valor,
			String modelo, int idUsuario, int idCategoria, String pathFoto) {
		this.idProduto = idProduto;
		this.codigoBarra = codigoBarra;
		this.nome = nome;
		this.descricao = descricao;
		this.marca = marca;
		this.valor = valor;
		this.modelo = modelo;
		IdUsuario = idUsuario;
		IdCategoria = idCategoria;
		this.pathFoto = pathFoto;

	}
	
	public Produto(long codigoBarra, String nome, String descricao, String marca, float valor, String modelo,
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

    public Produto(long codigoBarra, String nome, String descricao, String marca, float valor, String modelo, int idCategoria) {
        this.codigoBarra = codigoBarra;
        this.nome = nome;
        this.descricao = descricao;
        this.marca = marca;
        this.valor = valor;
        this.modelo = modelo;
        IdCategoria = idCategoria;
    }

	public Produto(int idProduto, long codigoBarra, String nome, String descricao, String marca, float valor, String modelo, int idCategoria, String pathFoto) {
		this.idProduto = idProduto;
		this.codigoBarra = codigoBarra;
		this.nome = nome;
		this.descricao = descricao;
		this.marca = marca;
		this.valor = valor;
		this.modelo = modelo;
		IdCategoria = idCategoria;
		this.pathFoto = pathFoto;
	}

    public Produto(int idProduto, long codigoBarra, String nome, String descricao, String marca, float valor, String modelo, int idUsuario, int idCategoria, String pathFoto, int quantidade) {
        this.idProduto = idProduto;
        this.codigoBarra = codigoBarra;
        this.nome = nome;
        this.descricao = descricao;
        this.marca = marca;
        this.valor = valor;
        this.modelo = modelo;
        IdUsuario = idUsuario;
        IdCategoria = idCategoria;
        this.pathFoto = pathFoto;
        this.quantidade = quantidade;
    }

	public Produto() {
	}

	private int idProduto;
	private long codigoBarra;
	private String nome;
	private String descricao;
	private String marca;
	private float valor;
	private String modelo;
	private int IdUsuario;
	private int IdCategoria;
	private String pathFoto;
	private int quantidade;

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
	public float getValor() {
		return valor;
	}
	public void setValor(float valor) {
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

    public String getPathFoto() {
        return pathFoto;
    }

    public void setPathFoto(String pathFoto) {
        this.pathFoto = pathFoto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
}
