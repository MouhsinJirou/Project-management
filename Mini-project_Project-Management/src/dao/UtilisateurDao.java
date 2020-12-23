package dao;

import java.util.Iterator;

import beans.Utilisateur;
import java.util.List;

public interface UtilisateurDao {
	
		public void createUser(Utilisateur utilisateur);

		public Utilisateur findById(int id_user);
		public Utilisateur findByEmailPassword(String email,String password);

		public List<Utilisateur> findAll();

		public void updateUser(int id_user, String nom_user, String prenom_user, String role_user, String mot_passe_user,
				String email_user);

		public void deleteUser(int id_empl);
	}


