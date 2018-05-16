package br.edu.ifs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.ifs.model.Usuario;

public class UsuarioDAO {

    private Connection connection;
    private String erro;

    public String getErro() {
        return erro;
    }

    public void setErro(String erro) {
        this.erro = erro;
    }

    public UsuarioDAO() {
        this.connection = new ConnectionFactory().getConnection();
    }

    public int insert(Usuario usuario) {
        String sql = "INSERT INTO usuario(cpfcnpj, nome, rua, numero, cidade, estado, telefone, email, tipousuario, senha) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, MD5(?))";
        int id = 0;

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, usuario.getCpfCnpj());
            stmt.setString(2, usuario.getNome());
            stmt.setString(3, usuario.getRua());
            stmt.setInt(4, usuario.getNumero());
            stmt.setString(5, usuario.getCidade());
            stmt.setString(6, usuario.getEstado());
            stmt.setString(7, usuario.getTelefone());
            stmt.setString(8, usuario.getEmail());
            stmt.setInt(9, usuario.getTipoUsuario());
            stmt.setString(10, usuario.getSenha());



            stmt.execute();

            System.out.println("Recompilei!");

            sql = "SELECT CURRVAL ('usuario_idusuario_seq') AS id";
            stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                id = rs.getInt("id");
            }

            return id;

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
            e.printStackTrace();
        }

        return 0;
    }

    public int gravaFoto(int idUsuario, String pathFoto) {
        String sql = "UPDATE usuario SET path_foto=? WHERE idUsuario=?";

        try {
            // prepared statement para inserção
            PreparedStatement stmt = connection.prepareStatement(sql);

            // seta os valores
            stmt.setString(1, pathFoto);
            stmt.setInt(2, idUsuario);

            // executa
            return stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void delete(int idUsuario) {
        String sql = "delete from usuario where idUsuario=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, idUsuario);

            stmt.execute();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void update(Usuario usuario) {
        String sql = "UPDATE usuario SET cpfcnpj=?, nome=?, rua=?, numero=?, cidade=?, estado=?, telefone=?, email=?, tipousuario=?, senha=MD5(?), path_foto=? WHERE idUsuario=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, usuario.getCpfCnpj());
            stmt.setString(2, usuario.getNome());
            stmt.setString(3, usuario.getRua());
            stmt.setInt(4, usuario.getNumero());
            stmt.setString(5, usuario.getCidade());
            stmt.setString(6, usuario.getEstado());
            stmt.setString(7, usuario.getTelefone());
            stmt.setString(8, usuario.getEmail());
            stmt.setInt(9, usuario.getTipoUsuario());
            stmt.setString(10, usuario.getSenha());
            stmt.setString(11, usuario.getPathFoto());
            stmt.setInt(12, usuario.getIdUsuario());

            stmt.executeUpdate();

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }
    }

    public Usuario getUsuario(int idUsuario) {
        String sql = "select * from usuario where idUsuario=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, idUsuario);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Usuario usuario = new Usuario(rs.getInt("idUsuario"), rs.getString("cpfcnpj"), rs.getString("nome"), rs.getString("rua"), rs.getInt("numero"), rs.getString("cidade"), rs.getString("estado"), rs.getString("telefone"), rs.getString("email"), rs.getInt("tipoUsuario"), rs.getString("senha"), rs.getString("path_foto"));

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

    public List<Usuario> getListaUsuarios() {
        String sql = "select * from usuario";

        List<Usuario> listaUsuarios = new ArrayList<Usuario>();

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Usuario usuario = new Usuario(rs.getInt("idUsuario"), rs.getString("cpfcnpj"), rs.getString("nome"), rs.getString("rua"), rs.getInt("numero"), rs.getString("cidade"), rs.getString("estado"), rs.getString("telefone"), rs.getString("email"), rs.getInt("tipoUsuario"), rs.getString("senha"), rs.getString("path_foto"));
                listaUsuarios.add(usuario);
            }

            return listaUsuarios;

        } catch (SQLException e) {
            // throw new RuntimeException(e);
            this.setErro(e.getMessage());
        }
        return null;
    }


    public Usuario autenticaUsuario(Usuario usuLogin) {

        String sql = "SELECT * FROM usuario WHERE email = ? and senha = MD5(?)";
        try {
            // prepared statement para inserção
            PreparedStatement stmt = connection.prepareStatement(sql);
            // seta os valores
            stmt.setString(1, usuLogin.getEmail());
            stmt.setString(2, usuLogin.getSenha());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Usuario usuario = new Usuario(rs.getInt("idUsuario"), rs.getString("cpfcnpj"), rs.getString("nome"), rs.getString("rua"), rs.getInt("numero"), rs.getString("cidade"), rs.getString("estado"), rs.getString("telefone"), rs.getString("email"), rs.getInt("tipoUsuario"), rs.getString("senha"), rs.getString("path_foto"));

// Retorna Usuario Autenticado
                return usuario;
            } else {
// Retorna Usuario Nulo
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}