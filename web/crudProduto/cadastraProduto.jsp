<%@ page import="br.edu.ifs.model.Usuario" %>
<%@ page import="br.edu.ifs.dao.CategoriaDAO" %>
<%@ page import="br.edu.ifs.model.Categoria" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Cadastra Produto</title>
    <%@include file="../include/bootstrap.jsp"%>
</head>
<body>
<%@include file="../include/cabecalho.jsp"%>
<%--Formulário--%>
<div class="container-fluid">
    <h1 class="text-info text-center">Cadastra Produto</h1>

    <div class="container mx-lg-auto" style="width: 600px">

        <form action="../cadastra_produto" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="foto">Foto:</label>
                <input type="file" class="form-control-file" name="foto" id="foto">
            </div>

            <div class="form-group">
                <label for="cod">Código de Barra:</label>
                <input class="form-control" type="text" name="cod" id="cod">
            </div>

            <div class="form-group">
                <label for="nome">Nome:</label>
                <input class="form-control" type="text" name="nome" id="nome">
            </div>

            <div class="form-group">
                <label for="descricao">Descição:</label>
                <textarea class="form-control" type="text" name="descricao" id="descricao"></textarea>
            </div>

            <div class="form-group">
                <label for="marca">Marca:</label>
                <input class="form-control" type="text" name="marca" id="marca">
            </div>

            <div class="form-group">
                <label for="valor">Valor:</label>
                <input class="form-control" type="text" name="valor" id="valor">
            </div>

            <div class="form-group">
                <label for="modelo">Modelo:</label>
                <input class="form-control" type="text" name="modelo" id="modelo">
            </div>

            <div class="form-group">
                <label for="categoria">Categoria:</label>
                <select class="form-control" id="categoria" name="categoria">
                    <option value="">Selecione uma Categoria</option>
                    <%
                        CategoriaDAO catdao = new CategoriaDAO();
                        List<Categoria> categorias1 = catdao.getListaCategoria();
                        for (Categoria categoria : categorias1) {
                    %>
                    <option value="<%=categoria.getIdCategoria()%>"><%=categoria.getNome()%>
                    </option>
                    <%}%>
                </select>
            </div>

            <%--Botões--%>
            <input type="submit" class="btn btn-primary" value="Cadastrar">
            <a class="btn btn-danger" href="../publica/perfil.jsp">Cancelar</a>
        </form>
    </div>
</div>

<%@include file="../include/rodape.jsp"%>
</body>
</html>
