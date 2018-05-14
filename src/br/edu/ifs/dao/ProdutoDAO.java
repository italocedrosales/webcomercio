package br.edu.ifs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.ifs.model.Produto;

public class ProdutoDAO {

    private Connection connection;
    private String erro;

    public String getErro() {
        return erro;
    }

    public void setErro(String erro) {
        this.erro = erro;
    }

    public ProdutoDAO() {
        this.connection = new ConnectionFactory().getConnection();
    }

    public int insert(Produto produto) {
        String sql = "INSERT INTO produto (idproduto, codigobarra, nome, descricao, marca, valor, modelo, idusuario, idcategoria) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        int id = 0;

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, produto.getIdProduto());
            stmt.setLong(2, produto.getCodigoBarra());
            stmt.setString(3, produto.getNome());
            stmt.setString(4, produto.getDescricao());
            stmt.setString(5, produto.getMarca());
            stmt.setString(6, produto.getValor());
            stmt.setString(7, produto.getModelo());
            stmt.setInt(8, produto.getIdUsuario());
            stmt.setInt(9, produto.getIdCategoria());

            stmt.execute();

            sql = "SELECT CURRVAL ('usuario_id_seq') AS id";
            stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                id = rs.getInt("idProduto");
            }
            return id;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void delete(int idProduto) {
        String sql = "delete from produto where id=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, idProduto);

            stmt.execute();

        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

    public void update(Produto produto) {
        String sql = "UPDATE produto SET codigobarra=?, nome=?, descricao=?, marca=?, valor=?, modelo=?, idusuario=?, idcategoria=? WHERE idproduto=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setLong(1, produto.getCodigoBarra());
            stmt.setString(2, produto.getNome());
            stmt.setString(3, produto.getDescricao());
            stmt.setString(4, produto.getMarca());
            stmt.setString(5, produto.getValor());
            stmt.setString(6, produto.getModelo());
            stmt.setInt(7, produto.getIdUsuario());
            stmt.setInt(8, produto.getIdCategoria());
            stmt.setInt(9, produto.getIdProduto());

            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Produto getProduto(int idProduto) {
        String sql = "select * from produto where idproduto=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, idProduto);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Produto produto = new Produto(rs.getInt("idproduto"), rs.getLong("codigobarra"), rs.getString("nome"), rs.getString("descricao"), rs.getString("marca"), rs.getString("valor"), rs.getString("modelo"), rs.getInt("idusuario"), rs.getInt("idproduto"));

                return produto;

            } else {
                return null;
            }

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }
        return null;
    }

    public List<Produto> getListaProduto() {
        String sql = "select * from produto";

        List<Produto> listaProduto = new ArrayList<Produto>();
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Produto produto = new Produto(rs.getInt("idproduto"), rs.getLong("codigobarra"), rs.getString("nome"), rs.getString("descricao"), rs.getString("marca"), rs.getString("valor"), rs.getString("modelo"), rs.getInt("idusuario"), rs.getInt("idproduto"));

                listaProduto.add(produto);
            }

            return listaProduto;

        } catch (SQLException e) {
            //throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }
        return null;
    }
}