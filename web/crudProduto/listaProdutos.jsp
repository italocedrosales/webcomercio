<%@ page import="br.edu.ifs.dao.ProdutoDAO" %>
<%@ page import="br.edu.ifs.model.Produto" %>
<%@ page import="br.edu.ifs.util.FormataMoeda" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Produtos</title>
    <%@include file="../include/bootstrap.jsp" %>

    <script type="text/javascript">
        function id(el) {
            return document.getElementById(el);
        }

        function menos(id_qnt) {
            var qnt = parseInt(id(id_qnt).value);
            if (qnt > 0)
                id(id_qnt).value = qnt - 1;
        }

        function mais(id_qnt) {
            id(id_qnt).value = parseInt(id(id_qnt).value) + 1;
        }
    </script>

</head>
<body>
<%@include file="../include/cabecalho.jsp" %>
<%--Conteudo--%>
<%--<nav class="container-fluid pt-2" aria-label="breadcrumb">--%>
<%--<ol class="breadcrumb" style="background: transparent">--%>
<%--<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>--%>
<%--<li class="breadcrumb-item"><a href="../publica/sobre.jsp">Sobre</a></li>--%>
<%--<li class="breadcrumb-item active" aria-current="page">Produtos</li>--%>
<%--</ol>--%>
<%--</nav>--%>


<div class="container-fluid">
    <hr class="hr">
    <h1 class="text-info text-center h1">Produtos</h1>
    <hr class="hr">
    <div class="container">
        <div class="row">
            <%
                ProdutoDAO dao = new ProdutoDAO();
                List<Produto> produtos = dao.getListaProduto();
                int i = 0;
                for (Produto produto : produtos) {
                    i++;
            %>
            <div class="col-md-3 mt-1 produto-grid">
                <div class="imagem">

                    <a href="produtoDetalhes.jsp?idProduto=<%=produto.getIdProduto()%>">
                        <img style="width: 100px; height: 200px" class="w-100 rounded img-fluid"
                             src="<%="../" + produto.getPathFoto()%>">
                        <div class="overlay">
                            <div class="detalhes">Detalhes</div>
                        </div>
                    </a>

                </div>
                <h5 class="text-center text-info mt-3"><%=produto.getNome()%>
                </h5>
                <h5 class="text-center"><%=FormataMoeda.toString(produto.getValor())%>
                </h5>

                <form action="../carrinho" method="get">
                    <input type="hidden" name="idProduto" value="<%=produto.getIdProduto()%>">

                    <div class="container-fluid align-content-center">
                        <div class="row">
                            <div class="col-lg-3"></div>
                            <div class="col-lg-7">
                                <input type="button" value="-" onclick="menos( 'quantidade<%=i%>' )">
                                <input type="text" name="quantidade" id="quantidade<%=i%>" value="1" size="1"
                                       readonly="readonly">
                                <input type="button" value="+" onclick="mais( 'quantidade<%=i%>' )">
                            </div>
                            <div class="col-lg-2"></div>
                        </div>
                    </div>
                    <input type="submit" class="btn btn-success mt-3 ml-5" value="Add ao Carrinho">
                </form>
            </div>
            <%}%>
        </div>
    </div>
</div>

<%@include file="../include/rodape.jsp" %>


</body>
</html>
