<%@ page import="br.edu.ifs.dao.CategoriaDAO" %>
<%@ page import="br.edu.ifs.model.Categoria" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
<h1 class="text-center text-info">Exclui Categoria</h1>
<hr class="my-4">
<%
    int id = Integer.parseInt(request.getParameter("idCategoria"));
    CategoriaDAO dao = new CategoriaDAO();
    Categoria categoria = dao.getCategoria(id);
%>
<div class="container" style="width: 500px">
    <form action="../exclui_categoria" method="get">
        <input type="hidden" name="idCategoria" value="<%=categoria.getIdCategoria()%>">
        <div class="form-group">
            <label for="nome">Nome:</label>
            <input disabled="disabled" class="form-control" type="text" id="nome" name="nome" value="<%=categoria.getNome()%>">
        </div>
        <input class="btn btn-primary" type="submit" value="Excluir">
        <input class="btn btn-danger" type="button" value="Cancelar"
               onclick="window.location.assign('listaCategoria.jsp')">
    </form>
</div>
</body>
</html>
