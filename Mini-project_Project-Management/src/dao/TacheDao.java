package dao;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import beans.Tache;
import beans.Utilisateur;



public interface TacheDao {

	public void createTache(Tache tache);

	public Tache findById(int id_tache);

	public List<Tache> findByIdUser(int id_user);
	

	public Iterator<?> findAll();

	public void updateTache(int id_tache,String statut_tache, Date date_debut_tache, Date date_fin_tache);

	public void deleteTache(int id_tache);
	
	public void affecterTache(Tache tache, Utilisateur user);
}
