package DAO;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Offre {
private Long idOffre;
private String titre;
private Date date;
private String description;
private String ville;
private String etatOffre;
private String entreprise;
private Date expiration;
private Set<String> motsCles = new HashSet<String>();
private Set<Candidature> candidatures = new HashSet<Candidature>();
private Recruteur recruteur;

//Constructeurs

public Offre() {
	super();
}

public Offre(String titre, Date date, String description, String etatOffre,
		Date expiration, Set<String> motsCles, String ville, String entreprise, Recruteur idR) {
	super();
	this.titre = titre;
	this.date = date;
	this.description = description;
	this.etatOffre = etatOffre;
	this.expiration = expiration;
	this.motsCles = motsCles;
	this.ville=ville;
	this.entreprise= entreprise;
	this.recruteur = idR;
	
}

public Offre(Long idOffre, String titre, Date date, String description,
		String etatOffre, Date expiration, Set<String> motsCles) {
	super();
	this.idOffre = idOffre;
	this.titre = titre;
	this.date = date;
	this.description = description;
	this.etatOffre = etatOffre;
	this.expiration = expiration;
	this.motsCles = motsCles;
}

//Getters and Setters



public Long getIdOffre() {
	return idOffre;
}
public Recruteur getRecruteur() {
	return recruteur;
}

public void setRecruteur(Recruteur idR) {
	this.recruteur = idR;
}

public String getEntreprise() {
	return entreprise;
}

public void setEntreprise(String entreprise) {
	this.entreprise = entreprise;
}

public void setIdOffre(Long idOffre) {
	this.idOffre = idOffre;
}
public String getTitre() {
	return titre;
}
public void setTitre(String titre) {
	this.titre = titre;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getEtatOffre() {
	return etatOffre;
}
public void setEtatOffre(String etatOffre) {
	this.etatOffre = etatOffre;
}
public Date getExpiration() {
	return expiration;
}
public void setExpiration(Date expiration) {
	this.expiration = expiration;
}
public Set<String> getMotsCles() {
	return motsCles;
}
public void setMotsCles(Set<String> motsCles) {
	this.motsCles = motsCles;
}

public Set<Candidature> getCandidatures() {
	return candidatures;
}
public void setCandidatures(Set<Candidature> candidatures) {
	this.candidatures = candidatures;
}
public String getVille() {
	return ville;
}

public void setVille(String ville) {
	this.ville = ville;
}

}