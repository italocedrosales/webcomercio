package br.edu.ifs.servletusuario;

import br.edu.ifs.dao.UsuarioDAO;
import br.edu.ifs.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "/altera_usuario", urlPatterns = {"/altera_usuario"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class AlteraUsuario extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String SAVE_DIR = "FotosUsuarios";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

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

        //cria usuario
        Usuario usuario = new Usuario(idUsuario, cpfcnpj, nome, rua, numero, cidade, estado, telefone, email, tipoUsuario, "");

        //cadastra no banco
        UsuarioDAO dao = new UsuarioDAO();
        dao.update(usuario);

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
                fileName = "usuario_" + idUsuario + "_" + Math.floor(Math.random() * 1000) + nomeArquivo.substring(nomeArquivo.lastIndexOf('.'));
                part.write(savePath + File.separator + fileName);

                dao.gravaFoto(idUsuario, SAVE_DIR + "/" + fileName);
            }
        }
        response.sendRedirect("crudUsuario/listaUsuario.jsp");
    }

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
}
