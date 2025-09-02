<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema Locadora - Java EE</title>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2563eb;
            --secondary-color: #64748b;
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
            background: linear-gradient(135deg, var(--background-color) 0%, #e2e8f0 100%);
            color: var(--text-primary);
            line-height: 1.6;
            min-height: 100vh;
            width: 100vw;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .container { 
            margin-top: 2rem;
            max-width: 2500;
            width: 65%;
        }
        
        .hero-section { 
            background: linear-gradient(135deg, var(--primary-color) 0%, #3b82f6 100%);
            color: white;
            padding: 4rem 2rem; 
            border-radius: 1rem; 
            text-align: center; 
            margin-bottom: 3rem;
            box-shadow: var(--shadow-lg);
            position: relative;
            overflow: hidden;
            display: flex;
            width: 100%;
            flex-direction: column;
            align-items: center;
        }
        
        .hero-section::before {
            content: '';
            /* position: absolute; */
            /* top: 0;
            left: 0;
            right: 0;
            bottom: 0; */
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="50" cy="50" r="0.5" fill="white" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            pointer-events: none;
        }
        
        .hero-section h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            letter-spacing: -0.025em;
        }
        
        .hero-section p {
            font-size: 1.125rem;
            opacity: 0.9;
            margin-bottom: 0;
        }
        
        .module-card {
            background: var(--card-background);
            border: 1px solid var(--border-color);
            border-radius: 0.75rem;
            padding: 2rem;
            margin-bottom: 1.5rem;
            box-shadow: var(--shadow-sm);
            transition: all 0.2s ease;
            height: 100%;
        }
        
        .module-card:hover {
            box-shadow: var(--shadow-md);
            transform: translateY(-2px);
            border-color: var(--primary-color);
        }
        
        .module-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .module-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 0.75rem;
        }
        
        .module-description {
            color: var(--text-secondary);
            font-size: 0.875rem;
            margin-bottom: 1.5rem;
            line-height: 1.5;
        }
        .module-buttons {
            display: flex;
            flex-direction: row;
            gap: 0.5rem;
            justify-content: center;
        }
        
        .btn-modern {
            border-radius: 0.5rem;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            font-size: 0.875rem;
            transition: all 0.2s ease;
            border: none;
            box-shadow: var(--shadow-sm);
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-modern:hover {
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
            text-decoration: none;
        }
        
        .btn-primary-modern {
            background: linear-gradient(135deg, var(--primary-color) 0%, #3b82f6 100%);
            color: white;
        }
        
        .btn-outline-modern {
            background: transparent;
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
        }
        
        .btn-outline-modern:hover {
            background: var(--primary-color);
            color: white;
        }
        
        .stats-section {
            background: var(--card-background);
            border-radius: 0.75rem;
            padding: 2rem;
            margin-bottom: 3rem;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-color);
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            width: 100%;
        }
        
        .stats-item {
            text-align: center;
            padding: 1rem;
        }
        
        .stats-number {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .stats-label {
            color: var(--text-secondary);
            font-size: 0.875rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        
        .footer-section {
            text-align: center;
            padding: 2rem 0;
            color: var(--text-secondary);
            font-size: 0.875rem;
        }

        .col-md-4{
            /* display: flex; */
            width: 65%;
            /* background: red; */
        }

        .row{
            /* background: red; */
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .modules-section{
            height:100%;
            width:100%;
            display: flex;
            flex-direction: column;
            align-items: center;

        }
        
        @media (max-width: 768px) {
            .container {
                margin-top: 1rem;
                padding: 0 1rem;

            }
            
            .hero-section {
                padding: 2rem 1rem;
                margin-bottom: 2rem;
            }
            
            .hero-section h1 {
                font-size: 2rem;
            }
            
            .module-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <%-- Declaração JSP --%>
    <%! 
        private String getNomeServidor() {
            return "Jetty 9.4.44";
        }
        
        private int getNumeroAleatorio() {
            return (int)(Math.random() * 1000);
        }
    %>
    
    <%-- Scriptlet JSP --%>
    <% 
        String nomeUsuario = "Desenvolvedor";
        Date dataAtual = new Date();
        String servidor = getNomeServidor();
        int numeroSorte = getNumeroAleatorio();
    %>

    <div class="container">
        <!-- Header -->
        <div class="hero-section">
            <h1>Sistema Locadora</h1>
            <p>Plataforma Java EE com Servlets e JSP</p>
            <div style="opacity: 0.8; font-size: 0.875rem; margin-top: 1rem;">
                Projeto desenvolvido para gestão de locadora de filmes
            </div>
        </div>
        
        <!-- Stats Section -->
        <div class="stats-section">
            <%-- <div class="column"> --%>
                <div class="col-md-3 col-sm-6">
                    <div class="stats-item">
                        <div class="stats-number"><%= numeroSorte %></div>
                        <div class="stats-label">Sessões Ativas</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="stats-item">
                        <div class="stats-number">1</div>
                        <div class="stats-label">Módulos</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="stats-item">
                        <div class="stats-number">100%</div>
                        <div class="stats-label">Uptime</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="stats-item">
                        <div class="stats-number">Java 21</div>
                        <div class="stats-label">Plataforma</div>
                    </div>
                </div>
            <%-- </div> --%>
        </div>
        <div class="modules-section">  
        <!-- Módulos do Sistema -->
        <div>
            <div class="col-md-12">
                <h2 style="margin-bottom: 2rem; color: var(--text-primary); font-weight: 600;">Módulos do Sistema</h2>
            </div>
        </div>
        
        <div class="row">
            <!-- Módulo Atores -->
            <div class="col-md-4">
                <div class="module-card text-center">
                    <div class="module-icon">
                        <span class="glyphicon glyphicon-user"></span>
                    </div>
                    <h3 class="module-title">Cadastro de Atores</h3>
                    <p class="module-description">Gerenciar informações dos atores do sistema com funcionalidades completas de CRUD.</p>
                    <div class="module-buttons">
                        <a href="${pageContext.request.contextPath}/ator" class="btn btn-primary-modern btn-modern">
                            <span class="glyphicon glyphicon-list"></span> 
                            Listar Atores
                        </a>
                        <%-- <br><br> --%>
                        <a href="${pageContext.request.contextPath}/ator?acao=formulario" class="btn btn-outline-modern btn-modern">
                            <span class="glyphicon glyphicon-plus"></span> 
                            Novo Ator
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- Módulo Filmes -->
            <div class="col-md-4">
                <div class="module-card text-center">
                    <div class="module-icon">
                        <span class="glyphicon glyphicon-film"></span>
                    </div>
                    <h3 class="module-title">Cadastro de Filmes</h3>
                    <p class="module-description">Gerenciar catálogo de filmes disponíveis para locação.</p>
                    <div>
                        <button class="btn btn-modern" disabled style="background: #9ca3af; color: white;">
                            <span class="glyphicon glyphicon-list"></span> 
                            Em Desenvolvimento
                        </button>
                    </div>
                </div>
            </div>
            
            <!-- Módulo Locações -->
            <div class="col-md-4">
                <div class="module-card text-center">
                    <div class="module-icon">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                    </div>
                    <h3 class="module-title">Controle de Locações</h3>
                    <p class="module-description">Gerenciar locações, devoluções e controle de estoque.</p>
                    <div>
                        <button class="btn btn-modern" disabled style="background: #9ca3af; color: white;">
                            <span class="glyphicon glyphicon-list"></span> 
                            Em Desenvolvimento
                        </button>
                    </div>
                </div>
            </div>
        </div>

        
        <!-- Informações do Sistema -->
        <div class="info-section">
            <h3>Informações do Sistema</h3>
            <div>
                <div class="col-md-6">
                    <ul class="list-unstyled">
                        <li><strong>Usuário:</strong> <%= nomeUsuario %></li>
                        <li><strong>Data/Hora:</strong> <%= dataAtual %></li>
                        <li><strong>Session ID:</strong> <%= session.getId() %></li>
                        <li><strong>Context Path:</strong> <%= request.getContextPath() %></li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <ul class="list-unstyled">
                        <li><strong>Servidor:</strong> <%= servidor %></li>
                        <li><strong>Número da sorte:</strong> <%= numeroSorte %></li>
                        <li><strong>Tecnologias:</strong> Java EE, Servlets, JSP</li>
                        <li><strong>Banco de Dados:</strong> PostgreSQL / H2</li>
                    </ul>
                </div>
            </div>
        </div>
        
        <% 
            String mensagem = "Sistema funcionando com arquitetura MVC!";
            out.println("<div class='alert alert-success text-center' style='margin-top: 20px;'>");
            out.println("<span class='glyphicon glyphicon-ok'></span> " + mensagem);
            out.println("</div>");
        %>
        </div>
    </div>
    
    <!-- Scripts Bootstrap -->
    <script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
