package br.edu.ifs.servletcategoria;

import br.edu.ifs.dao.CategoriaDAO;
import br.edu.ifs.model.Categoria;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/altera_categoria")
public class AlteraCategoria extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
        String nome = request.getParameter("nome");

        Categoria categoria = new Categoria(idCategoria, nome);

        CategoriaDAO catDao = new CategoriaDAO();
        catDao.update(categoria);

        response.sendRedirect("crudCategoria/listaCategoria.jsp");
    }
}
