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
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2563eb;
            --secondary-color: #64748b;
            --success-color: #059669;
            --warning-color: #d97706;
            --danger-color: #dc2626;
            --background-color: #f8fafc;
            --card-background: #ffffff;
            --text-primary: #1e293b;
            --text-secondary: #64748b;
            --border-color: #e2e8f0;
            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
        }
        
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background-color: var(--background-color);
            color: var(--text-primary);
            line-height: 1.6;
        }
        
        .container {
            margin-top: 2rem;
            max-width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .page-header {
            background: linear-gradient(135deg, var(--primary-color) 0%, #1396a2ff 100%);
            color: white;
            padding: 1rem 0;
            margin: 2rem -15px 2rem -15px;
            border-radius: 1rem 1rem 1rem 1rem;
            box-shadow: var(--shadow-lg);
            text-align: center;
            width: 40%;
        }
        
        .page-header h3 {
            margin: 0;
            font-weight: 600;
            font-size: 1.5rem;
            letter-spacing: -0.025em;
        }
        
        .modern-card {
            background: var(--card-background);
            border: 1px solid var(--border-color);
            border-radius: 0.75rem;
            box-shadow: var(--shadow-sm);
            overflow: hidden;
            margin-bottom: 2rem;
        }
        
        .form-group-modern {
            margin-bottom: 1.5rem;
        }
        
        .form-label-modern {
            display: block;
            font-weight: 500;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
            font-size: 0.875rem;
        }
        
        .form-control-modern {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid var(--border-color);
            border-radius: 0.5rem;
            font-size: 0.875rem;
            transition: all 0.2s ease;
            background-color: var(--card-background);
        }
        
        .form-control-modern:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgb(37 99 235 / 0.1);
        }
        
        .required {
            color: var(--danger-color);
            font-weight: 600;
        }
        
        .btn-modern {
            border-radius: 0.5rem;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            font-size: 0.875rem;
            transition: all 0.2s ease;
            border: none;
            box-shadow: var(--shadow-sm);
            margin: 0 0.25rem;
        }
        
        .btn-modern:hover {
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }
        
        .btn-primary-modern {
            background: linear-gradient(135deg, var(--primary-color) 0%, #3b82f6 100%);
            color: white;
        }
        
        .btn-secondary-modern {
            background: linear-gradient(135deg, #6b7280 0%, #4b5563 100%);
            color: white;
        }
        
        .alert-modern {
            border: none;
            border-radius: 0.75rem;
            padding: 1rem 1.25rem;
            margin-bottom: 1.5rem;
            font-weight: 500;
            box-shadow: var(--shadow-sm);
        }
        
        .alert-danger-modern {
            background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
            color: #991b1b;
            border-left: 4px solid var(--danger-color);
        }
        
        @media (max-width: 768px) {
            .container {
                margin-top: 1rem;
                padding: 0 1rem;
            }
            
            .page-header {
                margin: -1rem -1rem 1.5rem -1rem;
                padding: 1.5rem 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <h3>${titulo}</h3>
        </div>
        
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="modern-card">
                    <div style="padding: 2rem;">
                        <!-- Mensagem de erro -->
                        <% if (request.getAttribute("erro") != null) { %>
                            <div class="alert-modern alert-danger-modern">
                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                <strong>Erro!</strong> ${erro}
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
                            
                            <div class="form-group-modern">
                                <label for="nome" class="form-label-modern">
                                    Nome <span class="required">*</span>
                                </label>
                                <input type="text" 
                                       class="form-control-modern" 
                                       id="nome" 
                                       name="nome" 
                                       value="<%= (ator != null) ? ator.getNome() : "" %>"
                                       placeholder="Digite o nome completo do ator"
                                       maxlength="100"
                                       required>
                            </div>
                            
                            <div class="form-group-modern">
                                <label for="email" class="form-label-modern">
                                    E-mail <span class="required">*</span>
                                </label>
                                <input type="email" 
                                       class="form-control-modern" 
                                       id="email" 
                                       name="email" 
                                       value="<%= (ator != null) ? ator.getEmail() : "" %>"
                                       placeholder="Digite o e-mail do ator"
                                       maxlength="150"
                                       required>
                            </div>
                            
                            <div class="form-group-modern">
                                <label for="cpf" class="form-label-modern">
                                    CPF <span class="required">*</span>
                                </label>
                                <input type="text" 
                                       class="form-control-modern" 
                                       id="cpf" 
                                       name="cpf" 
                                       value="<%= (ator != null) ? FormatUtil.formatarCpf(ator.getCpf()) : "" %>"
                                       placeholder="Digite o CPF (somente números)"
                                       maxlength="14"
                                       pattern="[0-9]{3}\.?[0-9]{3}\.?[0-9]{3}-?[0-9]{2}"
                                       required>
                                <small style="color: var(--text-secondary); font-size: 0.75rem;">
                                    Digite os números do CPF (11 dígitos) - formatação automática
                                </small>
                            </div>
                            
                            <div style="text-align: center; margin-top: 2rem; padding-top: 2rem; border-top: 1px solid var(--border-color);">
                                <button type="submit" class="btn btn-primary-modern btn-modern">
                                    <span class="glyphicon glyphicon-floppy-disk"></span>
                                    <%= isEdicao ? "Salvar Alterações" : "Cadastrar Ator" %>
                                </button>
                                <a href="${pageContext.request.contextPath}/ator" class="btn btn-secondary-modern btn-modern">
                                    <span class="glyphicon glyphicon-arrow-left"></span>
                                    Cancelar
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
                
                <div class="text-center" style="margin-top: 1rem;">
                    <small style="color: var(--text-secondary);">
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
