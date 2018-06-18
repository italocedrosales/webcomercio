package br.edu.ifs.servletremovedocarrinho;

import br.edu.ifs.dao.ProdutoDAO;
import br.edu.ifs.model.Produto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/removeproduto")
public class RemoveDoCarrinho extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idProduto = Integer.parseInt(request.getParameter("idProduto"));



        ProdutoDAO produtoDao = new ProdutoDAO()
                ;

        Produto produto = produtoDao.getProduto(idProduto);

        produto.setIdProduto(idProduto);

        @SuppressWarnings("unchecked")
        ArrayList<Produto> carrinho = (ArrayList<Produto>) request.getSession().getAttribute("carrinho");


        for(Produto item : carrinho) {
            if(item.getIdProduto() == idProduto) {
                carrinho.remove(item);
                break;
            }

        }

        request.getSession().setAttribute("msg", "Produto removido com sucesso!");

        //response.sendRedirect("Carrinho.jsp");
        System.out.println("Previous page: " + request.getHeader("referer"));
        response.sendRedirect(request.getHeader("referer"));
    }

}
