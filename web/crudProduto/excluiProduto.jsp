<%@ page import="br.edu.ifs.dao.ProdutoDAO" %>
<%@ page import="br.edu.ifs.model.Produto" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Excluir Produto</title>
    <%@include file="../include/bootstrap.jsp"%>
</head>
<body>
<%@include file="../include/cabecalho.jsp"%>

<%--Formulário--%>
<div class="container-fluid">
    <h1 class="text-info text-center m-5">Excluir Produto</h1>

    <form action="../exclui_produto" method="get" enctype="multipart/form-data">
        <%
            int idProduto = Integer.parseInt(request.getParameter("idProduto"));
            ProdutoDAO dao = new ProdutoDAO();
            Produto produto = dao.getProduto(idProduto);
        %>

        <input type="hidden" name="idProduto" value="<%=produto.getIdProduto()%>">

        <div class="container-fluid">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <img src="<%="../" + produto.getPathFoto()%>" alt="Foto" class="img-fluid rounded pt-4">
                    </div>
                    <div class="col-lg-6">

                        <div class="form-group">
                            <label for="cod">Código de Barra:</label>
                            <input class="form-control" type="text" name="cod" id="cod"
                                   value="<%=produto.getCodigoBarra()%>" disabled>
                        </div>
                        <div class="form-group">
                            <label for="nome">Nome:</label>
                            <input class="form-control" type="text" name="nome" id="nome" value="<%=produto.getNome()%>"
                                   disabled>
                        </div>
                        <div class="form-group">
                            <label for="descricao">Descição:</label>
                            <input class="form-control" type="text" name="descricao" id="descricao"
                                   value="<%=produto.getDescricao()%>" disabled>
                        </div>
                        <div class="form-group">
                            <label for="marca">Marca:</label>
                            <input class="form-control" type="text" name="marca" id="marca"
                                   value="<%=produto.getMarca()%>" disabled>
                        </div>
                        <div class="form-group">
                            <label for="valor">Valor:</label>
                            <input class="form-control" type="text" name="valor" id="valor"
                                   value="<%=produto.getValor()%>" disabled>
                        </div>
                        <div class="form-group">
                            <label for="modelo">Modelo:</label>
                            <input class="form-control" type="text" name="modelo" id="modelo"
                                   value="<%=produto.getModelo()%>" disabled>
                        </div>
                        <div class="form-group">
                            <label for="cat">Categoria:</label>
                            <select class="form-control" id="cat" name="categoria" disabled>

                                <option value=""><%=produto.getIdCategoria()%>
                                </option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary" value="Excluir">
                            <a class="btn btn-danger" href="../publica/perfil.jsp">Cancelar</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<%@include file="../include/rodape.jsp"%>
</body>
</html>
