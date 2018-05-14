package br.edu.ifs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.ifs.model.Categoria;

public class CategoriaDAO {

    private Connection connection;
    private String erro;

    public String getErro() {
        return erro;
    }

    public void setErro(String erro) {
        this.erro = erro;
    }

    public CategoriaDAO() {

        this.connection = new ConnectionFactory().getConnection();
    }

    public int insert(Categoria categoria) {
        String sql = "INSERT INTO categoria (nome) VALUES (?);";

        int id = 0;
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, categoria.getNome());
            stmt.execute();

            sql = "SELECT CURRVAL ('usuario_id_seq') AS id";
            stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                id = rs.getInt("idCategoria");
            }
            return id;

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }

        return 0;
    }

    public int delete(int idCategoria) {
        String sql = "delete from categoria where idcategoria=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, idCategoria);

            return stmt.executeUpdate();

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }
        return 0;
    }

    public int update(Categoria categoria) {
        String sql = "UPDATE categoria SET nome=? WHERE idcategoria=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, categoria.getNome());
            stmt.setInt(2, categoria.getIdCategoria());

            return stmt.executeUpdate();

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }
        return 0;
    }

    public Categoria getCategoria(int idCategoria) {
        String sql = "select * from categoria where idcategoria=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, idCategoria);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Categoria usuario = new Categoria(rs.getInt("idCategoria"), rs.getString("nome"));

                return usuario;

            } else {
                return null;
            }
        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }
        return null;
    }

    public List<Categoria> getListaCategoria() {
        String sql = "select * from categoria";

        List<Categoria> listaCategoria = new ArrayList<Categoria>();

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Categoria categoria = new Categoria(rs.getInt("idCategoria"), rs.getString("nome"));
                listaCategoria.add(categoria);
            }

            return listaCategoria;

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }
        return null;
    }
}