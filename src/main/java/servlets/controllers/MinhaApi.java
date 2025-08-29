package servlets.controllers;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlets.model.application.AplCadastrarUsuario;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/oi")
public class MinhaApi extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Configurar o tipo de conteúdo
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("to aqui");
        AplCadastrarUsuario.incluirUsuario("nome");
        System.out.println("to aqui");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>Resposta do Servlet</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; margin: 40px; background-color: #f5f5f5; }");
        out.println(".container { max-width: 600px; margin: 0 auto; background-color: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }");
        out.println("h1 { color: #28a745; }");
        out.println(".info { background-color: #f8f9fa; padding: 15px; border-left: 4px solid #007bff; margin: 20px 0; }");
        out.println("a { color: #007bff; text-decoration: none; }");
        out.println("a:hover { text-decoration: underline; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>");
        out.println("<h1>✅ Servlet Executado com Sucesso!</h1>");
        out.println("<div class='info'>");
        out.println("<h3>Informações da Requisição:</h3>");
        out.println("<p><strong>Método HTTP:</strong> " + request.getMethod() + "</p>");
        out.println("<p><strong>URL:</strong> " + request.getRequestURL() + "</p>");
        out.println("<p><strong>Data/Hora:</strong> " + new Date() + "</p>");
        out.println("<p><strong>User-Agent:</strong> " + request.getHeader("User-Agent") + "</p>");
        out.println("</div>");
        out.println("<p>Este conteúdo foi gerado dinamicamente pelo servlet <code>MinhaApi</code>.</p>");
        out.println("<p><a href='./'>← Voltar para a página inicial</a></p>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }
}