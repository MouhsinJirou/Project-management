package daoImp;

import java.util.Iterator;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import dao.ProjetDao;
import beans.Projet;


public class ProjetDaoImp implements ProjetDao{
	private static SessionFactory factory=Util.getSessionFactory();

	@Override
	public void createProjet(Projet projet) {
		Session session = factory.openSession();
		session.getTransaction().begin();
		session.save(projet);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Projet findById(String code_pro) {
		Session session = factory.openSession();
		session.getTransaction().begin();
		Projet projet = (Projet) session.get(Projet.class, code_pro);
		session.getTransaction().commit();
		session.close();
		return projet;
	}

	@Override
	public List<Projet> findAll() {
		Session session = factory.openSession();
		session.getTransaction().begin();
		Query query = session.createQuery("from Projet");
		List<Projet> projets = query.getResultList();
		session.getTransaction().commit();
		session.close();
		return projets;
	}

	@Override
	public void updateProjet(String code_pro, String intit_pro, String description_pro,String statut, int charge_horaire_pro) {
		Session session = factory.openSession();
		session.getTransaction().begin();
		Projet projet = (Projet) session.get(Projet.class, code_pro);
		projet.setIntitule(intit_pro);
		projet.setDescription(description_pro);
		projet.setStatut(statut);
		
		projet.setCharge_horaire(charge_horaire_pro);
		session.update(projet);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void deleteProjet(String code_pro) {
		Session session = factory.openSession();
		session.getTransaction().begin();
		Projet projet = (Projet) session.get(Projet.class, code_pro);
		session.delete(projet);
		session.getTransaction().commit();
		session.close();
	}
	
	@Override
	public List<Projet> getAllProjets(int idChefProjet) {
		
		Session s = factory.getCurrentSession();
		s.beginTransaction();
		List<Projet> projets = (List<Projet>) s
				.createQuery("from Projet where numero_user = :id ")
				.setParameter("id", idChefProjet).list();
		s.getTransaction().commit();
		s.close();
		return projets;
	}

}

