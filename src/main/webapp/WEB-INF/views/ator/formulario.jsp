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
        .form-group { margin-bottom: 20px; }
        .required { color: red; }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">${titulo}</h3>
                    </div>
                    <div class="panel-body">
                        <!-- Mensagem de erro -->
                        <% if (request.getAttribute("erro") != null) { %>
                            <div class="alert alert-danger">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                ${erro}
                            </div>
                        <% } %>
                        
                        <%
                            Ator ator = (Ator) request.getAttribute("ator");
                            String acao = (String) request.getAttribute("acao");
                            boolean isEdicao = "alterar".equals(acao);
                        %>
                        
                        <form method="post" action="${pageContext.request.contextPath}/ator" class="form-horizontal">
                            <input type="hidden" name="acao" value="${acao}">
                            <% if (isEdicao && ator != null) { %>
                                <input type="hidden" name="id" value="<%= ator.getId() %>">
                            <% } %>
                            
                            <div class="form-group">
                                <label for="nome" class="col-sm-3 control-label">
                                    Nome <span class="required">*</span>
                                </label>
                                <div class="col-sm-9">
                                    <input type="text" 
                                           class="form-control" 
                                           id="nome" 
                                           name="nome" 
                                           value="<%= (ator != null) ? ator.getNome() : "" %>"
                                           placeholder="Digite o nome completo do ator"
                                           maxlength="100"
                                           required>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="email" class="col-sm-3 control-label">
                                    E-mail <span class="required">*</span>
                                </label>
                                <div class="col-sm-9">
                                    <input type="email" 
                                           class="form-control" 
                                           id="email" 
                                           name="email" 
                                           value="<%= (ator != null) ? ator.getEmail() : "" %>"
                                           placeholder="Digite o e-mail do ator"
                                           maxlength="150"
                                           required>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="cpf" class="col-sm-3 control-label">
                                    CPF <span class="required">*</span>
                                </label>
                                <div class="col-sm-9">
                                    <input type="text" 
                                           class="form-control" 
                                           id="cpf" 
                                           name="cpf" 
                                           value="<%= (ator != null) ? FormatUtil.formatarCpf(ator.getCpf()) : "" %>"
                                           placeholder="Digite o CPF (somente números)"
                                           maxlength="14"
                                           pattern="[0-9]{3}\.?[0-9]{3}\.?[0-9]{3}-?[0-9]{2}"
                                           required>
                                    <small class="help-block">
                                        Digite os números do CPF (11 dígitos) - formatação automática
                                    </small>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <button type="submit" class="btn btn-primary">
                                        <span class="glyphicon glyphicon-floppy-disk"></span>
                                        <%= isEdicao ? "Salvar Alterações" : "Cadastrar Ator" %>
                                    </button>
                                    <a href="${pageContext.request.contextPath}/ator" class="btn btn-default">
                                        <span class="glyphicon glyphicon-arrow-left"></span>
                                        Cancelar
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                
                <div class="text-center">
                    <small class="text-muted">
                        <span class="required">*</span> Campos obrigatórios
                    </small>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Scripts Bootstrap -->
    <script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    
    <!-- Script para máscara de CPF -->
    <script>
        $(document).ready(function() {
            // Máscara para CPF
            $('#cpf').on('input', function() {
                var cpf = this.value.replace(/\D/g, '');
                if (cpf.length <= 11) {
                    cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
                    cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
                    cpf = cpf.replace(/(\d{3})(\d{1,2})$/, '$1-$2');
                    this.value = cpf;
                }
            });
            
            // Validação do formulário
            $('form').on('submit', function(e) {
                var nome = $('#nome').val().trim();
                var email = $('#email').val().trim();
                var cpf = $('#cpf').val().replace(/\D/g, '');
                
                if (nome.length < 2) {
                    alert('Nome deve ter pelo menos 2 caracteres');
                    e.preventDefault();
                    return false;
                }
                
                if (cpf.length !== 11) {
                    alert('CPF deve ter 11 dígitos');
                    e.preventDefault();
                    return false;
                }
                
                return true;
            });
        });
    </script>
</body>
</html>
