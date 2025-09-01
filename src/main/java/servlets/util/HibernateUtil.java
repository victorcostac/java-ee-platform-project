package servlets.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    
    private static final SessionFactory sessionFactory = buildSessionFactory();
    
    private static SessionFactory buildSessionFactory() {
        try {
            // Carrega a configuração do hibernate.cfg.xml
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");
            
            return configuration.buildSessionFactory();
        } catch (Throwable ex) {
            // Se falhar com PostgreSQL, tenta carregar configuração H2
            System.err.println("Falha ao criar SessionFactory com PostgreSQL: " + ex.getMessage());
            System.err.println("Tentando usar configuração H2...");
            
            try {
                Configuration h2Configuration = new Configuration();
                h2Configuration.configure("hibernate-h2.cfg.xml");
                
                return h2Configuration.buildSessionFactory();
            } catch (Throwable h2Ex) {
                System.err.println("Falha ao criar SessionFactory com H2: " + h2Ex.getMessage());
                throw new ExceptionInInitializerError(h2Ex);
            }
        }
    }
    
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public static void shutdown() {
        // Fecha o cache e pools de conexão
        getSessionFactory().close();
    }
}
