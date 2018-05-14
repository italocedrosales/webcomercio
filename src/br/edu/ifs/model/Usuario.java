package br.edu.ifs.model;

public class Usuario {

    public Usuario(int idUsuario, String cpfCnpj, String nome, String rua, int numero, String cidade, String estado, String telefone, String email, int tipoUsuario, String senha, String pathFoto) {
        this.idUsuario = idUsuario;
        this.cpfCnpj = cpfCnpj;
        this.nome = nome;
        this.rua = rua;
        this.numero = numero;
        this.cidade = cidade;
        this.estado = estado;
        this.telefone = telefone;
        this.email = email;
        this.tipoUsuario = tipoUsuario;
        this.senha = senha;
        this.pathFoto = pathFoto;
    }

    public Usuario(String cpfCnpj, String nome, String rua, int numero, String cidade,String estado, String telefone, String email, int tipoUsuario, String senha) {
        this.cpfCnpj = cpfCnpj;
        this.nome = nome;
        this.rua = rua;
        this.numero = numero;
        this.cidade = cidade;
        this.estado = estado;
        this.telefone = telefone;
        this.email = email;
        this.tipoUsuario = tipoUsuario;
        this.senha = senha;
    }

    public Usuario(int idUsuario, String cpfCnpj, String nome, String rua, int numero, String cidade, String estado, String telefone, String email, int tipoUsuario, String pathFoto) {
        this.idUsuario = idUsuario;
        this.cpfCnpj = cpfCnpj;
        this.nome = nome;
        this.rua = rua;
        this.numero = numero;
        this.cidade = cidade;
        this.estado = estado;
        this.telefone = telefone;
        this.email = email;
        this.tipoUsuario = tipoUsuario;
        this.pathFoto = pathFoto;

    }

    public Usuario() {
    }

    private int idUsuario;
    private String cpfCnpj;
    private String nome;
    private String rua;
    private int numero;
    private String cidade;
    private String estado;
    private String telefone;
    private String email;
    private int tipoUsuario;
    private String senha;
    private String pathFoto;


    @Override
    public String toString() {
        return "Usuario [idUsuario=" + idUsuario + ", cpfCnpj=" + cpfCnpj + ", nome=" + nome + ", rua=" + rua
                + ", numero=" + numero + ", cidade=" + cidade + ", estado=" + estado + ", telefone=" + telefone
                + ", email=" + email + ", tipoUsuario=" + tipoUsuario + ", senha=" + senha + "]";
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getCpfCnpj() {
        return cpfCnpj;
    }

    public void setCpfCnpj(String cpfCnpj) {
        this.cpfCnpj = cpfCnpj;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(int tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getPathFoto() {
        return pathFoto;
    }

    public void setPathFoto(String pathFoto) {
        this.pathFoto = pathFoto;
    }

}
