<%@ page import="br.edu.ifs.model.Usuario" %>
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
    <link rel="stylesheet" href="node_modules/css/index.css">
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
                <img class="img-fluid rounded-circle" src="<%="../"+usuario.getPathFoto()%>" alt="foto usuario" width="50px"
                     height="">
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
                <li class="nav-item"><a class="nav-link" href="">Produtos</a></li>
                <li class="nav-item"><a class="nav-link" href="">Contato</a></li>

                <%--seção--%>
                <% if (usuario != null) {%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Seções</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="crudUsuario/cadastraUsuario.jsp">Cadastrar Usuário</a>
                        <a class="dropdown-item" href="crudUsuario/listaUsuario.jsp">Listar Usuários</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="crudCategoria/cadastraCategoria.jsp">Cadastrar Categoria</a>
                        <a class="dropdown-item" href="crudCategoria/listaCategoria.jsp">Listar Categoria</a>
                    </div>
                </li>
                <%}%>
                <%--Botão login--%>
                <li class="nav-item"><a class="btn btn-outline-info" href="publica/login.jsp">Login</a></li>
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
                <img class="d-block w-100" src="img/slide1.jpeg" alt="First slide">
                <%--caption--%>
                <div class="carousel-caption d-none d-md-block" style="top: 200px;">
                    <h1 class="text-light text-uppercase display-3 wow flip" data-wow-duration=""
                        data-wow-delay="1s" data-wow-offset="">Web Comércio</h1>
                    <h3 class="text-light wow tada" data-wow-duration="3s" data-wow-daley="2s"
                        data-wow-offset="10" data-wow-iteration="1">Venda online com uma loja virtual própria</h3>
                    <a class="btn btn-outline-info btn-lg" href="sobre.jsp">Leia Mais</a>
                    <a class="btn btn-info btn-lg" href="publica/login.jsp">Minha Loja</a>
                </div>
            </div>
            <%--item--%>
            <div class="carousel-item">
                <img class="d-block w-100" src="img/slide2.jpeg" alt="Second slide">
            </div>
            <%--item--%>
            <div class="carousel-item">
                <img class="d-block w-100" src="img/slide3.jpeg" alt="Third slide">
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


<%--Conteudo--%>
<div class="container-fluid text-center" style="background-color: #ccf1ff">
    <div class="container">
        <div class="row p-5 align-middle mx-auto">
            <div class="col-xl-6 col-md-12 p-md-5 p-sm-5">
                <img class="img-fluid wow fadeInLeft" data-wow-delay="0s"
                     src="img/Como-montar-uma-loja-virtual-Criar-loja-online-502x300.png" alt="">
            </div>
            <div class="col-xl-6 col-md-12 p-md-5 p-sm-5">
                <h2 class="display-4 text-primary wow fadeInRight" data-wow-delay="1s">Sua loja online 100%
                    profissional</h2>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row p-3 align-middle mx-auto">
            <div class="col-xl-4 col-md-12">
                <div>
                    <h4 class="text-primary">Seus produtos organizados e com preço visível</h4>
                    <p class="lead">A Web Comércio oferece uma loja online pensada para otimizar todos os
                        passos de uma
                        compra. Os
                        seus clientes poderão visualizar as fotos dos produtos, descrições, preços e agregá-los ao
                        carrinho de compras.</p>
                </div>
            </div>
            <div class="col-xl-4 col-md-12">
                <div>
                    <h4 class="text-primary">Em qualquer tipo de tela</h4>
                    <p class="lead">A sua loja precisa estar disponível em qualquer dispositivo. Os
                        nossos layouts são
                        pensados para
                        atender às necessidades dos clientes e para serem visualizados em celulares, tablets e
                        computadores de mesa.</p>
                </div>
            </div>
            <div class="col-xl-4 col-md-12">
                <div>
                    <h4 class="text-primary">Com a cara da sua marca</h4>
                    <p class="lead">Todos os layouts são customizáveis e podem ser alterados para transmitam a imagem da
                        sua marca.
                        Os clientes logo perceberão que aquela é a sua loja online por ter uma identidade visual única e
                        marcante.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="jumbotron jumbotron-fluid align-content-center">
    <div class="container">
        <div class="row">
            <div class="col-xl-6 align-middle">
                <div class="container align-middle">
                    <h2 class="text-center">Dê a melhor experiência de compra para seus clientes</h2>
                </div>
            </div>
            <div class="col-xl-6">
                <img class="img-fluid" src="img/loja1.png" alt="">
            </div>
        </div>
    </div>
</div>

<%--Carrossel de Produtos--%>
<div class="container mb-4">
    <h2 class="text-center display-4">Produtos</h2>
    <div id="produtos" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="row">
                    <div class="col-sm-6 col-md-6 col-lg-3 mb-3">
                        <div class="card">
                            <img class="card-img-top" src="img/produto1/imac.jpeg" alt="Card image cap">
                            <div class="card-body text-center">
                                <h5 class="card-title">Imac</h5>
                                <a href="#"><i class="fas fa-plus"></i></a>
                                <a href="#" class="btn btn-primary" data-toggle="tooltip" data-placement="top"
                                   title="Tooltip on top"><i class="fas fa-shopping-cart"></i></a>
                                <a href="#"><i class="fas fa-minus"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-3 mb-3">
                        <div class="card">
                            <img class="card-img-top" src="img/produto1/iphone.jpeg" alt="Card image cap">
                            <div class="card-body text-center">
                                <h5 class="card-title">Imac</h5>
                                <a href="#"><i class="fas fa-plus"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-shopping-cart"></i></a>
                                <a href="#"><i class="fas fa-minus"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-3 mb-3">
                        <div class="card">
                            <img class="card-img-top" src="img/produto1/macbook1.jpeg" alt="Card image cap">
                            <div class="card-body text-center">
                                <h5 class="card-title">Imac</h5>
                                <a href="#"><i class="fas fa-plus"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-shopping-cart"></i></a>
                                <a href="#"><i class="fas fa-minus"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-3 mb-3">
                        <div class="card">
                            <img class="card-img-top" src="img/produto1/mackbook.jpeg" alt="Card image cap">
                            <div class="card-body text-center">
                                <h5 class="card-title">Imac</h5>
                                <a href="#"><i class="fas fa-plus"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-shopping-cart"></i></a>
                                <a href="#"><i class="fas fa-minus"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="row">
                    <div class="col-sm-6 col-md-6 col-lg-3 mb-3">
                        <div class="card">
                            <img class="card-img-top" src="img/produto1/imac.jpeg" alt="Card image cap">
                            <div class="card-body text-center">
                                <h5 class="card-title">IMac</h5>
                                <a href="#"><i class="fas fa-plus"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-shopping-cart"></i></a>
                                <a href="#"><i class="fas fa-minus"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-3 mb-3">
                        <div class="card">
                            <img class="card-img-top" src="img/produto1/iphone.jpeg" alt="Card image cap">
                            <div class="card-body text-center">
                                <h5 class="card-title">Iphone</h5>
                                <a href="#"><i class="fas fa-plus"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-shopping-cart"></i></a>
                                <a href="#"><i class="fas fa-minus"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-3 mb-3">
                        <div class="card">
                            <img class="card-img-top" src="img/produto1/macbook1.jpeg" alt="Card image cap">
                            <div class="card-body text-center">
                                <h5 class="card-title">Macbook</h5>
                                <a href="#"><i class="fas fa-plus"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-shopping-cart"></i></a>
                                <a href="#"><i class="fas fa-minus"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-3 mb-3">
                        <div class="card">
                            <img class="card-img-top" src="img/produto1/mackbook.jpeg" alt="Card image cap">
                            <div class="card-body text-center">
                                <h5 class="card-title">Macbook</h5>
                                <a href="#"><i class="fas fa-plus"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-shopping-cart"></i></a>
                                <a href="#"><i class="fas fa-minus"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="row">
                <div class="col-sm-6 col-md-6 col-lg-3 mb-3">
                    <div class="card">
                        <img class="card-img-top" src="img/produto1/imac.jpeg" alt="Card image cap">
                        <div class="card-body text-center">
                            <h5 class="card-title">IMac</h5>
                            <a href="#"><i class="fas fa-plus"></i></a>
                            <a href="#" class="btn btn-primary"><i class="fas fa-shopping-cart"></i></a>
                            <a href="#"><i class="fas fa-minus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-3 mb-3">
                    <div class="card">
                        <img class="card-img-top" src="img/produto1/iphone.jpeg" alt="Card image cap">
                        <div class="card-body text-center">
                            <h5 class="card-title">Iphone</h5>
                            <a href="#"><i class="fas fa-plus"></i></a>
                            <a href="#" class="btn btn-primary"><i class="fas fa-shopping-cart"></i></a>
                            <a href="#"><i class="fas fa-minus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-3 mb-3">
                    <div class="card">
                        <img class="card-img-top" src="img/produto1/macbook1.jpeg" alt="Card image cap">
                        <div class="card-header">
                            <h5 class="card-title">Macbook</h5>
                            <h4 class="card-text">Preço</h4>
                            <h4 class="card-text">R$ 3.000,00</h4>
                        </div>
                        <div class="card-body text-center">
                            <a href="#"><i class="fas fa-plus"></i></a>
                            <a href="#" class="btn btn-primary"><i class="fas fa-shopping-cart"></i></a>
                            <a href="#"><i class="fas fa-minus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-3 mb-3">
                    <div class="card">
                        <img class="card-img-top" src="img/produto1/mackbook.jpeg" alt="Card image cap">
                        <div class="card-body text-center">
                            <h5 class="card-title">Macbook</h5>
                            <a href="#"><i class="fas fa-plus"></i></a>
                            <a href="#" class="btn btn-primary"><i class="fas fa-shopping-cart"></i></a>
                            <a href="#"><i class="fas fa-minus"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--<a class="carousel-control-prev" href="#produtos" role="button" data-slide="prev">--%>
    <%--<span class="carousel-control-prev-icon" aria-hidden="true"></span>--%>
    <%--</a>--%>
    <%--<a class="carousel-control-next" href="#produtos" role="button" data-slide="next">--%>
    <%--<span class="carousel-control-next-icon" aria-hidden="true"></span>--%>
    <%--</a>--%>
</div>


<!--Footer-->
<footer class="text-dark pt-4 mt-4">

    <!--Footer Links-->
    <div class="container-fluid text-center text-md-left">
        <div class="row">

            <!--First column-->
            <div class="col-md-6">
                <h5 class="text-uppercase">Footer Content</h5>
                <p>Here you can use rows and columns here to organize your footer content.</p>
            </div>
            <!--/.First column-->

            <!--Second column-->
            <div class="col-md-6">
                <h5 class="text-uppercase">Links</h5>
                <ul class="">
                    <li>
                        <a href="#!">Link 1</a>
                    </li>
                    <li>
                        <a href="#!">Link 2</a>
                    </li>
                    <li>
                        <a href="#!">Link 3</a>
                    </li>
                    <li>
                        <a href="#!">Link 4</a>
                    </li>
                </ul>
            </div>
            <!--/.Second column-->
        </div>
    </div>
    <!--/.Footer Links-->

    <!--Copyright-->
    <div class="text-center text-dark">
        <p class="text-dark">© 2018 Copyright:</p>
        <a class="text-light" href="index.jsp"> WebComércio.com </a>
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