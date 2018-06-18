<%@ page import="br.edu.ifs.model.Usuario" %>
<%@ page import="br.edu.ifs.dao.UsuarioDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Alterar Usuário</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="../include/bootstrap.jsp" %>
</head>
<body>
<%@include file="../include/cabecalho.jsp" %>


<div class="container-fluid">

    <hr>
    <h1 class="text-center text-info">Altera Usuário</h1>
    <hr>

    <%
        int id = Integer.parseInt(request.getParameter("idUsuario"));
        UsuarioDAO dao = new UsuarioDAO();
        Usuario usu = dao.getUsuario(id);
    %>

    <div class="row">

        <div class="col-lg-4 mx-auto">
            <div class="container" style="width: 250px">
                <img class="img-fluid rounded ml-3" src="<%="../" + usu.getPathFoto()%>" alt="fotoUsuario">

                <div class="form-group">
                    <label for="foto">Foto:</label>
                    <input type="file" class="form-control-file" id="foto" name="file">
                </div>
            </div>
        </div>

        <div class="col-lg-8 mx-auto">
            <div class="container" style="width: 500px">
                <form action="../altera_usuario" method="post" enctype="multipart/form-data">

                    <input type="hidden" name="idUsuario" value="<%=usu.getIdUsuario()%>">

                    <div class="form-group">
                        <label for="cpfcnpj">CPF/CNPJ:</label>
                        <input class="form-control" type="text" id="cpfcnpj" name="cpfcnpj"
                               value="<%=usu.getCpfCnpj()%>">
                    </div>

                    <div class="form-group">
                        <label for="nome">Nome:</label>
                        <input class="form-control" type="text" id="nome" name="nome" value="<%=usu.getNome()%>">
                    </div>

                    <div class="form-group">
                        <label for="rua">Rua:</label>
                        <input class="form-control" type="text" id="rua" name="rua" value="<%=usu.getRua()%>">
                    </div>

                    <div class="form-group">
                        <label for="numero">Número:</label>
                        <input class="form-control" type="text" id="numero" name="numero" value="<%=usu.getNumero()%>">
                    </div>

                    <div class="form-group">
                        <label for="cidade">Cidade:</label>
                        <input class="form-control" type="text" id="cidade" name="cidade" value="<%=usu.getCidade()%>">
                    </div>

                    <div class="form-group">
                        <label for="estado">Estado:</label>
                        <select class="form-control" id="estado" name="estado">
                            <option value=""><%=usu.getEstado()%>
                            </option>
                            <option value="AC">Acre</option>
                            <option value="AL">Alagoas</option>
                            <option value="AP">Amapá</option>
                            <option value="AM">Amazonas</option>
                            <option value="BA">Bahia</option>
                            <option value="CE">Ceará</option>
                            <option value="DF">Distrito Federal</option>
                            <option value="ES">Espírito Santo</option>
                            <option value="GO">Goiás</option>
                            <option value="MA">Maranhão</option>
                            <option value="MT">Mato Grosso</option>
                            <option value="MS">Mato Grosso do Sul</option>
                            <option value="MG">Minas Gerais</option>
                            <option value="PA">Pará</option>
                            <option value="PB">Paraíba</option>
                            <option value="PR">Paraná</option>
                            <option value="PE">Pernambuco</option>
                            <option value="PI">Piauí</option>
                            <option value="RJ">Rio de Janeiro</option>
                            <option value="RN">Rio Grande do Norte</option>
                            <option value="RS">Rio Grande do Sul</option>
                            <option value="RO">Rondônia</option>
                            <option value="RR">Roraima</option>
                            <option value="SC">Santa Catarina</option>
                            <option value="SP">São Paulo</option>
                            <option value="SE">Sergipe</option>
                            <option value="TO">Tocantins</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="telefone">Telefone:</label>
                        <input class="form-control" type="text" id="telefone" name="telefone"
                               value="<%=usu.getTelefone()%>">
                    </div>

                    <div class="form-group">
                        <label for="email">E-mail:</label>
                        <input class="form-control" type="text" id="email" name="email" value="<%=usu.getEmail()%>">
                    </div>

                    <div class="form-group">
                        <label for="tipoUsuario">Tipo de Usuario:</label>
                        <select class="form-control" id="tipoUsuario" name="tipoUsuario">
                            <option value="1" <%=usu.getTipoUsuario() == 1 ? "selected" : ""%>>Usuário</option>
                            <option value="2" <%=usu.getTipoUsuario() == 2 ? "selected" : ""%>>Logista</option>
                        </select>
                    </div>

                    <%--Botões--%>
                    <input class="btn btn-primary" type="submit" value="Alterar">
                    <input class="btn btn-danger" type="button" value="Cancelar"
                           onclick="window.location.assign('listaUsuario.jsp')">
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="../include/rodape.jsp" %>
</body>
</html>
