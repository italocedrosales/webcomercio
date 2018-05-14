package br.edu.ifs.servletusuario;

import br.edu.ifs.dao.UsuarioDAO;
import br.edu.ifs.model.Usuario;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/altera_usuario")
public class AlteraUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {


        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        String cpfcnpj = request.getParameter("cpfcnpj");
        String nome = request.getParameter("nome");
        String rua = request.getParameter("rua");
        int numero = Integer.parseInt(request.getParameter("numero"));
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");
        int tipoUsuario = Integer.parseInt(request.getParameter("tipoUsuario"));
        String pathFoto = request.getParameter("file");

        //cria usuario
        Usuario usuario = new Usuario(idUsuario, cpfcnpj, nome, rua, numero, cidade, estado, telefone,email, tipoUsuario, pathFoto);

        //cadastra no banco
        UsuarioDAO dao = new UsuarioDAO();
        dao.update(usuario);

        response.sendRedirect("crudUsuario/listaUsuario.jsp");


    }
}
