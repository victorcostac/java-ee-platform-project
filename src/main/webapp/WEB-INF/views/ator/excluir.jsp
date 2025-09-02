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
            background: linear-gradient(135deg, var(--danger-color) 0%, #dc2626 100%);
            color: white;
            padding: 0.5rem 0;
            margin: 3rem -15px 2rem -15px;
            border-radius: 1rem 1rem 1rem 1rem;
            box-shadow: var(--shadow-lg);
            text-align: center;
            width: 45%;
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
        
        .danger-section {
            padding: 2rem;
        }
        
        .alert-modern {
            border: none;
            border-radius: 0.75rem;
            padding: 1rem 1.25rem;
            margin-bottom: 1.5rem;
            font-weight: 500;
            box-shadow: var(--shadow-sm);
        }
        
        .alert-warning-modern {
            background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
            color: #92400e;
            border-left: 4px solid var(--warning-color);
        }
        
        .danger-zone {
            border: 2px solid var(--danger-color);
            border-radius: 0.75rem;
            padding: 1.5rem;
            background: linear-gradient(135deg, #fef2f2 0%, #fee2e2 100%);
            margin: 1.5rem 0;
        }
        
        .danger-zone h4 {
            color: var(--danger-color);
            font-weight: 600;
            margin-bottom: 1rem;
            font-size: 1.125rem;
        }
        
        .info-row {
            display: flex;
            padding: 1rem 0;
            border-bottom: 1px solid #fecaca;
            align-items: center;
        }
        
        .info-row:last-child {
            border-bottom: none;
        }
        
        .label-info {
            font-weight: 600;
            color: var(--danger-color);
            width: 120px;
            flex-shrink: 0;
            font-size: 0.875rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        
        .info-value {
            color: var(--text-primary);
            font-weight: 500;
            flex: 1;
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
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-modern:hover {
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
            text-decoration: none;
        }
        
        .btn-danger-modern {
            background: linear-gradient(135deg, var(--danger-color) 0%, #b91c1c 100%);
            color: white;
        }
        
        .btn-danger-modern:hover {
            background: linear-gradient(135deg, #b91c1c 0%, #991b1b 100%);
            color: white;
        }
        
        .btn-secondary-modern {
            background: linear-gradient(135deg, #6b7280 0%, #4b5563 100%);
            color: white;
        }
        
        .btn-secondary-modern:hover {
            background: linear-gradient(135deg, #4b5563 0%, #374151 100%);
            color: white;
        }
        
        .action-buttons {
            text-align: center;
            padding-top: 2rem;
            border-top: 1px solid var(--border-color);
            margin-top: 1rem;
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
            
            .info-row {
                flex-direction: column;
                align-items: flex-start;
                padding: 0.75rem 0;
            }
            
            .label-info {
                margin-bottom: 0.25rem;
                width: auto;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <h3>
                <span class="glyphicon glyphicon-warning-sign"></span>
                ${titulo}
            </h3>
        </div>
        
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="modern-card">
                    <div class="danger-section">
                        <%
                            Ator ator = (Ator) request.getAttribute("ator");
                            if (ator != null) {
                        %>
                            <div class="alert-modern alert-warning-modern">
                                <span class="glyphicon glyphicon-warning-sign"></span>
                                <strong>Atenção!</strong> Esta ação não pode ser desfeita. 
                                Você tem certeza que deseja excluir este ator?
                            </div>
                            
                            <div class="danger-zone">
                                <h4>Dados do Ator a ser Excluído:</h4>
                                
                                <div class="info-row">
                                    <span class="label-info">ID:</span>
                                    <div class="info-value">
                                        <%= ator.getId() %>
                                    </div>
                                </div>
                                
                                <div class="info-row">
                                    <span class="label-info">Nome:</span>
                                    <div class="info-value">
                                        <%= ator.getNome() %>
                                    </div>
                                </div>
                                
                                <div class="info-row">
                                    <span class="label-info">E-mail:</span>
                                    <div class="info-value">
                                        <%= ator.getEmail() %>
                                    </div>
                                </div>
                                
                                <div class="info-row">
                                    <span class="label-info">CPF:</span>
                                    <div class="info-value">
                                        <%= FormatUtil.formatarCpf(ator.getCpf()) %>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="action-buttons">
                                <form method="post" action="${pageContext.request.contextPath}/ator" style="display: inline;">
                                    <input type="hidden" name="acao" value="confirmarExclusao">
                                    <input type="hidden" name="id" value="<%= ator.getId() %>">
                                    <button type="submit" class="btn btn-danger-modern btn-modern" onclick="return confirmarExclusao()">
                                        <span class="glyphicon glyphicon-trash"></span>
                                        Sim, Excluir Definitivamente
                                    </button>
                                </form>
                                
                                <a href="${pageContext.request.contextPath}/ator" class="btn btn-secondary-modern btn-modern">
                                    <span class="glyphicon glyphicon-arrow-left"></span>
                                    Cancelar e Voltar
                                </a>
                            </div>
                        <% } else { %>
                            <div class="alert-modern alert-warning-modern">
                                <span class="glyphicon glyphicon-warning-sign"></span>
                                <strong>Atenção!</strong> Ator não encontrado.
                            </div>
                            <div class="action-buttons">
                                <a href="${pageContext.request.contextPath}/ator" class="btn btn-secondary-modern btn-modern">
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
