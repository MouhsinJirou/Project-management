package test;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import beans.Utilisateur;
import dao.UtilisateurDao;
import daoImp.Util;
import daoImp.UtilisateurDaoImp;

public class Test {
	public static void main(String[] args) {
	
		/*
		Utilisateur user1 =new Utilisateur(2,"aaa","bbb,","mdp2","admin@gmail.com","Administrateur");
		 Utilisateur user2 =new Utilisateur(3,"chef","projet,","mdp3","chef@gmail.com","Chefdeprojet");
 */
		 UtilisateurDaoImp dao = new UtilisateurDaoImp();
//		dao.createUser(user1);
//		dao.createUser(user2);
		// dao.updateUser(3, "ahmed", "kech", "Employé", "12345", "ahmed@gmail.com");
	}
}
