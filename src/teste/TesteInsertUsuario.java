package teste;

import br.edu.ifs.dao.UsuarioDAO;
import br.edu.ifs.model.Usuario;

public class TesteInsertUsuario {
    public static void main(String[] args) {

        Usuario usuario = new Usuario();

        usuario.setNome("Divangel");

        UsuarioDAO dao = new UsuarioDAO();

        dao.insert(usuario);

        System.out.println("Usuario cadastrado!");
    }
}
