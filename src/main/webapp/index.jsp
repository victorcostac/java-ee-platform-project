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
    <style>
        .container { margin-top: 30px; }
        .hero-unit { 
            background-color: #f5f5f5; 
            padding: 40px; 
            border-radius: 10px; 
            text-align: center; 
            margin-bottom: 30px; 
        }
        .module-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .module-card:hover {
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            transition: box-shadow 0.3s ease;
        }
        .module-icon {
            font-size: 48px;
            margin-bottom: 15px;
            color: #337ab7;
        }
        .info-section {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
            margin-top: 20px;
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
        <div class="hero-unit">
            <h1>Sistema Locadora</h1>
            <p class="lead">Plataforma Java EE com Servlets e JSP</p>
            <small class="text-muted">Projeto desenvolvido para gestão de locadora de filmes</small>
        </div>
        
        <!-- Módulos do Sistema -->
        <div class="row">
            <div class="col-md-12">
                <h2>Módulos do Sistema</h2>
            </div>
        </div>
        
        <div class="row">
            <!-- Módulo Atores -->
            <div class="col-md-4">
                <div class="module-card text-center">
                    <div class="module-icon">
                        <span class="glyphicon glyphicon-user"></span>
                    </div>
                    <h3>Cadastro de Atores</h3>
                    <p>Gerenciar informações dos atores do sistema.</p>
                    <div>
                        <a href="${pageContext.request.contextPath}/ator" class="btn btn-primary">
                            <span class="glyphicon glyphicon-list"></span> 
                            Listar Atores
                        </a>
                        <a href="${pageContext.request.contextPath}/ator?acao=formulario" class="btn btn-success">
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
                    <h3>Cadastro de Filmes</h3>
                    <p>Gerenciar catálogo de filmes disponíveis.</p>
                    <div>
                        <button class="btn btn-default" disabled>
                            <span class="glyphicon glyphicon-wrench"></span> 
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
                    <h3>Locações</h3>
                    <p>Controlar aluguel e devolução de filmes.</p>
                    <div>
                        <button class="btn btn-default" disabled>
                            <span class="glyphicon glyphicon-wrench"></span> 
                            Em Desenvolvimento
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Teste do Servlet Original -->
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Teste do Servlet Original</h3>
            </div>
            <div class="panel-body">
                <p>Clique no botão abaixo para testar o servlet original:</p>
                <form action="oi" method="post" style="display: inline;">
                    <button type="submit" class="btn btn-info">
                        <span class="glyphicon glyphicon-play"></span>
                        Chamar Servlet
                    </button>
                </form>
            </div>
        </div>
        
        <!-- Informações do Sistema -->
        <div class="info-section">
            <h3>Informações do Sistema</h3>
            <div class="row">
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
    
    <!-- Scripts Bootstrap -->
    <script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
