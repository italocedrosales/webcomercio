<%@ page import="br.edu.ifs.dao.CategoriaDAO" %>
<%@ page import="br.edu.ifs.model.Categoria" %>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.ifs.model.Produto" %>
<%@ page import="br.edu.ifs.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../node_modules/css/animate.css">
    <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../node_modules/fontawesome-free-5.0.10/web-fonts-with-css/css/fontawesome-all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
          integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
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
                <img class="img-fluid" style="border-radius: 100%" src="<%="../"+usuario.getPathFoto()%>"
                     alt="foto usuario" width="50px">
                <a class="links" href="../autentica_usuario">Sair</a>
            </div>
            <div class="col-md-2"><a class="links" href=""><i class="fa fa-cart-plus" aria-hidden="true"></i> $0,00</a>
            </div>
        </div>
    </div>
</div>
<% }%>

<%--Navegação--%>
<nav class="navbar navbar-expand-md navbar-dark sticky-top" style="background-color: rgba(0,0,0,0.7)">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <img style="width: 50px" src="img/logo2.png" alt="logo">
            Web Comércio
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsivo">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse text-center" id="navbarResponsivo">
            <ul class="navbar-nav ml-auto text-uppercase">
                <%--links--%>
                <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="">Sobre</a></li>
                <li class="nav-item"><a class="nav-link" href="">Serviços</a></li>

                <%--Dropdown--%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="categoria" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Categoria</a>

                    <div class="dropdown-menu" aria-labelledby="categoria">
                        <%
                            Produto produtoCat = new Produto();
                            CategoriaDAO catDao = new CategoriaDAO();
                            List<Categoria> categorias1 = catDao.getListaCategoria();
                            for (Categoria categoria : categorias1) {
                        %>
                        <a class="dropdown-item" href="../crudProduto/listaProdutos.jsp?idCategoria=<%=produtoCat.getIdCategoria()%>"><%=categoria.getNome()%></a>
                        <%}%>
                    </div>
                </li>

                <li class="nav-item"><a class="nav-link" href="">Produtos</a></li>

                <%--seção--%>
                <% if (usuario != null) {%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Seções</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="../crudUsuario/cadastraUsuario.jsp">Cadastrar Usuário</a>
                        <a class="dropdown-item" href="../crudUsuario/listaUsuario.jsp">Listar Usuários</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="../crudCategoria/cadastraCategoria.jsp">Cadastrar Categoria</a>
                        <a class="dropdown-item" href="../crudCategoria/listaCategoria.jsp">Listar Categoria</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="../crudProduto/cadastraProduto.jsp">Cadastra Produtos</a>
                        <a class="dropdown-item" href="../crudProduto/listaProdutos.jsp">Lista Produtos</a>
                    </div>
                </li>
                <%}%>
                <%--Botão login--%>
                <li class="nav-item"><a class="btn btn-outline-info" href="../publica/login.jsp">Login</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <form action="cadastraCategoria.jsp" method="get">
        <table class="table table-hover table-striped text-center">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th colspan="2">Opções</th>
            </tr>
            </thead>
            <tbody>
            <%
                CategoriaDAO dao = new CategoriaDAO();
                List<Categoria> categorias = dao.getListaCategoria();

                for (Categoria categoria : categorias) {
            %>
            <tr>
                <td><%=categoria.getIdCategoria()%>
                </td>
                <td><%=categoria.getNome()%>
                </td>
                <td><a href="alteraCategoria.jsp?idCategoria=<%=categoria.getIdCategoria()%>">Alterar</a></td>
                <td><a href="excluiCategoria.jsp?idCategoria=<%=categoria.getIdCategoria()%>">Excluir</a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <input class="btn btn-primary" type="submit" value="Nova Categoria">
    </form>
</div>

<!--Footer-->
<footer class="bg-dark text-light pt-4 mt-4">

    <!--Footer Links-->
    <div class="container-fluid text-center text-md-left">
        <div class="row">

            <!--First column-->
            <div class="col-md-4">
                <h5 class=""></h5>
                <p></p>
            </div>
            <!--/.First column-->

            <div class="col-md-4">
                <h5>Contato</h5>
                <ul>
                    <li><a href=""></a>Telefone:</li>
                    <li><a href=""></a>Endereço:</li>
                    <li><a href=""></a>E-mail:</li>
                </ul>
            </div>

            <!--Second column-->
            <div class="col-md-4">
                <h5 class="text-uppercase">Redes Sociais</h5>
                <ul class="">
                    <li>
                        <a href="#!">FaceBook</a>
                    </li>
                    <li>
                        <a href="#!">Twitter</a>
                    </li>
                    <li>
                        <a href="#!">Google++</a>
                    </li>
                    <li>
                        <a href="#!">Instagran</a>
                    </li>
                </ul>
            </div>
            <!--/.Second column-->
        </div>
    </div>
    <!--/.Footer Links-->

    <!--Copyright-->
    <div class="container-fluid text-center bg-dark">
        <p class="text-light">© 2018 Copyright:<a class="text-light" href="index.jsp"> WebComércio.com </a></p>
    </div>
    <!--/.Copyright-->

</footer>
<!--/.Footer-->

<%--JavaScript--%>
<script src="../node_modules/jquery/dist/jquery.min.js"></script>
<script src="../node_modules/popper.js/dist/umd/popper.min.js"></script>
<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../node_modules/js/my.js"></script>

</body>
</html>
