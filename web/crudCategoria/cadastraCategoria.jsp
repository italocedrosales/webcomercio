<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Categoria</title>
    <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="container ">
        <h1>Categoria</h1>
        <a class="" href="../index.jsp">Home</a>
        <hr>
        <h2>Formulário</h2>
        <form action="../cadastra_categoria" method="post">
            <div class="form-group">
                <label for="nome">Nome da Categoria:</label>
                <input class="form-control" type="text" id="nome" name="nome">
            </div>

            <input class="btn btn-primary" type="submit" value="Gravar">
        </form>
    </div>
</div>
</body>
</html>
