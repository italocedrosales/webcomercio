package br.edu.ifs.servletusuario;

import br.edu.ifs.dao.UsuarioDAO;
import br.edu.ifs.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.File;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@WebServlet("/cadastra_usuario")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)

public class CadastraUsuario extends HttpServlet {

    private static final String SAVE_DIR = "FotosUsuarios";

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        System.out.println("CadastraUsuario.doPost()");

        //pega os parametros
        String cpfcnpj = request.getParameter("cpfcnpj");
        String nome = request.getParameter("nome");
        String rua = request.getParameter("rua");
        int numero = Integer.parseInt(request.getParameter("numero"));
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");
        int tipoUsuario = Integer.parseInt(request.getParameter("tipoUsuario"));
        String senha = request.getParameter("senha");
        int id = 0;

        //cria usuario
        Usuario usuario = new Usuario(cpfcnpj, nome, rua, numero, cidade, estado, telefone, email, tipoUsuario, senha);

        //cadastra no banco
        UsuarioDAO dao = new UsuarioDAO();
        id = dao.insert(usuario);
        System.out.println(id);
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
                fileName = "usuario_" + id +
                        nomeArquivo.substring(nomeArquivo.lastIndexOf('.'));
                part.write(savePath + File.separator + fileName);

            }
        }
        dao.gravaFoto(id, SAVE_DIR + File.separator + fileName);

        System.out.println("Gravafoto()");

        response.sendRedirect("crudUsuario/listaUsuario.jsp");

    }
}
