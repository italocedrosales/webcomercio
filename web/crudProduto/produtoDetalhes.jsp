<%@ page import="br.edu.ifs.model.Produto" %>
<%@ page import="br.edu.ifs.dao.CategoriaDAO" %>
<%@ page import="br.edu.ifs.model.Categoria" %>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.ifs.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Detalhes do Produto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../node_modules/css/animate.css">
    <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../node_modules/fontawesome-free-5.0.10/web-fonts-with-css/css/fontawesome-all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
          integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
    <link rel="stylesheet" href="../node_modules/css/index.css">
</head>
<body>
<%
    Usuario usuario = (Usuario)
            request.getSession().getAttribute("usuarioAutenticado");
    if (usuario != null) {%>

<div class="container-fluid bg-info d-none d-md-block d-block">
    <div class="container">
        <div class="row text-light pt-2 pb-2" style="color: white">
            <div class="col-md-5"><i class="fa fa-envelope" aria-hidden="true"></i> <%=usuario.getEmail()%>
            </div>
            <div class="col-md-2"></div>
            <div class="col-md-3"><i class="fa fa-user" aria-hidden="true"></i> <%=usuario.getNome()%>
                <img class="img-fluid rounded mr-2 ml-2" src="<%="../"+usuario.getPathFoto()%>"
                     alt="foto usuario" width="50px">
                <a style="color: white" class="links" href="../autentica_usuario">Sair</a>
            </div>
            <div class="col-md-2 pt-1"><a style="color: white" class="links" href=""><i class="fa fa-cart-plus"
                                                                                        aria-hidden="true"></i>
                $0,00</a>
            </div>
        </div>
    </div>
</div>
<% }%>

<%--Navegação--%>
<nav class="navbar navbar-expand-md navbar-dark sticky-top " style="background-color: rgba(0,0,0,0.7)">
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

                <%--links--%>
                <li class="nav-item active"><a class="nav-link" href="../index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="">Sobre</a></li>
                <li class="nav-item"><a class="nav-link" href="">Produtos</a></li>

                <%--Dropdown--%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="categoria" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-th mr-1"></i>Categoria</a>

                    <div class="dropdown-menu" aria-labelledby="categoria">
                        <%
                            Produto produtoCat = new Produto();
                            CategoriaDAO catDao = new CategoriaDAO();
                            List<Categoria> categorias = catDao.getListaCategoria();
                            for (Categoria categoria : categorias) {
                        %>
                        <a class="dropdown-item"
                           href="../crudProduto/listaProdutos.jsp?idCategoria=<%=produtoCat.getIdCategoria()%>"><%=categoria.getNome()%>
                        </a>
                        <%}%>
                    </div>
                </li>

                <%--seção--%>
                <% if (usuario != null) {%>
                <li class="nav-item dropdown mr-5">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Serviços</a>
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


<div class="container-fluid m-0" style="background: linear-gradient(45deg, #1675ff, #3bbeff)">
    <div class="row" style="height: 20px"></div>
</div>

<!--Footer-->
<footer class="bg-dark text-light pt-3">

    <!--Footer Links-->
    <div class="container-fluid text-center text-md-left">
        <div class="row">

            <!--First column-->
            <div class="col-lg-3">
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <h5 class="text-center">Localização</h5>
                        <iframe class="m-2"
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3914.284058532884!2d-38.01017815009233!3d-11.16659122915086!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x711b2ef8389b869%3A0xf53700297625cf8f!2sIFS+-+Instituto+Federal+de+Sergipe%2C+Campus+Tobias+Barreto!5e0!3m2!1spt-BR!2sbr!4v1527382277870"
                                width="250" height="150" frameborder="0" style="border:0" allowfullscreen></iframe>
                    </div>
                    <div class="col-lg-4"></div>
                </div>
            </div>
            <div class="col-lg-3"></div>

            <div class="col-lg-3">
                <h5 class="">Contato</h5>
                <ul>
                    <li><a href=""></a>Telefone:</li>
                    <li><a href=""></a>Endereço:</li>
                    <li><a href=""></a>E-mail:</li>
                </ul>
            </div>

            <!--Second column-->
            <div class="col-lg-3">
                <h5 class="">Redes Sociais</h5>
                <ul class="">
                    <li>
                        <a href="#">FaceBook</a>
                    </li>
                    <li>
                        <a href="#">Twitter</a>
                    </li>
                    <li>
                        <a href="#">Google++</a>
                    </li>
                    <li>
                        <a href="#">Instagran</a>
                    </li>
                </ul>
            </div>
            <!--/.Second column-->
        </div>
    </div>
    <!--/.Footer Links-->

    <!--Copyright-->
    <div class=" row container-fluid bg-dark mt-2">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <p class="text-light text-center">&copy; 2018 Copyright:<a class="text-light" href="index.jsp">
                WebComércio.com </a></p>
        </div>
        <div class="col-lg-4"></div>
    </div>
    <!--/.Copyright-->
</footer>
<!--/.Footer-->

<%--JavaScript--%>
<script src="../node_modules/jquery/dist/jquery.min.js"></script>
<script src="../node_modules/popper.js/dist/umd/popper.min.js"></script>
<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../node_modules/js/my.js"></script>
<script src="../node_modules/js/wow.js"></script>

</body>
</html>
