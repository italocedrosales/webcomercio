package br.edu.ifs.util;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class EnviarEmail {

    public EnviarEmail() {
        super();
    }

    public void enviar(String titulo, String mensagem, String destino)

            throws EmailException {
        SimpleEmail email = new SimpleEmail();
        email.setDebug(true);
        email.setHostName("smtp.gmail.com");
        email.setFrom("programacao3.ifs@gmail.com");
        email.setAuthentication("programacao3.ifs", "ifs123@123");
        email.setSSL(true);
        email.addTo(destino);
        email.setSubject(titulo);
        email.setMsg(mensagem);
        email.send();

    }
}
