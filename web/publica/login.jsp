<%@ page import="br.edu.ifs.model.Usuario"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Web-Comércio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../node_modules/css/animate.css">
    <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../node_modules/fontawesome-free-5.0.10/web-fonts-with-css/css/fontawesome-all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
          integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
    <link rel="stylesheet" href="../node_modules/css/login.css">
</head>
<body id="login">

<%--Navegação--%>
<nav class="navbar navbar-expand-md navbar-dark sticky-top p-0" style="background-color: rgba(0,0,0,0.7)">
    <div class="container">
        <a class="navbar-brand" href="../index.jsp">
            <img style="width: 50px" src="../img/logo2.png" alt="logo">
            Web Comércio
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsivo">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse text-center" id="navbarResponsivo">
            <ul class="navbar-nav ml-auto text-uppercase">
                <li class="nav-item active"><a class="nav-link" href="../index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="">Sobre</a></li>
                <li class="nav-item"><a class="nav-link" href="">Serviços</a></li>
                <li class="nav-item"><a class="nav-link" href="">Produtos</a></li>
                <li class="nav-item"><a class="nav-link" href="">Contato</a></li>

                <%
                    Usuario usuario = (Usuario)
                            request.getSession().getAttribute("usuarioAutenticado");
                    if (usuario != null) {
                %>
                <%--Seção--%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Seções</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="../crudUsuario/cadastraUsuario.jsp">Cadastrar Usuário</a>
                        <a class="dropdown-item" href="../crudUsuario/listaUsuario.jsp">Listar Usuários</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="../crudCategoria/cadastraCategoria.jsp">Cadastrar Categoria</a>
                        <a class="dropdown-item" href="../crudCategoria/listaCategoria.jsp">Listar Categoria</a>
                    </div>
                </li>
                <%}%>
                <%--Botão login--%>
            </ul>
        </div>
    </div>
</nav>

<%--Tela de Login--%>
<div class="container-fluid box">
    <p style="color: red">${msg}</p>
    <h2 class="text-info text-center">Login</h2>
    <form action="../autentica_usuario" method="post">
        <div class="inputbox">
            <input type="email" id="email" name="email" autocomplete="off" required>
            <label for="email">E-mail:</label>
        </div>
        <div class="inputbox">
            <input type="password" id="senha" name="senha" required>
            <label for="senha">Senha:</label>
        </div>
        <input class="btn btn-outline-info btn-block" type="submit" value="Login">
        <a href="../crudUsuario/cadastraUsuario.jsp" class="btn btn-info btn-block" type="text">Cadastrar-se</a> <br>
        <a class="text-light" href="esqueciminhasenha.jsp">Esqueceu sua senha?</a>
    </form>
</div>

<%--JavaScript--%>
<script src="../node_modules/jquery/dist/jquery.min.js"></script>
<script src="../node_modules/popper.js/dist/popper.min.js"></script>
<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
