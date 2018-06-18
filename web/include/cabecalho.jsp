<%@ page import="br.edu.ifs.model.Usuario" %>
<%@ page import="br.edu.ifs.dao.CategoriaDAO" %>
<%@ page import="br.edu.ifs.model.Categoria" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Usuario usuAut = (Usuario)
            request.getSession().getAttribute("usuarioAutenticado");
    if (usuAut != null) {
%>

<div class="container-fluid bg-info d-none d-md-block d-block d-sm-none">
    <div class="row text-light text-center">
        <div class="col-md-4 col-lg-5 pt-3"><i class="fa fa-envelope" aria-hidden="true"></i> <%=usuAut.getEmail()%>
        </div>
        <div class="col-lg-2"></div>
        <div class="col-md-4 col-lg-3"><i class="fa fa-user" aria-hidden="true"></i> <%=usuAut.getNome()%>
            <img class="img-fluid rounded-circle m-2" src="<%="../"+usuAut.getPathFoto()%>"
                 alt="foto usuario" style="width: 35px; height: 35px">
            <a class="links text-light" href="../autentica_usuario">Sair</a>
        </div>
        <div class="col-md-4 col-lg-2">
            <div class="mt-3">
                <a class="links text-light" href="../carrinho/carrinho.jsp"><i class="fa fa-cart-plus"
                                                                            aria-hidden="true"></i> Meu Carrinho</a>
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
                <li class="nav-item"><a class="nav-link" href="../publica/sobre.jsp">Sobre</a></li>
                <li class="nav-item"><a class="nav-link" href="../publica/contato.jsp">Contato</a></li>
                <li class="nav-item"><a class="nav-link" href="../crudProduto/listaProdutos.jsp">Produtos</a></li>

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
                        <a class="dropdown-item" href="#"><%=categoria.getNome()%>
                        </a>
                        <%}%>
                    </div>
                </li>

                <%--seção--%>
                <% if (usuAut != null) {%>
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
