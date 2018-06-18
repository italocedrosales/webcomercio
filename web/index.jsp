<%@ page import="br.edu.ifs.dao.CategoriaDAO" %>
<%@ page import="br.edu.ifs.model.Categoria" %>
<%@ page import="br.edu.ifs.model.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Web-Comércio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="node_modules/css/animate.css">
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="node_modules/fontawesome-free-5.0.10/web-fonts-with-css/css/fontawesome-all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
          integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
    <link rel="icon" href="img/logo2.png">
    <link rel="stylesheet" href="node_modules/css/index.css">
</head>
<body>

<%
    Usuario usuario = (Usuario)
            request.getSession().getAttribute("usuarioAutenticado");
    if (usuario != null) {
%>

<div class="container-fluid bg-info d-none d-md-block d-block d-sm-none">
    <div class="row text-light text-center">
        <div class="col-md-4 col-lg-5 pt-3"><i class="fa fa-envelope" aria-hidden="true"></i> <%=usuario.getEmail()%>
        </div>
        <div class="col-lg-2"></div>
        <div class="col-md-4 col-lg-3"><i class="fa fa-user" aria-hidden="true"></i> <%=usuario.getNome()%>
            <img class="img-fluid rounded-circle m-2" src="<%="../"+usuario.getPathFoto()%>"
                 alt="foto usuario" style="width: 35px; height: 35px">
            <a class="links text-light" href="../autentica_usuario">Sair</a>
        </div>
        <div class="col-md-4 col-lg-2">
            <div class="mt-3">
                <a class="links text-light" href="carrinho/carrinho.jsp"><i class="fa fa-cart-plus"
                                                                            aria-hidden="true"></i> Meu Carrinho</a>
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
        <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#navbarResponsivo">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse text-center" id="navbarResponsivo">
            <ul class="navbar-nav ml-auto text-uppercase">
                <%--links--%>
                <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="publica/sobre.jsp">Sobre</a></li>
                <li class="nav-item"><a class="nav-link" href="publica/contato.jsp">Contato</a></li>
                <li class="nav-item"><a class="nav-link" href="crudProduto/listaProdutos.jsp">Produtos</a></li>

                <%--Dropdown--%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="categoria" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-th mr-1"></i>Categoria</a>

                    <div class="dropdown-menu" aria-labelledby="categoria">
                        <%
                            CategoriaDAO catDao = new CategoriaDAO();
                            List<Categoria> categorias = catDao.getListaCategoria();
                            for (Categoria categoria : categorias) {
                        %>
                        <a class="dropdown-item"
                           href="crudProduto/listaProdutos.jsp?idCategoria=<%=categoria.getIdCategoria()%>"><%=categoria.getNome()%>
                        </a>
                        <%}%>
                    </div>
                </li>

                <%--seção--%>
                <% if (usuario != null) {
                    if (usuario.getTipoUsuario() == 3) {
                %>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Seções</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="crudUsuario/cadastraUsuario.jsp">Cadastrar Usuário</a>
                        <a class="dropdown-item" href="crudUsuario/listaUsuario.jsp">Listar Usuários</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="crudCategoria/cadastraCategoria.jsp">Cadastrar Categoria</a>
                        <a class="dropdown-item" href="crudCategoria/listaCategoria.jsp">Listar Categoria</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="crudProduto/cadastraProduto.jsp">Cadastra Produtos</a>
                        <a class="dropdown-item" href="crudProduto/listaProdutos.jsp">Lista Produtos</a>
                    </div>
                </li>
                <%
                        }
                    }
                %>
                <%--Botão login--%>
                <li class="nav-item pl-3"><a class="btn btn-outline-info" href="publica/login.jsp">Login</a></li>
            </ul>
        </div>
    </div>
</nav>

<%--Slide de Imagens--%>
<header>
    <div id="slideImg" class="carousel slide" data-ride="carousel">
        <%--Indicadores--%>
        <ol class="carousel-indicators" style="bottom: 50px">
            <li data-target="#slideImg" data-slide-to="0" class="active"></li>
            <li data-target="#slideImg" data-slide-to="1"></li>
            <li data-target="#slideImg" data-slide-to="2"></li>
        </ol>

        <%--slide--%>
        <div class="carousel-inner">

            <%--item--%>
            <div class="carousel-item active">
                <%--imagem--%>
                <img class="d-block w-100" src="img/slides/casal.jpeg" alt="First slide">
                <%--caption--%>
                <div class="carousel-caption d-none d-md-block" style="bottom: 100px">
                    <h1 class="text-light text-uppercase display-3 wow flip" data-wow-duration=""
                        data-wow-delay="1s" data-wow-offset="">Web Comércio</h1>
                    <h3 class="text-light wow tada" data-wow-duration="3s" data-wow-daley="2s"
                        data-wow-offset="10" data-wow-iteration="1">Venda online com uma loja virtual própria</h3>
                    <%
                        if (usuario != null) {
                            if (usuario.getTipoUsuario() == 2 && usuario.getTipoUsuario() == 3) ;

                    %>
                    <a class="btn btn-outline-info btn-lg" href="crudUsuario/cadastraUsuario.jsp">Criar Conta</a>
                    <a class="btn btn-info btn-lg" href="publica/perfil.jsp">Minha Loja</a>
                    <%
                        }
                    %>
                </div>
            </div>

            <%--item--%>
            <div class="carousel-item">
                <img class="d-block w-100" src="img/slides/celular.jpeg" alt="Second slide">
            </div>

            <%--item--%>
            <div class="carousel-item">
                <img class="d-block w-100" src="img/slides/mulher.jpeg" alt="Third slide">
            </div>
        </div>
        <%--Controles--%>
        <a class="carousel-control-prev" href="#slideImg" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </a>
        <a class="carousel-control-next" href="#slideImg" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </a>
    </div>
</header>

<div class="row container-fluid text-center text-light h2 m-0"
     style="background: linear-gradient(45deg , #4781ff, #3dd1e8); height: 20px;">
    <%--<div class="col-lg-3 p-3"><i class="fas fa-lock lg-x2"></i> Segurança</div>--%>
    <div class="col-lg-3"></div>
    <div class="col-lg-3"></div>
    <div class="col-lg-3"></div>
</div>


<%--Conteudo--%>
<div class="container-fluid text-center mt-0" style="background-color: #f5faff">

    <div class="row p-4 align-middle mx-auto mt-0">

        <div class="col-xl-6 col-md-12 p-md-5 p-sm-5">
            <img class="img-fluid wow fadeInLeft" data-wow-delay="0s"
                 src="img/Como-montar-uma-loja-virtual-Criar-loja-online-502x300.png" alt="">
        </div>

        <div class="col-xl-6 col-md-12 p-md-5 p-sm-5">
            <h2 class="display-4 text-info wow fadeInRight mt-lg-5" data-wow-delay="1s">Sua loja online 100%
                profissional</h2>
        </div>
    </div>

    <div class="row p-3 align-middle mx-auto">

        <div class="col-xl-4 col-md-12">
            <div>
                <h4 class="text-info">Seus produtos organizados e com preço visível</h4>
                <p class="lead">A Web Comércio oferece uma loja online pensada para otimizar todos os
                    passos de uma
                    compra. Os
                    seus clientes poderão visualizar as fotos dos produtos, descrições, preços e agregá-los ao
                    carrinho de compras.</p>
            </div>
        </div>

        <div class="col-xl-4 col-md-12">
            <div>
                <h4 class="text-info">Em qualquer tipo de tela</h4>
                <p class="lead">A sua loja precisa estar disponível em qualquer dispositivo. Os
                    nossos layouts são
                    pensados para
                    atender às necessidades dos clientes e para serem visualizados em celulares, tablets e
                    computadores de mesa.</p>
            </div>
        </div>

        <div class="col-xl-4 col-md-12">
            <div>
                <h4 class="text-info">Com a cara da sua marca</h4>
                <p class="lead">Todos os layouts são customizáveis e podem ser alterados para transmitam a imagem da
                    sua marca.
                    Os clientes logo perceberão que aquela é a sua loja online por ter uma identidade visual única e
                    marcante.</p>
            </div>
        </div>
    </div>
</div>

<div class="jumbotron jumbotron-fluid align-content-center mb-0">
    <div class="container">
        <div class="row pai">
            <div class="col-lg-6 filho">
                <h2 class="text-center display-4 mt-lg-5">Dê a melhor experiência de compra para seus clientes</h2>
            </div>
            <div class="col-lg-6">
                <img class="img-fluid" src="img/loja1.png" alt="">
            </div>
        </div>
    </div>
</div>

<div class="container-fluid m-0" style="background: linear-gradient(45deg, #1675ff, #3bbeff)">
    <div class="row" style="height: 25px"></div>
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
                <ul class="text-left text">
                    <li><a href=""></a>Telefone:</li>
                    <li><a href=""></a>Endereço:</li>
                    <li><a href=""></a>E-mail:</li>
                </ul>
            </div>

            <!--Second column-->
            <div class="col-lg-3">
                <h5 class="">Redes Sociais</h5>
                <ul class="text-left">
                    <li>
                        <a href="#"><i class="fab fa-facebook-f"></i>FaceBook</a>
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
<script src="node_modules/jquery/dist/jquery.min.js"></script>
<script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
<script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="node_modules/js/my.js"></script>
<script src="node_modules/js/wow.js"></script>
<script>
    new WOW().init();
</script>
</body>
</html>