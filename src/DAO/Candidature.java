package DAO;

import java.util.Date;


public class Candidature {
	
private Long idCandidature;	
private Date date;
private String etat;
private Offre offre;
private Candidat candidat;



//Constructeurs


public Candidature() {
	super();
}

public Candidature(Date date, String etat, Offre offre, Candidat candidat) {
	super();
	this.date = date;
	this.etat = etat;
	this.offre = offre;
	this.candidat = candidat;
}

public Candidature(Long idCandidature, Date date, String etat, Offre offre,
		Candidat candidat) {
	super();
	this.idCandidature = idCandidature;
	this.date = date;
	this.etat = etat;
	this.offre = offre;
	this.candidat = candidat;
}

//Getters and Setters

public Long getIdCandidature() {
	return idCandidature;
}
public void setIdCandidature(Long idCandidature) {
	this.idCandidature = idCandidature;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
public String getEtat() {
	return etat;
}
public void setEtat(String etat) {
	this.etat = etat;
}
public Offre getOffre() {
	return offre;
}
public void setOffre(Offre offre) {
	this.offre = offre;
}
public Candidat getCandidat() {
	return candidat;
}
public void setCandidat(Candidat candidat) {
	this.candidat = candidat;
}



}