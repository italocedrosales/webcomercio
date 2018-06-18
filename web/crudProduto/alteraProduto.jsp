<%@ page import="br.edu.ifs.dao.ProdutoDAO" %>
<%@ page import="br.edu.ifs.model.Produto" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Alterar Produto</title>
    <%@include file="../include/bootstrap.jsp"%>
</head>
<body>
<%@include file="../include/cabecalho.jsp"%>
<%--Formulário--%>
<div class="container-fluid">
    <h1 class="text-info text-center m-5">Alterar Produto</h1>

    <%
        int idProduto = Integer.parseInt(request.getParameter("idProduto"));
        ProdutoDAO dao = new ProdutoDAO();
        Produto produto = dao.getProduto(idProduto);
    %>
    <form action="../altera_produto" method="post" enctype="multipart/form-data">

        <input type="hidden" name="idProduto" value="<%=produto.getIdProduto()%>">

        <div class="container-fluid">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <img src="<%="../" + produto.getPathFoto()%>" alt="Foto" class="img-fluid rounded pt-4">
                    </div>

                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="foto">Foto:</label>
                            <input type="file" class="form-control-file" name="foto" id="foto">
                        </div>

                        <div class="form-group">
                            <label for="cod">Código de Barra:</label>
                            <input class="form-control" type="text" name="cod" id="cod" value="<%=produto.getCodigoBarra()%>">
                        </div>

                        <div class="form-group">
                            <label for="nome">Nome:</label>
                            <input class="form-control" type="text" name="nome" id="nome" value="<%=produto.getNome()%>">
                        </div>

                        <div class="form-group">
                            <label for="descricao">Descição:</label>
                            <input class="form-control" type="text" name="descricao" id="descricao" value="<%=produto.getDescricao()%>">
                        </div>

                        <div class="form-group">
                            <label for="marca">Marca:</label>
                            <input class="form-control" type="text" name="marca" id="marca" value="<%=produto.getMarca()%>">
                        </div>

                        <div class="form-group">
                            <label for="valor">Valor:</label>
                            <input class="form-control" type="text" name="valor" id="valor" value="<%=produto.getValor()%>">
                        </div>

                        <div class="form-group">
                            <label for="modelo">Modelo:</label>
                            <input class="form-control" type="text" name="modelo" id="modelo" value="<%=produto.getModelo()%>">
                        </div>

                        <div class="form-group">
                            <label for="cat">Categoria:</label>
                            <select class="form-control" id="cat" name="categoria">
                                <%
                                    CategoriaDAO cat = new CategoriaDAO();
                                    List<Categoria> categorias1 = cat.getListaCategoria();
                                    for (Categoria categoria : categorias1) {
                                %>
                                <option value="<%=categoria.getIdCategoria()%>"><%=categoria.getNome()%></option>
                                <%}%>
                            </select>
                        </div>

                        <%--Botões--%>
                        <input type="submit" class="btn btn-primary" value="Alterar">
                        <a class="btn btn-danger" href="../publica/perfil.jsp">Cancelar</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<%@include file="../include/rodape.jsp"%>
</body>
</html>
