package br.edu.ifs.servletcategoria;

import br.edu.ifs.dao.CategoriaDAO;
import br.edu.ifs.model.Categoria;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cadastra_categoria")
public class CadastraCategoria extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {


        String nome = request.getParameter("nome");
        int idCategoria = (0);

        Categoria categoria = new Categoria(idCategoria, nome);

        CategoriaDAO catDao = new CategoriaDAO();
        catDao.insert(categoria);

        response.sendRedirect("crudCategoria/listaCategoria.jsp");
    }
}
