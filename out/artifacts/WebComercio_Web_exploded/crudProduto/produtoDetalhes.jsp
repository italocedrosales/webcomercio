<%@ page import="br.edu.ifs.dao.ProdutoDAO" %>
<%@ page import="br.edu.ifs.model.Produto" %>
<%@ page import="br.edu.ifs.util.FormataMoeda" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Detalhes do Produto</title>
    <%@include file="../include/bootstrap.jsp" %>
</head>
<body>
<%@include file="../include/cabecalho.jsp" %>

<%
    int idProduto = Integer.parseInt(request.getParameter("idProduto"));
    ProdutoDAO dao = new ProdutoDAO();
    Produto produto = dao.getProduto(idProduto);
%>

<div class="container-fluid">
    <form action="../carrinho" method="get">
        <div class="row">
            <hr class="hr">
            <h1 class="h1 text-info text-center mt-4 mb-5">Descrição do Produto</h1>
            <hr class="hr">
        </div>
        <div class="row">
            <div class="col-lg-7">
                <div class="container">
                    <img class="img-fluid ml-5" width="600" height="400px" src="<%="../" + produto.getPathFoto()%>"
                         alt="<%=produto.getNome()%>">
                </div>
            </div>
            <div class="col-lg-5">
                <h3 class="pb-2"><%=produto.getNome()%>
                </h3>
                <h2 class="pb-2"><%=FormataMoeda.toString(produto.getValor())%>
                </h2>
                <hr class="hr">
                <h4>Descrição Geral</h4>
                <hr class="hr pb-3">
                <h5 class="pb-5"><%=produto.getDescricao()%>
                </h5>
                <button class="btn btn-outline-success btn-lg" type="submit">Add ao Carrinho <i class="fa fa-cart-plus "></i></button>
            </div>
        </div>
    </form>
</div>


<%@include file="../include/rodape.jsp" %>
</body>
</html>