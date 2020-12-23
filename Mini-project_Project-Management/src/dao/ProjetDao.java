package dao;

import java.util.Iterator;
import java.util.List;

import beans.Projet;

public interface ProjetDao {
	public void createProjet(Projet projet);

	public Projet findById(String code_pro);
	
	public List<Projet> findAll();
	
	public void updateProjet(String code_pro,String intit_pro,String description_pro,String statut,int charge_horaire_pro);

	public void deleteProjet(String code_pro);
	public List<Projet> getAllProjets(int idChefProjet);
}