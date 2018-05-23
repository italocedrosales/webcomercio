package br.edu.ifs.servletproduto;

import br.edu.ifs.dao.ProdutoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/exclui_produto")
public class ExcluiProduto extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idProduto = Integer.parseInt(request.getParameter("idProduto"));

        ProdutoDAO dao = new ProdutoDAO();

        dao.delete(idProduto);

        response.sendRedirect("publica/perfil.jsp");

    }
}
