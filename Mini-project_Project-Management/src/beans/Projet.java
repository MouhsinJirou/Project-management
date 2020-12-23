package beans;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="projet")
public class Projet  {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="code_projet",length=50)
	private int code_projet;
	@Column(name="intitule",length=50)
	private String intitule;
	@Column(name="description",length=50)
	private String description;
	@Column(name="statut",length=50)
	private String statut;
	@Column(name="charge_horaire",length=50)
	private int charge_horaire;
	
	@OneToMany(mappedBy="projet")
	List<Tache> tachesProjet;
	
	
	 

	

	public Projet() {
		tachesProjet=new ArrayList<Tache>();

	}

	public String getIntitule() {
		return intitule;
	}

	public void setIntitule(String intitule) {
		this.intitule = intitule;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatut() {
		return statut;
	}

	public void setStatut(String statut) {
		this.statut = statut;
	}

	public int getCharge_horaire() {
		return charge_horaire;
	}

	public void setCharge_horaire(int charge_horaire) {
		this.charge_horaire = charge_horaire;
	}

	public List<Tache> getTachesProjet() {
		return tachesProjet;
	}

	public void setTachesProjet(List<Tache> tachesProjet) {
		this.tachesProjet = tachesProjet;
	}

	public int getCode_projet() {
		return code_projet;
	}
	
	
}

	