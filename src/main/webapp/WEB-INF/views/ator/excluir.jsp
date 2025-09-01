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
        .danger-zone { 
            border: 2px solid #d9534f; 
            border-radius: 5px; 
            padding: 20px; 
            background-color: #f9f2f4; 
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <span class="glyphicon glyphicon-warning-sign"></span>
                            ${titulo}
                        </h3>
                    </div>
                    <div class="panel-body">
                        <%
                            Ator ator = (Ator) request.getAttribute("ator");
                            if (ator != null) {
                        %>
                            <div class="alert alert-warning">
                                <span class="glyphicon glyphicon-warning-sign"></span>
                                <strong>Atenção!</strong> Esta ação não pode ser desfeita. 
                                Você tem certeza que deseja excluir este ator?
                            </div>
                            
                            <div class="danger-zone">
                                <h4>Dados do Ator a ser Excluído:</h4>
                                
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
                                        <%= ator.getEmail() %>
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
                            </div>
                            
                            <hr>
                            
                            <div class="text-center">
                                <form method="post" action="${pageContext.request.contextPath}/ator" style="display: inline;">
                                    <input type="hidden" name="acao" value="confirmarExclusao">
                                    <input type="hidden" name="id" value="<%= ator.getId() %>">
                                    <button type="submit" class="btn btn-danger" onclick="return confirmarExclusao()">
                                        <span class="glyphicon glyphicon-trash"></span>
                                        Sim, Excluir Definitivamente
                                    </button>
                                </form>
                                
                                <a href="${pageContext.request.contextPath}/ator" class="btn btn-default">
                                    <span class="glyphicon glyphicon-arrow-left"></span>
                                    Cancelar e Voltar
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
    
    <script>
        function confirmarExclusao() {
            return confirm('Tem certeza que deseja excluir este ator? Esta ação não pode ser desfeita.');
        }
    </script>
</body>
</html>
