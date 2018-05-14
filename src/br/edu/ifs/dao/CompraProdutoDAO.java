package br.edu.ifs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.ifs.model.CompraProduto;

public class CompraProdutoDAO {

    private Connection connection;
    private String erro;

    public String getErro() {
        return erro;
    }

    public void setErro(String erro) {
        this.erro = erro;
    }

    public CompraProdutoDAO() {

        this.connection = new ConnectionFactory().getConnection();
    }

    public int insert(CompraProduto compraProduto) {
        String sql = "INSERT INTO compraproduto(idproduto, idcompra, quantidade) VALUES (?, ?, ?);";
        int id = 0;
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, compraProduto.getIdProduto());
            stmt.setInt(2, compraProduto.getIdCompra());
            stmt.setInt(3, compraProduto.getQuantidade());

            stmt.execute();


            sql = "SELECT CURRVAL ('usuario_id_seq') AS id";
            stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                id = rs.getInt("idCompraProduto");
            }
            return id;

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }

        return 0;
    }

    public void delete(int idCompraProduto) {
        String sql = "DELETE FROM compraproduto WHERE id=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, idCompraProduto);

            stmt.executeUpdate();

        } catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public int update(CompraProduto compraProduto) {
        String sql = "UPDATE compraproduto SET idproduto=?, idcompra=?, quantidade=? WHERE idcompraproduto=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, compraProduto.getIdProduto());
            stmt.setInt(2, compraProduto.getIdCompra());
            stmt.setInt(3, compraProduto.getQuantidade());
            stmt.setInt(4, compraProduto.getIdCompraProduto());

            stmt.executeUpdate();

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }
        return 0;
    }

    public CompraProduto getCompraProduto(int idCompraProduto) {
        String sql = "select * from compraproduto where idcompraproduto=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, idCompraProduto);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                CompraProduto compraProduto = new CompraProduto(rs.getInt("idCompraProduto"), rs.getInt("IdProduto"),
                        rs.getInt("IdCompra"), rs.getInt("IdQuantidade"));

                return compraProduto;

            } else {
                return null;
            }
        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }
        return null;
    }

    public List<CompraProduto> getListaCompraProduto() {
        String sql = "select * from compraproduto";

        List<CompraProduto> listaCompraProduto = new ArrayList<CompraProduto>();

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next() == true) {
                CompraProduto compraProduto = new CompraProduto(rs.getInt("idCompraProduto"), rs.getInt("IdProduto"),
                        rs.getInt("idCompra"), rs.getInt("idQuantidade"));
                listaCompraProduto.add(compraProduto);
            }

            return listaCompraProduto;

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }
        return null;
    }
}