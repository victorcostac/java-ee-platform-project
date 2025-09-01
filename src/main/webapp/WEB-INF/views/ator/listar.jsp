<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
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
        .btn-actions { white-space: nowrap; }
        .alert { margin-top: 15px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>${titulo}</h2>
                
                <!-- Mensagens de sucesso -->
                <% String sucesso = request.getParameter("sucesso"); %>
                <% if ("incluir".equals(sucesso)) { %>
                    <div class="alert alert-success alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        Ator cadastrado com sucesso!
                    </div>
                <% } else if ("alterar".equals(sucesso)) { %>
                    <div class="alert alert-success alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        Ator alterado com sucesso!
                    </div>
                <% } else if ("excluir".equals(sucesso)) { %>
                    <div class="alert alert-success alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        Ator excluído com sucesso!
                    </div>
                <% } %>
                
                <!-- Mensagem de erro -->
                <% if (request.getAttribute("erro") != null) { %>
                    <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        ${erro}
                    </div>
                <% } %>
                
                <!-- Botão para cadastrar novo ator -->
                <div class="mb-3">
                    <a href="${pageContext.request.contextPath}/ator?acao=formulario" class="btn btn-primary">
                        <span class="glyphicon glyphicon-plus"></span> Cadastrar Novo Ator
                    </a>
                </div>
                
                <!-- Tabela de atores -->
                <div class="panel panel-default">
                    <div class="panel-header">
                        <h3 class="panel-title">Atores Cadastrados</h3>
                    </div>
                    <div class="panel-body">
                        <%
                            List<Ator> atores = (List<Ator>) request.getAttribute("atores");
                            if (atores != null && !atores.isEmpty()) {
                        %>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nome</th>
                                            <th>E-mail</th>
                                            <th>CPF</th>
                                            <th class="text-center">Ações</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (Ator ator : atores) { %>
                                            <tr>
                                                <td><%= ator.getId() %></td>
                                                <td><%= ator.getNome() %></td>
                                                <td><%= ator.getEmail() %></td>
                                                <td><%= FormatUtil.formatarCpf(ator.getCpf()) %></td>
                                                <td class="text-center btn-actions">
                                                    <a href="${pageContext.request.contextPath}/ator?acao=visualizar&id=<%= ator.getId() %>" 
                                                       class="btn btn-info btn-sm" title="Visualizar">
                                                        <span class="glyphicon glyphicon-eye-open"></span>
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/ator?acao=editar&id=<%= ator.getId() %>" 
                                                       class="btn btn-warning btn-sm" title="Editar">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/ator?acao=excluir&id=<%= ator.getId() %>" 
                                                       class="btn btn-danger btn-sm" title="Excluir">
                                                        <span class="glyphicon glyphicon-trash"></span>
                                                    </a>
                                                </td>
                                            </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        <% } else { %>
                            <div class="alert alert-info">
                                <span class="glyphicon glyphicon-info-sign"></span>
                                Nenhum ator cadastrado. <a href="${pageContext.request.contextPath}/ator?acao=formulario">Clique aqui para cadastrar o primeiro ator</a>.
                            </div>
                        <% } %>
                    </div>
                </div>
                
                <!-- Rodapé -->
                <div class="text-center" style="margin-top: 30px;">
                    <a href="${pageContext.request.contextPath}/" class="btn btn-default">
                        <span class="glyphicon glyphicon-home"></span> Voltar ao Início
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Scripts Bootstrap -->
    <script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
