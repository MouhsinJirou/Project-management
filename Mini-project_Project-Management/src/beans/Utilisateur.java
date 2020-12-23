package beans;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;





@Entity
@Table(name="utilisateur")
public class Utilisateur {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="numero_user",length=50)
	private int numero_user; //(AI)
	
	@Column(name="nom",length=50)
	private String nom;
	@Column(name="prenom",length=50)
	private String prenom;
	@Column(name="email",length=50)
	private String email;
	@Column(name="mot_passe",length=50)
	private String mot_passe;
	@Column(name="role",length=50)
	private String role;
	
	@OneToMany(mappedBy="utilisateur")
	List<Tache> tachesUtilisateur;

	
	

	
	
	public Utilisateur() {
		tachesUtilisateur=new ArrayList<Tache>();
	}
	public Utilisateur(int a,String b,String f,String c,String d,String e) {
		
		this.numero_user=a;
		this.nom=b;
		this.prenom=f;
		this.mot_passe=c;
		this.email=d;
		this.role=e;
			
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMot_passe() {
		return mot_passe;
	}

	public void setMot_passe(String mot_passe) {
		this.mot_passe = mot_passe;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public List<Tache> getTachesUtilisateur() {
		return tachesUtilisateur;
	}

	public void setTachesUtilisateur(List<Tache> tachesUtilisateur) {
		this.tachesUtilisateur = tachesUtilisateur;
	}

	public int getNumero_user() {
		return numero_user;
	}
	
	//Ajout et supp des taches
	/*
	public void ajouterTache(Tache T) {
		tachesUtilisateur.add(T);
	}
	public void supprimerTache(Tache T) {
		tachesUtilisateur.remove(T);
	}
	*/
}
