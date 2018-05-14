package br.edu.ifs.servletusuario;

import br.edu.ifs.dao.UsuarioDAO;
import br.edu.ifs.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/autentica_usuario")
public class AutenticaUsuario extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // false, caso não exista não é criado
        HttpSession sessao = request.getSession(false);
        // Se for chamada pelo GET e caso tenha sessão ativa, será inativada.
        if (sessao != null) {
            sessao.invalidate();
        }
        request.setAttribute("msg", "");
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Usuario usuario = new Usuario();
        usuario.setEmail(email);
        usuario.setSenha(senha);

        UsuarioDAO usuarioDao = new UsuarioDAO();
        Usuario usuarioAutenticado = usuarioDao.autenticaUsuario(usuario);

        // true, caso não exista, será criada uma sessão
        if (usuarioAutenticado != null) {
            HttpSession sessao = request.getSession(true);
            sessao.setAttribute("usuarioAutenticado", usuarioAutenticado);

            // 5 minutos para expirar a sessão (em segundos)
            sessao.setMaxInactiveInterval(60 * 5);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "Login ou senha invalido!");
            request.getRequestDispatcher("publica/login.jsp").forward(request, response);
        }
    }
}

