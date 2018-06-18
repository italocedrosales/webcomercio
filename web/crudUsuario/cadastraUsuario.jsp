<%@ page import="br.edu.ifs.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Formulário</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../node_modules/fontawesome-free-5.0.10/web-fonts-with-css/css/fontawesome-all.css">
    <link rel="stylesheet" href="../node_modules/css/index.css">
</head>

<body>

<%--Navegação--%>
<nav class="navbar navbar-expand-md navbar-dark sticky-top p-0" style="background-color: rgba(0,0,0,0.7)">
    <div class="container p-2">
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
                <li class="nav-item"><a class="nav-link" href="../publica/sobre.jsp">Sobre</a></li>
                <li class="nav-item"><a class="nav-link" href="../crudProduto/listaProdutos.jsp">Produtos</a></li>
                <li class="nav-item"><a class="nav-link" href="../publica/contato.jsp">Contato</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <hr class="hr">
    <h1 class="text-center text-info">Formulário de Cadastro</h1>
    <hr class="hr">
    <div class="container mx-auto" style="width: 500px">
        <form action="../cadastra_usuario" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="cpfcnpj">CPF/CNPJ:</label>
                <input class="form-control" type="text" id="cpfcnpj" name="cpfcnpj" maxlength="14">
            </div>
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input class="form-control" type="text" id="nome" name="nome">
            </div>
            <div class="form-group">
                <label for="rua">Rua:</label>
                <input class="form-control" type="text" id="rua" name="rua">
            </div>
            <div class="form-group">
                <label for="numero">Número:</label>
                <input class="form-control" type="text" id="numero" name="numero">
            </div>
            <div class="form-group">
                <label for="cidade">Cidade:</label>
                <input class="form-control" type="text" id="cidade" name="cidade">
            </div>
            <div class="form-group">
                <label for="estado">Estado:</label>
                <select class="form-control" id="estado" name="estado">
                    <option value="AC">Acre</option>
                    <option value="AL">Alagoas</option>
                    <option value="AP">Amapá</option>
                    <option value="AM">Amazonas</option>
                    <option value="BA">Bahia</option>
                    <option value="CE">Ceará</option>
                    <option value="DF">Distrito Federal</option>
                    <option value="ES">Espírito Santo</option>
                    <option value="GO">Goiás</option>
                    <option value="MA">Maranhão</option>
                    <option value="MT">Mato Grosso</option>
                    <option value="MS">Mato Grosso do Sul</option>
                    <option value="MG">Minas Gerais</option>
                    <option value="PA">Pará</option>
                    <option value="PB">Paraíba</option>
                    <option value="PR">Paraná</option>
                    <option value="PE">Pernambuco</option>
                    <option value="PI">Piauí</option>
                    <option value="RJ">Rio de Janeiro</option>
                    <option value="RN">Rio Grande do Norte</option>
                    <option value="RS">Rio Grande do Sul</option>
                    <option value="RO">Rondônia</option>
                    <option value="RR">Roraima</option>
                    <option value="SC">Santa Catarina</option>
                    <option value="SP">São Paulo</option>
                    <option value="SE">Sergipe</option>
                    <option value="TO">Tocantins</option>
                </select>
            </div>
            <div class="form-group">
                <label for="telefone">Telefone:</label>
                <input class="form-control" type="text" id="telefone" name="telefone">
            </div>
            <div class="form-group">
                <label for="email">E-mail:</label>
                <input class="form-control" type="email" id="email" name="email">
            </div>
            <div class="form-group">
                <label for="tipoUsuario">Tipo de Usuario:</label>
                <select class="form-control" id="tipoUsuario" name="tipoUsuario">
                    <option value="1">1°- Cliente</option>
                    <option value="2">2°- Empresa</option>
                    <option value="3">Admin</option>
                </select>
            </div>
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input class="form-control" type="password" id="senha" name="senha">
            </div>
            <div class="form-group">
                <label for="foto">Foto:</label>
                <input type="file" class="form-control-file" id="foto" name="file">
            </div>
            <input class="btn btn-primary" type="submit" value="Gravar">
        </form>
    </div>
</div>

<div class="container-fluid mb-0 mt-3" style="background: linear-gradient(45deg, #1675ff, #3bbeff)">
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
<script src="../node_modules/popper.js/dist/popper.min.js"></script>
<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
