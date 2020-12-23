package beans;

import java.util.Date;
import javax.persistence.ManyToOne;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
//import java.sql.Date;
@Entity
@Table(name="tache")
public class Tache {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="numero_tache",length=50)
	private int numero_tache; //(AI)
	public int getNumero_tache() {
		return numero_tache;
	}


	public void setNumero_tache(int numero_tache) {
		this.numero_tache = numero_tache;
	}

	@Column(name="description",length=50)
	private String description;
	@Column(name="duree",length=50)
	private int duree;
	@Column(name="statut",length=50)
	private String statut;
	@Column
	private Date date_debut;
	@Column
	private Date date_fin;
	
	@ManyToOne()
	@JoinColumn(name="numero_user")
	private Utilisateur utilisateur;
	
	@ManyToOne()
	@JoinColumn(name="code_projet")
	private Projet projet;

	

	public Tache() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getDuree() {
		return duree;
	}

	public void setDuree(int duree) {
		this.duree = duree;
	}

	public String getStatut() {
		return statut;
	}

	public void setStatut(String statut) {
		this.statut = statut;
	}

	public Date getDate_debut() {
		return date_debut;
	}

	public void setDate_debut(Date date_debut) {
		this.date_debut = date_debut;
	}

	public Date getDate_fin() {
		return date_fin;
	}

	public void setDate_fin(Date date_fin) {
		this.date_fin = date_fin;
	}

	public Utilisateur getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}

	public int getNumero() {
		return numero_tache;
	}
	
	
	public Projet getProjet() {
		return projet;
	}

	public void setProjet(Projet projet) {
		this.projet = projet;
	}
	
	
}
