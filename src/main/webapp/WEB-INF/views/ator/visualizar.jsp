<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="servlets.model.domain.Ator" %>
<%@ page import="servlets.util.FormatUtil" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${titulo} - Locadora</title>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container { margin-top: 20px; }
        .info-row { margin-bottom: 15px; }
        .label-info { font-weight: bold; color: #333; }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <span class="glyphicon glyphicon-user"></span>
                            ${titulo}
                        </h3>
                    </div>
                    <div class="panel-body">
                        <%
                            Ator ator = (Ator) request.getAttribute("ator");
                            if (ator != null) {
                        %>
                            <div class="row info-row">
                                <div class="col-sm-3">
                                    <span class="label-info">ID:</span>
                                </div>
                                <div class="col-sm-9">
                                    <%= ator.getId() %>
                                </div>
                            </div>
                            
                            <div class="row info-row">
                                <div class="col-sm-3">
                                    <span class="label-info">Nome:</span>
                                </div>
                                <div class="col-sm-9">
                                    <%= ator.getNome() %>
                                </div>
                            </div>
                            
                            <div class="row info-row">
                                <div class="col-sm-3">
                                    <span class="label-info">E-mail:</span>
                                </div>
                                <div class="col-sm-9">
                                    <a href="mailto:<%= ator.getEmail() %>"><%= ator.getEmail() %></a>
                                </div>
                            </div>
                            
                            <div class="row info-row">
                                <div class="col-sm-3">
                                    <span class="label-info">CPF:</span>
                                </div>
                                <div class="col-sm-9">
                                    <%= FormatUtil.formatarCpf(ator.getCpf()) %>
                                </div>
                            </div>
                            
                            <hr>
                            
                            <div class="text-center">
                                <a href="${pageContext.request.contextPath}/ator?acao=editar&id=<%= ator.getId() %>" 
                                   class="btn btn-warning">
                                    <span class="glyphicon glyphicon-edit"></span>
                                    Editar
                                </a>
                                <a href="${pageContext.request.contextPath}/ator?acao=excluir&id=<%= ator.getId() %>" 
                                   class="btn btn-danger">
                                    <span class="glyphicon glyphicon-trash"></span>
                                    Excluir
                                </a>
                                <a href="${pageContext.request.contextPath}/ator" class="btn btn-default">
                                    <span class="glyphicon glyphicon-arrow-left"></span>
                                    Voltar à Lista
                                </a>
                            </div>
                        <% } else { %>
                            <div class="alert alert-warning">
                                <span class="glyphicon glyphicon-warning-sign"></span>
                                Ator não encontrado.
                            </div>
                            <div class="text-center">
                                <a href="${pageContext.request.contextPath}/ator" class="btn btn-default">
                                    <span class="glyphicon glyphicon-arrow-left"></span>
                                    Voltar à Lista
                                </a>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Scripts Bootstrap -->
    <script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
