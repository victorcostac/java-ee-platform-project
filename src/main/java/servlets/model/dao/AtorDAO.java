package servlets.model.dao;

import servlets.model.domain.Ator;
import servlets.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class AtorDAO {

    /**
     * Incluir um novo ator no banco de dados
     */
    public void incluir(Ator ator) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(ator);
            transaction.commit();
            System.out.println("✅ Ator incluído com sucesso: " + ator.getNome());
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("❌ Erro ao incluir ator: " + e.getMessage());
            throw new RuntimeException("Erro ao incluir ator: " + e.getMessage(), e);
        }
    }

    /**
     * Consultar ator por ID
     */
    public Ator consultarPorId(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Ator ator = session.get(Ator.class, id);
            if (ator != null) {
                System.out.println("✅ Ator encontrado: " + ator.getNome());
            } else {
                System.out.println("⚠️ Ator não encontrado com ID: " + id);
            }
            return ator;
        } catch (Exception e) {
            System.err.println("❌ Erro ao consultar ator por ID: " + e.getMessage());
            throw new RuntimeException("Erro ao consultar ator por ID: " + e.getMessage(), e);
        }
    }

    /**
     * Consultar todos os atores
     */
    public List<Ator> consultarTodos() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Ator> query = session.createQuery("FROM Ator ORDER BY nome", Ator.class);
            List<Ator> atores = query.list();
            System.out.println("✅ Consultados " + atores.size() + " atores");
            return atores;
        } catch (Exception e) {
            System.err.println("❌ Erro ao consultar todos os atores: " + e.getMessage());
            throw new RuntimeException("Erro ao consultar todos os atores: " + e.getMessage(), e);
        }
    }

    /**
     * Consultar ator por CPF
     */
    public Ator consultarPorCpf(String cpf) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Ator> query = session.createQuery("FROM Ator WHERE cpf = :cpf", Ator.class);
            query.setParameter("cpf", cpf);
            List<Ator> atores = query.list();
            Ator ator = atores.isEmpty() ? null : atores.get(0);
            
            if (ator != null) {
                System.out.println("✅ Ator encontrado por CPF: " + ator.getNome());
            } else {
                System.out.println("⚠️ Ator não encontrado com CPF: " + cpf);
            }
            
            return ator;
        } catch (Exception e) {
            System.err.println("❌ Erro ao consultar ator por CPF: " + e.getMessage());
            throw new RuntimeException("Erro ao consultar ator por CPF: " + e.getMessage(), e);
        }
    }

    /**
     * Alterar dados de um ator existente
     */
    public void alterar(Ator ator) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(ator);
            transaction.commit();
            System.out.println("✅ Ator alterado com sucesso: " + ator.getNome());
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("❌ Erro ao alterar ator: " + e.getMessage());
            throw new RuntimeException("Erro ao alterar ator: " + e.getMessage(), e);
        }
    }

    /**
     * Excluir ator por ID
     */
    public void excluir(Long id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            
            Ator ator = session.get(Ator.class, id);
            if (ator != null) {
                session.delete(ator);
                System.out.println("✅ Ator excluído com sucesso: " + ator.getNome());
            } else {
                System.out.println("⚠️ Ator não encontrado para exclusão com ID: " + id);
            }
            
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("❌ Erro ao excluir ator: " + e.getMessage());
            throw new RuntimeException("Erro ao excluir ator: " + e.getMessage(), e);
        }
    }
}
