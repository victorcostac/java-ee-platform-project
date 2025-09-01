package servlets.model.application;

import servlets.model.dao.AtorDAO;
import servlets.model.domain.Ator;

import java.util.List;
import java.util.regex.Pattern;

public class AplCadastrarAtor {
    
    private AtorDAO atorDAO;
    
    public AplCadastrarAtor() {
        this.atorDAO = new AtorDAO();
    }

    /**
     * Evento: Incluir novo ator
     */
    public void incluirAtor(String nome, String email, String cpf) {
        // Validações de negócio
        validarDadosAtor(nome, email, cpf);
        
        // Limpar formatação do CPF
        String cpfLimpo = cpf.replaceAll("[^0-9]", "");
        
        // Verificar se CPF já existe
        Ator atorExistente = atorDAO.consultarPorCpf(cpfLimpo);
        if (atorExistente != null) {
            throw new RuntimeException("Já existe um ator cadastrado com este CPF: " + cpf);
        }
        
        // Criar e salvar ator
        Ator novoAtor = new Ator(nome.trim(), email.trim().toLowerCase(), cpfLimpo);
        atorDAO.incluir(novoAtor);
    }

    /**
     * Evento: Alterar dados de ator
     */
    public void alterarAtor(Long id, String nome, String email, String cpf) {
        // Validações de negócio
        validarDadosAtor(nome, email, cpf);
        
        // Limpar formatação do CPF
        String cpfLimpo = cpf.replaceAll("[^0-9]", "");
        
        // Verificar se ator existe
        Ator ator = atorDAO.consultarPorId(id);
        if (ator == null) {
            throw new RuntimeException("Ator não encontrado com ID: " + id);
        }
        
        // Verificar se CPF já existe em outro ator
        Ator atorComMesmoCpf = atorDAO.consultarPorCpf(cpfLimpo);
        if (atorComMesmoCpf != null && !atorComMesmoCpf.getId().equals(id)) {
            throw new RuntimeException("Já existe outro ator cadastrado com este CPF: " + cpf);
        }
        
        // Atualizar dados
        ator.setNome(nome.trim());
        ator.setEmail(email.trim().toLowerCase());
        ator.setCpf(cpfLimpo);
        
        atorDAO.alterar(ator);
    }

    /**
     * Evento: Excluir ator
     */
    public void excluirAtor(Long id) {
        if (id == null || id <= 0) {
            throw new RuntimeException("ID do ator inválido");
        }
        
        // Verificar se ator existe
        Ator ator = atorDAO.consultarPorId(id);
        if (ator == null) {
            throw new RuntimeException("Ator não encontrado com ID: " + id);
        }
        
        atorDAO.excluir(id);
    }

    /**
     * Evento: Consultar dados de ator
     */
    public Ator consultarAtor(Long id) {
        if (id == null || id <= 0) {
            throw new RuntimeException("ID do ator inválido");
        }
        
        return atorDAO.consultarPorId(id);
    }

    /**
     * Consultar todos os atores
     */
    public List<Ator> consultarTodosAtores() {
        return atorDAO.consultarTodos();
    }

    /**
     * Consultar ator por CPF
     */
    public Ator consultarAtorPorCpf(String cpf) {
        if (cpf == null || cpf.trim().isEmpty()) {
            throw new RuntimeException("CPF não pode ser vazio");
        }
        
        // Limpar formatação do CPF
        String cpfLimpo = cpf.replaceAll("[^0-9]", "");
        
        return atorDAO.consultarPorCpf(cpfLimpo);
    }

    /**
     * Validações de negócio
     */
    private void validarDadosAtor(String nome, String email, String cpf) {
        // Validar nome
        if (nome == null || nome.trim().isEmpty()) {
            throw new RuntimeException("Nome é obrigatório");
        }
        if (nome.trim().length() < 2) {
            throw new RuntimeException("Nome deve ter pelo menos 2 caracteres");
        }
        if (nome.trim().length() > 100) {
            throw new RuntimeException("Nome deve ter no máximo 100 caracteres");
        }

        // Validar email
        if (email == null || email.trim().isEmpty()) {
            throw new RuntimeException("E-mail é obrigatório");
        }
        if (!isEmailValido(email.trim())) {
            throw new RuntimeException("E-mail inválido");
        }
        if (email.trim().length() > 150) {
            throw new RuntimeException("E-mail deve ter no máximo 150 caracteres");
        }

        // Validar CPF
        if (cpf == null || cpf.trim().isEmpty()) {
            throw new RuntimeException("CPF é obrigatório");
        }
        
        String cpfLimpo = cpf.replaceAll("[^0-9]", "");
        if (cpfLimpo.length() != 11) {
            throw new RuntimeException("CPF deve ter 11 dígitos");
        }
        
        if (!isCpfValido(cpfLimpo)) {
            throw new RuntimeException("CPF inválido");
        }
    }

    /**
     * Validar formato de e-mail
     */
    private boolean isEmailValido(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        return pattern.matcher(email).matches();
    }

    /**
     * Validar CPF (algoritmo simplificado)
     */
    private boolean isCpfValido(String cpf) {
        // Verificar se todos os dígitos são iguais
        if (cpf.matches("(\\d)\\1{10}")) {
            return false;
        }
        
        // Aqui você pode implementar o algoritmo completo de validação do CPF
        // Por simplicidade, vamos apenas verificar se tem 11 dígitos e não são todos iguais
        return cpf.length() == 11;
    }
}
