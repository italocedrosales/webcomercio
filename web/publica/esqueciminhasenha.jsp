<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Esqueci Minha Senha</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../node_modules/css/animate.css">
    <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../node_modules/fontawesome-free-5.0.10/web-fonts-with-css/css/fontawesome-all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
          integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <div class="container">
        <div class="row mt-5">
            <div class="col-lg-3 col-md-2 col-sm-0"></div>
            <div class="col-lg-6 col-md-8 col-sm-12 mt-5">
                <h1 class="text-center mb-5"><img class="img-fluid" src="../img/logo2.png" alt="logo" width="50px">Web Comércio</h1>

                <h3 class="text-center mb-3">Esqueceu sua senha?</h3>

                <p class="text-center">Coloque seu Email e dentro de instantes te enviaremos os dados para trocar de senha.</p>
                <div class="container" style="display: none">
                   <p class="alert alert-danger">${msg}</p>
                </div>

                <div class="m-3">
                    <form action="../esqueci_minha_senha" method="post">
                        <div class="form-group">
                            <label for="email">E-mail:</label>
                            <input class="form-control form-control-lg" type="email" name="email" id="email" required>
                        </div>
                        <input class="btn btn-info btn-block btn-lg" type="submit" value="Enviar">
                    </form>
                </div>
            </div>
            <div class="col-lg-3 col-md-2 col-sm-0"></div>

        </div>
    </div>
</div>
</body>
</html>
