package daoImp;

import dao.TacheDao;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;


import beans.Utilisateur;
import beans.Tache;

public class TacheDaoImp implements TacheDao {
		
		private static SessionFactory factory = Util.getSessionFactory();

		@Override
		public void createTache(Tache tache) {
			Session session = factory.openSession();
			session.getTransaction().begin();
			session.save(tache);
			session.getTransaction().commit();
			session.close();
		}

		@Override
		public Tache findById(int id_tache) {
			Session session = factory.openSession();
			session.getTransaction().begin();
			Tache tache =(Tache) session.get(Tache.class, id_tache);
			session.getTransaction().commit();
			session.close();
			return tache;
		}

		@Override
		public Iterator<?> findAll() {
			Session session = factory.openSession();
			session.getTransaction().begin();
			Query query = session.createQuery("from Tache");
			Iterator<?> taches = query.getResultList().iterator();
			session.getTransaction().commit();
			session.close();
			return taches;
		}

		@Override
		public void updateTache(int id_tache,String statut_tache, Date date_debut_tache, Date date_fin_tache) {
			Session session = factory.openSession();
			session.getTransaction().begin();		
			Tache tache =(Tache) session.get(Tache.class,id_tache);
			tache.setStatut(statut_tache);
			tache.setDate_debut(date_debut_tache);
			tache.setDate_fin(date_fin_tache);
			session.update(tache);
			session.getTransaction().commit();
			session.close();
		}

		@Override
		public void deleteTache(int id_tache) {
			Session session = factory.openSession();
			session.getTransaction().begin();
			Tache tache =(Tache) session.get(Tache.class, id_tache);
			session.delete(tache);
			session.getTransaction().commit();
			session.close();
		}

		@Override
		public List<Tache> findByIdUser(int id_user) {
			Session session = factory.openSession();
			session.getTransaction().begin();
			Query query = session.createQuery("from Tache where numero_user=?");
			query.setParameter(0, id_user);
			List<Tache> taches =query.getResultList();
			return taches;
		}

		public void affecterTache(Tache tache, Utilisateur user) {
			// TODO Auto-generated method stub
			Session s = factory.getCurrentSession();
			s.beginTransaction();
			tache.setUtilisateur(user);
			s.save(tache);
			s.getTransaction().commit();
			s.close();
		}

	}


