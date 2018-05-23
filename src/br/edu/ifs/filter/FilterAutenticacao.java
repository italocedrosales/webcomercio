package br.edu.ifs.filter;

import br.edu.ifs.model.Usuario;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(dispatcherTypes = {DispatcherType.REQUEST}, urlPatterns = "/*")
public class FilterAutenticacao implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws ServletException, IOException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String url = httpRequest.getRequestURI();

        // false, caso não exista, não será criada uma sessão
        HttpSession sessao = httpRequest.getSession(false);
        Usuario usuarioAutenticado =
                (Usuario) httpRequest.getSession().getAttribute("usuarioAutenticado");

        // so navega na tela de “Login” e o servlet “autenticaUsuario” e página
        if (usuarioAutenticado != null
                || url.lastIndexOf("publica/") != -1
                || url.lastIndexOf("autentica_usuario") != -1
                || url.lastIndexOf("index.jsp") != -1
                || url.lastIndexOf("node_modules") != -1
                || url.lastIndexOf("crudUsuario/listaUsuario") != -1
                || url.lastIndexOf("crudUsuario/") != -1
                || url.lastIndexOf("crudProduto/") != -1
                || url.lastIndexOf("crudUsuario/listaUsuario.jsp") != -1
                || url.lastIndexOf("img") != -1) {

            chain.doFilter(request, response);
        } else{
            httpResponse.sendRedirect("index.jsp");
        }
    }

    @Override
    public void destroy() {

    }
}
