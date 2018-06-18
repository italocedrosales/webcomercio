<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Sobre</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="../include/bootstrap.jsp" %>
</head>
<body>
<%@include file="../include/cabecalho.jsp" %>
<div class="container-fluid text-center">
    <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <h1 class="display-4 m-5">O que é?</h1>

            <h3 class="mt-5" style="font-family: 'Montserrat', sans-serif;">O Web Comércio é uma plataforma pronta para você criar
                sua loja na internet de forma rápida e fácil.</h3>
        </div>
        <div class="col-lg-2"></div>
    </div>
</div>

<img class="img-fluid m-0" src="../img/compras.jpg" alt="" width="100%">

<div class="container-fluid text-center pt-5 pb-4">
    <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <h1 class="m-5" style="font-family: 'Montserrat', sans-serif;">Você monta a loja e expõe os produtos do seu jeito:</h1>


            <img class="img-fluid" src="../img/loja.png" alt="">
        </div>
        <div class="col-lg-2"></div>
    </div>
    <div class="row mt-5 mb-4">
        <div class="col-lg-4 container">
            <h4 class="m-4">Página dos Produtos</h4>
            <img class="img-fluid" src="../img/paginadosprodutos.png" alt="">
        </div>
        <div class="col-lg-4 container">
            <h4 class="m-4">Detalhes do Produto</h4>
            <img class="img-fluid" src="../img/detalhes.png" alt="">
        </div>
        <div class="col-lg-4 container">
            <h4 class="m-4">Seu Carrinho</h4>
            <img class="img-fluid" src="../img/carrinho.png" alt="">
        </div>
    </div>
</div>

<%@include file="../include/rodape.jsp" %>
</body>
</html>
