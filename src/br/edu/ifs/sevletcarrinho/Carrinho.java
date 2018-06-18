package br.edu.ifs.sevletcarrinho;

import br.edu.ifs.dao.ProdutoDAO;
import br.edu.ifs.model.Produto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/carrinho")
public class Carrinho extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public Carrinho() {
        super();
        // TODO Auto-generated constructor stub
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

        int idproduto = Integer.parseInt(request.getParameter("idProduto"));
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));

        ProdutoDAO produtoDao = new ProdutoDAO();

        Produto produto = produtoDao.getProduto(idproduto);

        produto.setQuantidade(quantidade);

        @SuppressWarnings("unchecked")
        ArrayList<Produto> carrinho = (ArrayList<Produto>) request.getSession().getAttribute("carrinho");

        if (carrinho == null) {
            carrinho = new ArrayList<Produto>();
            request.getSession().setAttribute("carrinho", carrinho);
        }

        carrinho.add(produto);

        response.sendRedirect("carrinho/carrinho.jsp");
    }

}

