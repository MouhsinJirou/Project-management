package daoImp;

import dao.UtilisateurDao;

import java.util.List;
import java.util.Date;
import java.util.Iterator;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import beans.Utilisateur;
public class UtilisateurDaoImp implements UtilisateurDao {

	
	private static SessionFactory factory = Util.getSessionFactory();;

	@Override
	public void createUser(Utilisateur utilisateur) {
		Session session = factory.openSession();
		session.getTransaction().begin();
		session.save(utilisateur);
		session.getTransaction().commit();
		session.close();

	}

	@Override
	public Utilisateur findById(int id_user) {
		Session session = factory.openSession();
		session.getTransaction().begin();
		Utilisateur utilisateur = null;
		utilisateur = (Utilisateur) session.get(Utilisateur.class, id_user);
		session.getTransaction().commit();
		session.close();
		return utilisateur;
	}

	@Override
	public List<Utilisateur> findAll() {
		Session session = factory.openSession();
		session.getTransaction().begin();
		
		Query query = session.createQuery("from Utilisateur");
		List<Utilisateur> utilisateurs = query.getResultList();
		session.getTransaction().commit();
		session.close();
		return utilisateurs;
	}
	

	@Override
	public void updateUser(int id_user, String nom_user, String prenom_user, String role_user, String mot_passe_user,
			String email_user) {
		Session session = factory.openSession();
		session.getTransaction().begin();
		Utilisateur utilisateur = (Utilisateur) session.get(Utilisateur.class, id_user);
		utilisateur.setNom(nom_user);
		utilisateur.setPrenom(prenom_user);
		utilisateur.setRole(role_user);
		utilisateur.setMot_passe(mot_passe_user);
		utilisateur.setEmail(email_user);
		session.update(utilisateur);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void deleteUser(int id_user) {
		Session session = factory.openSession();
		session.getTransaction().begin();
		Utilisateur utilisateur = (Utilisateur) session.get(Utilisateur.class, id_user);
		session.delete(utilisateur);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Utilisateur findByEmailPassword(String email, String password) {
		Session session = factory.openSession();
		session.getTransaction().begin();
		Utilisateur utilisateur = (Utilisateur) session
				.createQuery("from Utilisateur where email=:email and mot_passe=:password")
				.setParameter("email", email).setParameter("password", password).getSingleResult();
		session.getTransaction().commit();
		session.close();
		return utilisateur;
	}

}
