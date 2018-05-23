package br.edu.ifs.servletproduto;

import br.edu.ifs.dao.ProdutoDAO;
import br.edu.ifs.model.Produto;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/cadastra_produto")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)

public class CadastraProduto extends HttpServlet {

    private static final String SAVE_DIR = "FotosProdutos";

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        //Pega os parametros
        long cod = Long.parseLong(request.getParameter("cod"));
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        String marca = request.getParameter("marca");
        float valor = Float.parseFloat(request.getParameter("valor"));
        String modelo = request.getParameter("modelo");
        int idCategoria = Integer.parseInt(request.getParameter("categoria"));
        int id = 0;

        Produto produto = new Produto(cod, nome, descricao, marca, valor, modelo, idCategoria);

        ProdutoDAO dao = new ProdutoDAO();
        id = dao.insert(produto);

        // Pega o path absoluto da aplicação web
        String appPath = request.getServletContext().getRealPath("");

        // Constroi o path do diretório para salvar o arquivo
        String savePath = appPath + File.separator + SAVE_DIR;

        // cria o diretório
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        String fileName = "";
        String nomeArquivo = "";
        for (Part part : request.getParts()) {
            nomeArquivo = extractFileName(part);
            if (!nomeArquivo.equals("")) {
                fileName = "produto_" + id + "_" + Math.floor(Math.random() * 1000) + nomeArquivo.substring(nomeArquivo.lastIndexOf('.'));
                part.write(savePath + File.separator + fileName);
            }
        }
        dao.gravaFoto(id, SAVE_DIR + "/" + fileName);

        response.sendRedirect("publica/perfil.jsp");
    }
}
