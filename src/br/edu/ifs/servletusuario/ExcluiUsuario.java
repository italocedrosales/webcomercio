package br.edu.ifs.servletusuario;

import br.edu.ifs.dao.UsuarioDAO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/exclui_usuario")
public class ExcluiUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

        UsuarioDAO dao = new UsuarioDAO();

        dao.delete(idUsuario);

        response.sendRedirect("crudUsuario/listaUsuario.jsp");

    }
}
