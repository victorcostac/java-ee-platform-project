package servlets.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class PersistenceUtil {

    private static SessionFactory sessionFactory = null;
    
    // Inicializa o SessionFactory uma única vez
    static {
        try {
            StandardServiceRegistry ssr = new StandardServiceRegistryBuilder()
                .configure("hibernate.cfg.xml") // Carrega de src/main/resources/
                .build();
            
            Metadata meta = new MetadataSources(ssr)
                .getMetadataBuilder()
                .build();
            
            sessionFactory = meta.getSessionFactoryBuilder().build();
            
        } catch (Exception e) {
            System.err.println("Erro ao inicializar SessionFactory: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    // Retorna uma nova sessão a cada chamada
    public static Session getSession() {
        if (sessionFactory != null) {
            return sessionFactory.openSession();
        }
        throw new RuntimeException("SessionFactory não foi inicializado corretamente");
    }
    
    // Método para fechar o SessionFactory (cleanup)
    public static void shutdown() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
}
