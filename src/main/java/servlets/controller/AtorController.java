package servlets.controller;

import servlets.model.application.AplCadastrarAtor;
import servlets.model.domain.Ator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AtorController", urlPatterns = {"/ator"})
public class AtorController extends HttpServlet {
    
    private AplCadastrarAtor aplicacao;
    
    @Override
    public void init() throws ServletException {
        super.init();
        this.aplicacao = new AplCadastrarAtor();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String acao = request.getParameter("acao");
        
        try {
            if (acao == null || acao.equals("listar")) {
                listarAtores(request, response);
            } else if (acao.equals("formulario")) {
                exibirFormulario(request, response);
            } else if (acao.equals("editar")) {
                exibirFormularioEdicao(request, response);
            } else if (acao.equals("excluir")) {
                confirmarExclusao(request, response);
            } else if (acao.equals("visualizar")) {
                visualizarAtor(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/ator");
            }
        } catch (Exception e) {
            tratarErro(request, response, e);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String acao = request.getParameter("acao");
        
        try {
            if (acao.equals("incluir")) {
                incluirAtor(request, response);
            } else if (acao.equals("alterar")) {
                alterarAtor(request, response);
            } else if (acao.equals("confirmarExclusao")) {
                excluirAtor(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/ator");
            }
        } catch (Exception e) {
            tratarErro(request, response, e);
        }
    }
    
    private void listarAtores(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Ator> atores = aplicacao.consultarTodosAtores();
        request.setAttribute("atores", atores);
        request.setAttribute("titulo", "Lista de Atores");
        request.getRequestDispatcher("/WEB-INF/views/ator/listar.jsp").forward(request, response);
    }
    
    private void exibirFormulario(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setAttribute("titulo", "Cadastrar Ator");
        request.setAttribute("acao", "incluir");
        request.getRequestDispatcher("/WEB-INF/views/ator/formulario.jsp").forward(request, response);
    }
    
    private void exibirFormularioEdicao(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/ator");
            return;
        }
        
        Long id = Long.parseLong(idParam);
        Ator ator = aplicacao.consultarAtor(id);
        
        if (ator == null) {
            request.setAttribute("erro", "Ator não encontrado");
            listarAtores(request, response);
            return;
        }
        
        request.setAttribute("ator", ator);
        request.setAttribute("titulo", "Editar Ator");
        request.setAttribute("acao", "alterar");
        request.getRequestDispatcher("/WEB-INF/views/ator/formulario.jsp").forward(request, response);
    }
    
    private void confirmarExclusao(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/ator");
            return;
        }
        
        Long id = Long.parseLong(idParam);
        Ator ator = aplicacao.consultarAtor(id);
        
        if (ator == null) {
            request.setAttribute("erro", "Ator não encontrado");
            listarAtores(request, response);
            return;
        }
        
        request.setAttribute("ator", ator);
        request.setAttribute("titulo", "Excluir Ator");
        request.getRequestDispatcher("/WEB-INF/views/ator/excluir.jsp").forward(request, response);
    }
    
    private void visualizarAtor(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/ator");
            return;
        }
        
        Long id = Long.parseLong(idParam);
        Ator ator = aplicacao.consultarAtor(id);
        
        if (ator == null) {
            request.setAttribute("erro", "Ator não encontrado");
            listarAtores(request, response);
            return;
        }
        
        request.setAttribute("ator", ator);
        request.setAttribute("titulo", "Visualizar Ator");
        request.getRequestDispatcher("/WEB-INF/views/ator/visualizar.jsp").forward(request, response);
    }
    
    private void incluirAtor(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        
        aplicacao.incluirAtor(nome, email, cpf);
        
        request.setAttribute("sucesso", "Ator cadastrado com sucesso!");
        response.sendRedirect(request.getContextPath() + "/ator?sucesso=incluir");
    }
    
    private void alterarAtor(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        
        Long id = Long.parseLong(idParam);
        aplicacao.alterarAtor(id, nome, email, cpf);
        
        response.sendRedirect(request.getContextPath() + "/ator?sucesso=alterar");
    }
    
    private void excluirAtor(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        Long id = Long.parseLong(idParam);
        
        aplicacao.excluirAtor(id);
        
        response.sendRedirect(request.getContextPath() + "/ator?sucesso=excluir");
    }
    
    private void tratarErro(HttpServletRequest request, HttpServletResponse response, Exception e) 
            throws ServletException, IOException {
        
        e.printStackTrace();
        request.setAttribute("erro", e.getMessage());
        request.setAttribute("titulo", "Erro");
        request.getRequestDispatcher("/WEB-INF/views/erro.jsp").forward(request, response);
    }
}
