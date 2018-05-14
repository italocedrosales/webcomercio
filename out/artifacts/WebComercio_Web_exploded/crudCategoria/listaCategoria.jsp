<%@ page import="br.edu.ifs.dao.CategoriaDAO" %>
<%@ page import="br.edu.ifs.model.Categoria" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <form action="cadastraCategoria.jsp" method="get">
        <table class="table table-hover table-striped text-center">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th colspan="2">Opções</th>
            </tr>
            </thead>
            <tbody>
            <%
                CategoriaDAO dao = new CategoriaDAO();
                List<Categoria> categorias = dao.getListaCategoria();

                for (Categoria categoria : categorias) {
            %>
            <tr>
                <td><%=categoria.getIdCategoria()%>
                </td>
                <td><%=categoria.getNome()%>
                </td>
                <td><a href="alteraCategoria.jsp?idCategoria=<%=categoria.getIdCategoria()%>">Alterar</a></td>
                <td><a href="excluiCategoria.jsp?idCategoria=<%=categoria.getIdCategoria()%>">Excluir</a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <input class="btn btn-primary" type="submit" value="Nova Categoria">
    </form>
</div>
</body>
</html>
