package br.edu.ifs.esqueciminhasenha;

import br.edu.ifs.util.EnviarEmail;
import org.apache.commons.mail.EmailException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/esqueci_minha_senha")
public class EsqueciMinhaSenha extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String emailSolicitado = request.getParameter("email");

        EnviarEmail email = new EnviarEmail();
        try {
            email.enviar("Solicitação de Restauração de Senha de Programação III",
                    "Caro Aluno, Recebemos um pedido de alteração de senha de acesso.",emailSolicitado);

                    request.setAttribute("msg", "E-mail enviado com sucesso!");
            request.getRequestDispatcher("publica/esqueciminhasenha.jsp").forward(request,

                    response);
        } catch (EmailException e) {

            e.printStackTrace();
            request.setAttribute("msg", "Não foi possível enviar o e-mail de recuperação!");

            request.getRequestDispatcher("publica/esqueciminhasenha.jsp").forward(request,

                    response);
        }

    }
}
