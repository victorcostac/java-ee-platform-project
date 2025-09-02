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
            max-width: 2000px;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
        }
        
        /* Header moderno */
        .page-header {
            background: linear-gradient(135deg, var(--primary-color) 0%, #3b82f6 100%);
            color: white;
            padding: 0.5rem 1;
            margin: auto;
            border-radius: 1rem 1rem 1rem 1rem;
            box-shadow: var(--shadow-lg);
            /* background:red; */
            width: 40%;
        }
        
        .page-header h2 {
            margin: 0;
            font-weight: 600;
            font-size: 1.875rem;
            letter-spacing: -0.025em;
        }

        .page-header-h2 {
            display: flex;
            justify-content: center;
        }


        /*mensagens de sucesso*/


        .col-md-12{
            /* background:red; */
            width:45%;
            gap: 2rem;
        }
        
        /* Cards modernos */
        .modern-card {
            background: var(--card-background);
            border: 1px solid var(--border-color);
            border-radius: 0.75rem;
            box-shadow: var(--shadow-sm);
            transition: all 0.2s ease;
            overflow: hidden;
            margin-top: 0.5rem;
        }
        
        .modern-card:hover {
            box-shadow: var(--shadow-md);
            transform: translateY(-1px);
        }
        
        .card-header-modern {
            background: linear-gradient(90deg, #f8fafc 0%, #f1f5f9 100%);
            border-bottom: 1px solid var(--border-color);
            padding: 1.25rem 1.5rem;
            font-weight: 500;
            color: var(--text-primary);
        }
        
        /* Botões modernos */
        .btn-modern {
            border-radius: 0.5rem;
            padding: 0.5rem 1rem;
            font-weight: 500;
            font-size: 0.875rem;
            transition: all 0.2s ease;
            border: none;
            box-shadow: var(--shadow-sm);
        }
        
        .btn-modern:hover {
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }
        
        .btn-primary-modern {
            background: linear-gradient(135deg, var(--primary-color) 0%, #3b82f6 100%);
            color: white;
        }
        
        .btn-primary-modern:hover {
            background: linear-gradient(135deg, #1d4ed8 0%, var(--primary-color) 100%);
            color: white;
        }
        
        /* Botões de ação */
        .btn-actions {
            white-space: nowrap;
            text-align: center;
        }
        
        .btn-actions .btn {
            margin: 0 0.125rem;
            padding: 0.375rem 0.75rem;
            border-radius: 0.375rem;
            font-size: 0.75rem;
            border: none;
            transition: all 0.2s ease;
        }
        
        .btn-info-modern {
            background: linear-gradient(135deg, #0ea5e9 0%, #0284c7 100%);
            color: white;
        }
        
        .btn-warning-modern {
            background: linear-gradient(135deg, #f59e0b 0%, var(--warning-color) 100%);
            color: white;
        }
        
        .btn-danger-modern {
            background: linear-gradient(135deg, var(--danger-color) 0%, #b91c1c 100%);
            color: white;
        }
        
        .btn-actions .btn:hover {
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }
        
        /* Tabela moderna */
        .table-modern {
            background: var(--card-background);
            border-collapse: separate;
            border-spacing: 0;
        }
        
        .table-modern thead th {
            background: linear-gradient(90deg, #f8fafc 0%, #f1f5f9 100%);
            border: none;
            color: var(--text-primary);
            font-weight: 600;
            font-size: 0.875rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            padding: 1rem 1.25rem;
        }
        
        .table-modern tbody td {
            border: none;
            border-bottom: 1px solid var(--border-color);
            padding: 1rem 1.25rem;
            vertical-align: middle;
        }
        
        .table-modern tbody tr:hover {
            background-color: #f8fafc;
        }
        
        .table-modern tbody tr:last-child td {
            border-bottom: none;
        }

        /*Botão cadastro ator*/

        .mb-4{
            display:flex;
            margin-top: 2px;
        }
        
        /* Alertas modernos */
        .alert-modern {
            border: none;
            border-radius: 0.75rem;
            padding: 1rem 1.25rem;
            margin-bottom: 1.5rem;
            font-weight: 500;
            box-shadow: var(--shadow-sm);
        }
        
        .alert-success-modern {
            background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
            color: #065f46;
            border-left: 4px solid var(--success-color);
            margin-top: 1rem;
            display: flex;
            justify-content: center;
            /* width: 92.5%; */
        }
        
        .alert-danger-modern {
            background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
            color: #991b1b;
            border-left: 4px solid var(--danger-color);
        }
        
        .alert-info-modern {
            background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);
            color: #1e40af;
            border-left: 4px solid var(--primary-color);
        }
        
        /* Responsividade */
        @media (max-width: 768px) {
            .container {
                margin-top: 1rem;
                padding: 0 1rem;
            }
            
            .page-header {
                margin: -1rem -1rem 1.5rem -1rem;
                padding: 1.5rem 1rem;
            }
            
            .btn-actions .btn {
                margin: 0.125rem;
                padding: 0.25rem 0.5rem;
                font-size: 0.75rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <div class="page-header-h2">
                <h2>${titulo}</h2>
            </div>
        </div>
        
        <%-- <div> --%>
            <div class="col-md-12">
                <!-- Mensagens de sucesso -->
                <% String sucesso = request.getParameter("sucesso"); %>
                <% if ("incluir".equals(sucesso)) { %>
                    <div class="alert-modern alert-success-modern">
                        <strong>✓ Sucesso!</strong> Ator cadastrado com sucesso!
                    </div>
                <% } else if ("alterar".equals(sucesso)) { %>
                    <div class="alert-modern alert-success-modern">
                        <strong>✓ Sucesso!</strong> Ator alterado com sucesso!
                    </div>
                <% } else if ("excluir".equals(sucesso)) { %>
                    <div class="alert-modern alert-success-modern">
                        <strong>✓ Sucesso!</strong> Ator excluído com sucesso!
                    </div>
                <% } %>
                
                <!-- Mensagem de erro -->
                <% if (request.getAttribute("erro") != null) { %>
                    <div class="alert-modern alert-danger-modern">
                        <strong>⚠ Erro!</strong> ${erro}
                    </div>
                <% } %>
                
                <!-- Botão para cadastrar novo ator -->
                <div class="mb-4">
                    <a href="${pageContext.request.contextPath}/ator?acao=formulario" class="btn btn-primary-modern btn-modern">
                        <span class="glyphicon glyphicon-plus"></span> Cadastrar Novo Ator
                    </a>
                </div>
                
                <!-- Tabela de atores -->
                <div class="modern-card">
                    <div class="card-header-modern">
                        <h4 style="margin: 0; font-size: 1.125rem;">Atores Cadastrados</h4>
                    </div>
                    <div class="panel-body" style="padding: 0;">
                        <%
                            List<Ator> atores = (List<Ator>) request.getAttribute("atores");
                            if (atores != null && !atores.isEmpty()) {
                        %>
                            <div class="table-responsive">
                                <table class="table table-modern">
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
                                                       class="btn btn-info-modern btn-sm" title="Visualizar">
                                                        <span class="glyphicon glyphicon-eye-open">Visualizar</span>
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/ator?acao=editar&id=<%= ator.getId() %>" 
                                                       class="btn btn-warning-modern btn-sm" title="Editar">
                                                        <span class="glyphicon glyphicon-edit">Editar</span>
                                                    </a>
                                                    <button type="button" class="btn btn-danger-modern btn-sm" title="Excluir" 
                                                            onclick="confirmarExclusao(<%= ator.getId() %>, '<%= ator.getNome().replace("'", "\\'") %>')">
                                                        <span class="glyphicon glyphicon-trash">Excluir</span>
                                                    </button>
                                                </td>
                                            </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        <% } else { %>
                            <div style="padding: 2rem; text-align: center;">
                                <div class="alert-modern alert-info-modern">
                                    <span class="glyphicon glyphicon-info-sign"></span>
                                    <strong>Nenhum ator cadastrado.</strong> 
                                    <a href="${pageContext.request.contextPath}/ator?acao=formulario" 
                                       class="btn btn-primary-modern btn-modern" style="margin-left: 1rem;">
                                        Cadastrar o primeiro ator
                                    </a>
                                </div>
                            </div>
                        <% } %>
                    </div>
                </div>
                
                <!-- Rodapé -->
                <div class="text-center" style="margin-top: 2rem;">
                    <a href="${pageContext.request.contextPath}/" class="btn btn-modern" 
                       style="background: #6b7280; color: white; border-radius: 0.5rem;">
                        <span class="glyphicon glyphicon-home"></span> Voltar ao Início
                    </a>
                </div>
            </div>
        <%-- </div> --%>
    </div>
    
    <!-- Scripts Bootstrap -->
    <script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    
    <script>
        function confirmarExclusao(id, nome) {
            // Remove possíveis caracteres problemáticos do nome
            nome = nome.replace(/'/g, "").replace(/"/g, "");
            
            var mensagem = 'Tem certeza que deseja excluir o ator "' + nome + '"?\n\n' +
                          'Esta ação não pode ser desfeita.';
            
            if (confirm(mensagem)) {
                window.location.href = '${pageContext.request.contextPath}/ator?acao=excluir&id=' + id;
            }
        }
        
        // Adiciona efeitos de entrada suaves
        $(document).ready(function() {
            $('.modern-card').css('opacity', '0').animate({opacity: 1}, 600);
            $('.alert-modern').css('opacity', '0').animate({opacity: 1}, 400);
            $('.btn-modern').hover(
                function() {
                    $(this).css('transform', 'translateY(-2px)');
                },
                function() {
                    $(this).css('transform', 'translateY(0)');
                }
            );
        });
    </script>
</body>
</html>
