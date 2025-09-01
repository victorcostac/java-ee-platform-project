<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erro - Locadora</title>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container { margin-top: 50px; }
        .error-icon { font-size: 64px; color: #d9534f; }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="text-center">
                    <div class="error-icon">
                        <span class="glyphicon glyphicon-exclamation-sign"></span>
                    </div>
                    <h2>Oops! Ocorreu um erro</h2>
                    
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <h3 class="panel-title">Detalhes do Erro</h3>
                        </div>
                        <div class="panel-body">
                            <div class="alert alert-danger">
                                <% if (request.getAttribute("erro") != null) { %>
                                    ${erro}
                                <% } else { %>
                                    Erro interno do sistema. Tente novamente mais tarde.
                                <% } %>
                            </div>
                        </div>
                    </div>
                    
                    <div class="text-center">
                        <a href="javascript:history.back()" class="btn btn-default">
                            <span class="glyphicon glyphicon-arrow-left"></span>
                            Voltar
                        </a>
                        <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
                            <span class="glyphicon glyphicon-home"></span>
                            Ir para o Início
                        </a>
                        <a href="${pageContext.request.contextPath}/ator" class="btn btn-info">
                            <span class="glyphicon glyphicon-user"></span>
                            Lista de Atores
                        </a>
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
