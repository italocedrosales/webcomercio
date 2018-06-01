<%@ page import="br.edu.ifs.dao.UsuarioDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.ifs.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>../node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../node_modules/fontawesome-free-5.0.10/web-fonts-with-css/css/fontawesome-all.css">
    <link rel="stylesheet" href="../node_modules/css/index.css">
</head>
<body class="bg-light">

<%
    Usuario usuario1 = (Usuario)
            request.getSession().getAttribute("usuarioAutenticado");
    if (usuario1 != null) {%>

<div class="container-fluid bg-info d-none d-md-block d-block">
    <div class="container">
        <div class="row text-light pt-2 pb-2">
            <div class="col-md-5"><i class="fa fa-envelope" aria-hidden="true"></i> <%=usuario1.getEmail()%>
            </div>
            <div class="col-md-2"></div>
            <div class="col-md-3"><i class="fa fa-user" aria-hidden="true"></i> <%=usuario1.getNome()%>
                <img class="img-fluid" src="<%="../"+usuario1.getPathFoto()%>" alt="foto usuario" width="50px"
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

<%
    int linhas = 5;
    int paginaAtual = 1;
    int paginaInicial = 1;

    if (request.getParameter("linhas") != null) {
        linhas = Integer.parseInt(request.getParameter("linhas"));
    }

    if (request.getParameter("paginaAtual") != null) {
        paginaAtual = Integer.parseInt(request.getParameter("paginaAtual"));
    }

    if (request.getParameter("paginaInicial") != null) {
        paginaInicial = Integer.parseInt(request.getParameter("paginaInicial"));
    }
%>

<%--Conteudo--%>
<div class="container-fluid">
    <hr>
    <h1 class="text-info text-center m-4">Lista de Usuários</h1>
    <hr>
    <div class="table-responsive-md">
        <form action="cadastraUsuario.jsp" method="get">
            <table class="table table-hover text-center">
                <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Foto</th>
                    <th></th>
                    <th>Nome</th>
                    <th>Rua</th>
                    <th>Número</th>
                    <th>Cidade</th>
                    <th>Estado</th>
                    <th>Telefone</th>
                    <th>E-mail</th>
                    <th>Tipo</th>
                    <th colspan="2">Opções</th>
                </tr>
                </thead>
                <tbody>
                <%
                    UsuarioDAO usuarioDao = new UsuarioDAO();
                    int totalUsuarios = usuarioDao.totalUsuarios();
                    int totalPaginas = totalUsuarios / linhas;
                    if ((totalUsuarios % linhas) > 0) {
                        totalPaginas++;
                    }
                    List<Usuario> usuarios = usuarioDao.getListaUsuarios(linhas, paginaAtual);
                    for (Usuario usuario : usuarios) {
                %>
                <tr>
                    <td><%=usuario.getIdUsuario()%>
                    </td>
                    <td><img src="<%="../"+usuario.getPathFoto()%>" alt="fotoUsuario" width="50px" height="50">
                    </td>
                    <td><%=usuario.getCpfCnpj()%>
                    </td>
                    <td><%=usuario.getNome()%>
                    </td>
                    <td><%=usuario.getRua()%>
                    </td>
                    <td><%=usuario.getNumero()%>
                    </td>
                    <td><%=usuario.getCidade()%>
                    </td>
                    <td><%=usuario.getEstado()%>
                    </td>
                    <td><%=usuario.getTelefone()%>
                    </td>
                    <td><%=usuario.getEmail()%>
                    </td>
                    <td><%=usuario.getTipoUsuario()%>
                    </td>
                    <td><a href="alteraUsuario.jsp?idUsuario=<%= usuario.getIdUsuario()%>"><i class="fas fa-edit"></i></a></td>
                    <td><a href="excluiUsuario.jsp?idUsuario=<%= usuario.getIdUsuario()%>"><i class="fas fa-times"></i></a></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>

            <nav aria-label="Page navigation example m-3">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <%
                        for (int i = paginaInicial; i <= paginaInicial + 9; i++) {
                            if (i <= totalPaginas) {
                                if (i == paginaAtual) {
                                    out.println("" + i);
                                } else {
                                    if (i > 5) {
                                        out.println("<li class=\"page-item\"><a class=\"page-link\" href=\"../crudUsuario/listaUsuario.jsp?linhas="
                                                + linhas + "&paginaAtual=" + i + "&paginaInicial="
                                                + (i - 4) + "\">" + i + "</a></li>");
                                    } else {
                                        out.println("<li class=\"page-item\"><a class=\"page-link\" href=\"../crudUsuario/listaUsuario.jsp?linhas="
                                                + linhas + "&paginaAtual=" + i + "&paginaInicial="
                                                + 1 + "\">" + i + "</a></li>");
                                    }
                                }
                            }
                        }
                    %>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>

            <input class="btn btn-primary" type="submit" value="Novo Cadastro">
        </form>
    </div>
</div>

<%--JavaScript--%>
<script src="<%=request.getContextPath()%>../node_modules/jquery/dist/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>../node_modules/popper.js/dist/popper.min.js"></script>
<script src="<%=request.getContextPath()%>../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
