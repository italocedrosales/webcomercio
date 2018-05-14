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
<h1>Altera Categoria</h1>
<hr>
<h2>Formulário</h2>
<%
    int id = Integer.parseInt(request.getParameter("idCategoria"));
    CategoriaDAO dao = new CategoriaDAO();
    Categoria categoria = dao.getCategoria(id);
%>
<form action="../altera_categoria" method="get">
    <input type="hidden" name="idCategoria" value="<%=categoria.getIdCategoria()%>">
    <div class="form-group">
        <label for="nome">Nome:</label>
        <input class="form-control" id="nome" type="text" name="nome" value="<%=categoria.getNome()%>">
    </div>
    <input class="btn btn-primary" type="submit" value="Gravar">
</form>

</body>
</html>
