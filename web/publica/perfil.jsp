<%@ page import="br.edu.ifs.model.Usuario" %>
<%@ page import="br.edu.ifs.dao.ProdutoDAO" %>
<%@ page import="br.edu.ifs.model.Produto" %>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.ifs.dao.CategoriaDAO" %>
<%@ page import="br.edu.ifs.model.Categoria" %>
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
                <li class="nav-item"><a class="nav-link" href="">Serviços</a></li>
                <li class="nav-item"><a class="nav-link" href="../crudProduto/listaProdutos.jsp">Produtos</a></li>

                <%--Dropdown--%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="categoria" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Categoria</a>

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

<%--Conteudo--%>
<div class="container-fluid">
    <h1 class="text-info text-center h1 m-4">Área do Logista</h1>
    <hr>
    <div class="row container">
        <div class="col-lg-5">
            <div class="row">
                <div class="col-lg-4">
                    <% if (usuario != null) {%>

                    <img class="img-fluid rounded m-2" src="<%="../"+ usuario.getPathFoto()%>" alt="foto usuario">
                </div>
                <div class="col-lg-8 text-left">
                    <h4 class="">Olá <%=usuario.getNome()%></h4>
                    <h3 class="">Seja bem vindo!</h3>
                </div>
                <%}%>
            </div>
        </div>
        <div class="col-lg-6 text-center">
            <h4>O que voçê deseja fazer?</h4>
            <a class="btn btn-primary" href="../crudProduto/cadastraProduto.jsp"><i class="fas fa-plus"></i> Novo Produto</a>
            <a class="btn btn-warning" href="../crudCategoria/cadastraCategoria.jsp"><i class="fas fa-plus"></i> Nova Categoria</a>
            <a  href="../crudUsuario/alteraUsuario.jsp?idUsuario=<%= usuario.getIdUsuario()%>"
                class="btn btn-success"><i class="fas fa-cogs"></i> Editar Perfil</a>
            <a href="../autentica_usuario" class="btn btn-danger">Sair</a>
        </div>
    </div>
    <hr>
    <div class="row container mx-lg-auto">
        <div class="container col-lg-3">
            <div class="table-responsive-md">
                <table class="table table-hover text-center">
                    <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th colspan="2">Opções</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        CategoriaDAO daoCat = new CategoriaDAO();
                        List<Categoria> Categorias = daoCat.getListaCategoria();
                        for (Categoria categoria : categorias) {
                    %>
                    <tr>
                        <td><%=categoria.getIdCategoria()%>
                        </td>
                        <td><%=categoria.getNome()%>
                        </td>

                        <td><a href="../crudCategoria/alteraCategoria.jsp?idCategoria=<%= categoria.getIdCategoria()%>"><i class="fas fa-edit"></i></a></td>
                        <td><a href="../crudCategoria/excluiCategoria.jsp?idCategoria=<%= categoria.getIdCategoria()%>"><i class="fas fa-times"></i></a></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="container col-lg-9">
            <div class="table-responsive-md">
                <form action="../cadastra_produto" method="get">
                    <table class="table table-hover text-center">
                        <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Foto</th>
                            <th>Código/Barra</th>
                            <th>Nome</th>
                            <th>Descrição</th>
                            <th>Marca</th>
                            <th>Valor</th>
                            <th>Modelo</th>
                            <th>Categoria</th>
                            <th colspan="2">Opções</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            ProdutoDAO dao = new ProdutoDAO();
                            List<Produto> produtos = dao.getListaProduto();
                            for (Produto produto : produtos) {
                        %>
                        <tr>
                            <td><%=produto.getIdProduto()%>
                            </td>
                            <td><img class="img-fluid rounded" src="<%="../"+produto.getPathFoto()%>" alt="fotoProduto"
                                     width="50px" height="50">
                            </td>
                            <td><%=produto.getCodigoBarra()%>
                            </td>
                            <td><%=produto.getNome()%>
                            </td>
                            <td><%=produto.getDescricao()%>
                            </td>
                            <td><%=produto.getMarca()%>
                            </td>
                            <td><%=produto.getValor()%>
                            </td>
                            <td><%=produto.getModelo()%>
                            </td>
                            <td><%=produto.getIdCategoria()%>
                            </td>
                            <td><a href="../crudProduto/alteraProduto.jsp?idProduto=<%= produto.getIdProduto()%>"><i
                                    class="fas fa-edit"></i></a></td>
                            <td><a href="../crudProduto/excluiProduto.jsp?idProduto=<%= produto.getIdProduto()%>"><i
                                    class="fas fa-times"></i></a></td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
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
                <h5 class="">Redes Sociais</h5>
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
        <p class="text-light">© 2018 Copyright:<a class="text-light" href="../index.jsp"> WebComércio.com </a></p>
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