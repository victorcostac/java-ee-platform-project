<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Projeto Servlet Puro</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .form-section {
            margin: 20px 0;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Projeto Java EE - Servlets e JSP Puros</h1>
        
        <div class="form-section">
            <h3>Teste do Servlet</h3>
            <p>Clique no botão abaixo para testar o servlet:</p>
            
            <form action="oi" method="get">
                <input type="submit" value="Chamar Servlet"/>
            </form>
        </div>
        
        <div class="form-section">
            <h3>Sobre o Projeto</h3>
            <p>Este é um projeto Java EE puro usando apenas:</p>
            <ul>
                <li>Servlets para lógica de negócio</li>
                <li>JSP para apresentação</li>
                <li>HTML/CSS básico</li>
                <li>Tomcat como container</li>
            </ul>
        </div>
    </div>
</body>
</html>
