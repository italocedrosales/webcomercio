<%@ page import="br.edu.ifs.dao.ProdutoDAO" %>
<%@ page import="br.edu.ifs.model.Produto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="br.edu.ifs.util.FormataMoeda" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Carrinho</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="../include/bootstrap.jsp" %>
</head>
<body>
<%@include file="../include/cabecalho.jsp" %>

<%
    if (request.getSession().getAttribute("msg") != null) {
%>
<div class="alert alert-info"><%= request.getSession().getAttribute("msg")  %>
</div>
<%
        request.getSession().setAttribute("msg", null);
    }
%>

<%--Conteudo--%>
<div class="container table table-hover table-sm table-responsive">
    <hr class="hr">
    <h1 class="text-center text-info">Meu Carrinho</h1>
    <table class="table" id="tabela">
        <thead>
        <tr>
            <th scope="col">Foto</th>
            <th scope="col">Nome</th>
            <th scope="col">Modelo</th>
            <th scope="col">Preço</th>
            <th scope="col">Quantidade</th>
            <th scope="col">SubTotal</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>

            <%
                ProdutoDAO dao = new ProdutoDAO();
                List<Produto> produtos = (ArrayList<Produto>) request.getSession().getAttribute("carrinho");
                if (produtos == null) {
                    produtos = new ArrayList<Produto>();
                }
                for (Produto produto : produtos) {
            %>

            <td><img class="img-fluid" src="<%="../" + produto.getPathFoto()%>" width="50px" height="50px"></td>

            <td><%=produto.getNome()%>
            </td>

            <td><%=produto.getModelo()%>
            </td>

            <td><%=FormataMoeda.toString(produto.getValor())%>
            </td>

            <td><input type="text" size="1" value="<%=produto.getQuantidade()%>"></td>


            <td><%=FormataMoeda.toString(produto.getQuantidade() * produto.getValor())%>
            </td>

            <td>
                <button onclick="window.location.href='../removeproduto?idProduto=<%=produto.getIdProduto()%>'"
                        type="button" class="btn btn-outline-secondary">Remover
                </button>
            </td>

            <%

                float totalPedido = (produto.getQuantidade() * produto.getValor());


            %>
        </tr>

        <%
            }
        %>
        </tbody>
    </table>

    <div class="row">
        <div class="col-sm-8">

        </div>

        <div class="col-sm-4">
            <%--<h5 class="mt-4"> Total do pedido:  <%=FormataMoeda.toString()%></h5>--%>
            <br><br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="submit" class="btn btn-outline-secondary">Finalizar Pedido</button>

        </div>
    </div>

<%@include file="../include/rodape.jsp" %>
</body>
</html>
