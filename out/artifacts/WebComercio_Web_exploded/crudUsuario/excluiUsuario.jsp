<%@ page import="br.edu.ifs.model.Usuario" %>
<%@ page import="br.edu.ifs.dao.UsuarioDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
<%
    Usuario usuario = (Usuario)
            request.getSession().getAttribute("usuarioAutenticado");
    if (usuario != null) {%>

<div class="container-fluid bg-info d-none d-md-block d-block">
    <div class="container">
        <div class="row text-light pt-2 pb-2">
            <div class="col-md-5"><i class="fa fa-envelope" aria-hidden="true"></i> <%=usuario.getEmail()%>
            </div>
            <div class="col-md-2"></div>
            <div class="col-md-3"><i class="fa fa-user" aria-hidden="true"></i> <%=usuario.getNome()%>
                <img class="img-fluid" src="<%="../"+usuario.getPathFoto()%>" alt="foto usuario" width="50px"
                     height="50px">
                <a class="links" href="../autentica_usuario">Sair</a>
            </div>
            <div class="col-md-2"><a class="links" href=""><i class="fa fa-cart-plus" aria-hidden="true"></i> $0,00</a>
            </div>
        </div>
    </div>
</div>
<% }%>

<%--Navegação--%>
<nav class="navbar navbar-expand-md navbar-dark sticky-top p-0" style="background-color: rgba(0,0,0,0.7)">
    <div class="container-fluid">
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
                <li class="nav-item"><a class="btn btn-outline-info" href="../publica/login.jsp"> Minha Loja</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">

    <h1 class="text-center text-info">Excluir Usuário</h1>

    <div class="container mx-auto" style="width: 500px">
        <%
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            UsuarioDAO dao = new UsuarioDAO();
            Usuario usuario = dao.getUsuario(idUsuario);
        %>
        <%--Formulario--%>
        <form action="../exclui_usuario" method="get">
            <%--id--%>

            <input type="hidden" name="idUsuario" value="<%=usuario.getIdUsuario()%>">

            <%--cpfcnpj--%>
            <div class="form-group">
                <label for="cpfcnpj">CPF/CNPJ:</label>
                <input disabled="disabled" class="form-control" type="text" id="cpfcnpj" name="cpfcnpj" maxlength="14"
                       value="<%=usuario.getCpfCnpj()%>">
            </div>
            <%--Nome--%>
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input class="form-control" type="text" id="nome" name="nome" value="<%=usuario.getNome()%>" disabled>
            </div>
            <%--Rua--%>
            <div class="form-group">
                <label for="rua">Rua:</label>
                <input class="form-control" type="text" id="rua" name="rua" value="<%=usuario.getRua()%>" disabled>
            </div>
            <%--Número--%>
            <div class="form-group">
                <label for="numero">Número:</label>
                <input class="form-control" type="text" id="numero" name="numero" value="<%=usuario.getNumero()%>"
                       disabled>
            </div>
            <%--Cidade--%>
            <div class="form-group">
                <label for="cidade">Cidade:</label>
                <input class="form-control" type="text" id="cidade" name="cidade" value="<%=usuario.getCidade()%>"
                       disabled>
            </div>
            <%--Estado--%>
            <div class="form-group">
                <label for="estado">Estado:</label>
                <input class="form-control" type="text" id="estado" name="estado" maxlength="2"
                       value="<%=usuario.getEstado()%>" disabled>
            </div>
            <%--Telefone--%>
            <div class="form-group">
                <label for="telefone">Telefone:</label>
                <input class="form-control" type="text" id="telefone" name="telefone"
                       value="<%=usuario.getTelefone()%>" disabled>
            </div>
            <%--E-mail--%>
            <div class="form-group">
                <label for="email">E-mail:</label>
                <input class="form-control" type="email" id="email" name="email" value="<%=usuario.getEmail()%>"
                       disabled>
            </div>
            <%--TipoUsuario--%>
            <div class="form-group">
                <label for="tipoUsuario">Tipo de Usuario:</label>
                <input class="form-control" type="text" id="tipoUsuario" name="tipoUsuario"
                       value="<%=usuario.getTipoUsuario()%>" disabled>
            </div>
            <div class="form-group">
                <label for="foto">Foto:</label>
                <input type="file" class="form-control-file" id="foto" name="file">
            </div>
            <%--Botões--%>
            <input class="btn btn-primary" type="submit" value="Excluir">
            <input class="btn btn-primary" type="button" value="Cancelar"
                   onclick="window.location.assign('listaUsuario.jsp')">
        </form>
    </div>
</div>

<%--JavaScript--%>
<script src="../node_modules/jquery/dist/jquery.min.js"></script>
<script src="../node_modules/popper.js/dist/popper.min.js"></script>
<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
