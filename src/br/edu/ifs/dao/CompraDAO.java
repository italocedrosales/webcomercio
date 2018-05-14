package br.edu.ifs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.ifs.model.Compra;

public class CompraDAO {

    private Connection connection;
    private String erro;

    public String getErro() {
        return erro;
    }

    public void setErro(String erro) {
        this.erro = erro;
    }

    public CompraDAO() {

        this.connection = new ConnectionFactory().getConnection();
    }

    public int insert(Compra compra) {
        String sql = "";
        int id = 0;
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, compra.getIdCompra());
            stmt.setString(2, compra.getData());
            stmt.setInt(3, compra.getIdUsuario());

            stmt.execute();

            sql = "SELECT CURRVAL ('usuario_id_seq') AS id";
            stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                id = rs.getInt("idCompra");
            }
            return id;

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }

        return 0;
    }

    public int delete(int idCompra) {
        String sql = "delete from compra where idcompra=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, idCompra);

            return stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

    public int update(Compra compra) {
        String sql = "UPDATE compra SET  data=?, idusuario=? WHERE idcompra=?;";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, compra.getData());
            stmt.setInt(2, compra.getIdUsuario());
            stmt.setInt(3, compra.getIdCompra());

            return stmt.executeUpdate();

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }
        return 0;
    }

    public Compra getCompra(int idCompra) {
        String sql = "select * from compra where idcompra=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, idCompra);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Compra compra = new Compra(rs.getInt("idCompra"), rs.getString("data"), rs.getInt("IdUsuario"));

                return compra;

            } else {
                return null;
            }
        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }
        return null;
    }

    public List<Compra> getListaCompra() {
        String sql = "select * from compra";

        List<Compra> listaCompra = new ArrayList<Compra>();

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next() == true) {
                Compra compra = new Compra(rs.getInt("idCompra"), rs.getString("data"), rs.getInt("idUsuario"));
                listaCompra.add(compra);
            }

            return listaCompra;

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }
        return null;
    }
}