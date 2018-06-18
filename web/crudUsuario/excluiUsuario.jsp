<%@ page import="br.edu.ifs.model.Usuario" %>
<%@ page import="br.edu.ifs.dao.UsuarioDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="../include/bootstrap.jsp" %>
</head>
<body>
<%@include file="../include/cabecalho.jsp" %>
<div class="container-fluid">
    <hr>
    <h1 class="text-center text-info">Excluir Usuário</h1>
    <hr>

    <%
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = dao.getUsuario(idUsuario);
    %>

    <div class="row">
        <div class="col-lg-3">
            <img class="img-fluid rounded" src="<%="../" + usuario.getPathFoto()%>" alt="fotoUsuario">
        </div>
        <div class="col-lg-9">
            <div class="container mx-auto" style="width: 500px">

                <%--Formulario--%>
                <form action="../exclui_usuario" method="get">
                    <%--id--%>

                    <input type="hidden" name="idUsuario" value="<%=usuario.getIdUsuario()%>">

                    <%--cpfcnpj--%>
                    <div class="form-group">
                        <label for="cpfcnpj">CPF/CNPJ:</label>
                        <input disabled="disabled" class="form-control" type="text" id="cpfcnpj" name="cpfcnpj"
                               maxlength="14"
                               value="<%=usuario.getCpfCnpj()%>">
                    </div>
                    <%--Nome--%>
                    <div class="form-group">
                        <label for="nome">Nome:</label>
                        <input class="form-control" type="text" id="nome" name="nome" value="<%=usuario.getNome()%>"
                               disabled>
                    </div>
                    <%--Rua--%>
                    <div class="form-group">
                        <label for="rua">Rua:</label>
                        <input class="form-control" type="text" id="rua" name="rua" value="<%=usuario.getRua()%>"
                               disabled>
                    </div>
                    <%--Número--%>
                    <div class="form-group">
                        <label for="numero">Número:</label>
                        <input class="form-control" type="text" id="numero" name="numero"
                               value="<%=usuario.getNumero()%>"
                               disabled>
                    </div>
                    <%--Cidade--%>
                    <div class="form-group">
                        <label for="cidade">Cidade:</label>
                        <input class="form-control" type="text" id="cidade" name="cidade"
                               value="<%=usuario.getCidade()%>"
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

                    <%--Botões--%>
                    <input class="btn btn-primary" type="submit" value="Excluir">
                    <input class="btn btn-danger" type="button" value="Cancelar"
                           onclick="window.location.assign('listaUsuario.jsp')">
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="../include/rodape.jsp" %>
</body>
</html>
