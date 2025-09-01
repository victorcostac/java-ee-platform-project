package servlets.util;

public class FormatUtil {
    
    /**
     * Formatar CPF para exibição (XXX.XXX.XXX-XX)
     */
    public static String formatarCpf(String cpf) {
        if (cpf == null || cpf.trim().isEmpty()) {
            return "";
        }
        
        // Remove qualquer formatação existente
        String cpfLimpo = cpf.replaceAll("[^0-9]", "");
        
        // Verifica se tem 11 dígitos
        if (cpfLimpo.length() != 11) {
            return cpf; // Retorna o original se não tiver 11 dígitos
        }
        
        // Formata: XXX.XXX.XXX-XX
        return cpfLimpo.substring(0, 3) + "." + 
               cpfLimpo.substring(3, 6) + "." + 
               cpfLimpo.substring(6, 9) + "-" + 
               cpfLimpo.substring(9, 11);
    }
    
    /**
     * Limpar formatação do CPF (apenas números)
     */
    public static String limparCpf(String cpf) {
        if (cpf == null || cpf.trim().isEmpty()) {
            return "";
        }
        return cpf.replaceAll("[^0-9]", "");
    }
    
    /**
     * Formatar telefone para exibição ((XX) XXXXX-XXXX)
     */
    public static String formatarTelefone(String telefone) {
        if (telefone == null || telefone.trim().isEmpty()) {
            return "";
        }
        
        String telefoneLimpo = telefone.replaceAll("[^0-9]", "");
        
        if (telefoneLimpo.length() == 11) {
            return "(" + telefoneLimpo.substring(0, 2) + ") " + 
                   telefoneLimpo.substring(2, 7) + "-" + 
                   telefoneLimpo.substring(7, 11);
        } else if (telefoneLimpo.length() == 10) {
            return "(" + telefoneLimpo.substring(0, 2) + ") " + 
                   telefoneLimpo.substring(2, 6) + "-" + 
                   telefoneLimpo.substring(6, 10);
        }
        
        return telefone; // Retorna original se não for formato esperado
    }
}
