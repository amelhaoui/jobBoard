package DAO;

import java.util.HashSet;
import java.util.Set;

public class Candidat {
	
	private Long idUtilisateur;
	private String nom;
	private String prenom;
	private String email;
	private String passWord;
	private String tel;
private String ville;
private String codePostal;
private String pays;
private String specialites;
private String description;
private String cvChemin;

private Set<String> diplomes = new HashSet<String>();
private Set<String> motsCles = new HashSet<String>();
private Set<Candidature>candidatures=new HashSet<Candidature>();

//Constructeurs


public Candidat() {
	super();
}



public Candidat(String nom, String prenom, String email, String passWord,
		String tel, String ville, String codePostal, String pays,
		String specialites, String description,  Set<String> diplomes,
		Set<String> motsCles) {
	super();
	this.nom = nom;
	this.prenom = prenom;
	this.email = email;
	this.passWord = passWord;
	this.tel = tel;
	this.ville = ville;
	this.codePostal = codePostal;
	this.pays = pays;
	this.specialites = specialites;
	this.description = description;
	this.diplomes = diplomes;
	this.motsCles = motsCles;
	
}
//Getters and Setters

public String getCvChemin() {
	return cvChemin;
}
public void setCvChemin(String cvChemin) {
	this.cvChemin = cvChemin;
}
public Long getIdUtilisateur() {
	return idUtilisateur;
}
public void setIdUtilisateur(Long idUtilisateur) {
	this.idUtilisateur = idUtilisateur;
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
public String getPassWord() {
	return passWord;
}
public void setPassWord(String passWord) {
	this.passWord = passWord;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public String getVille() {
	return ville;
}
public void setVille(String ville) {
	this.ville = ville;
}
public String getCodePostal() {
	return codePostal;
}
public void setCodePostal(String codePostal) {
	this.codePostal = codePostal;
}
public String getPays() {
	return pays;
}
public void setPays(String pays) {
	this.pays = pays;
}
public String getSpecialites() {
	return specialites;
}
public void setSpecialites(String specialites) {
	this.specialites = specialites;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public Set<String> getDiplomes() {
	return diplomes;
}
public void setDiplomes(Set<String> diplomes) {
	this.diplomes = diplomes;
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

}
