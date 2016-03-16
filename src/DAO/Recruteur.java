package DAO;

import java.util.HashSet;
import java.util.Set;



public class Recruteur {
	
	private Long idUtilisateur;
	private String nom;
	private String prenom;
	private String email;
	private String passWord;
	private String tel;
	private String nomEntreprise ;
	private String adresseEntreprise;
	private String siteWebEntreprise;
	private String villeEntreprise;
	private String paysEntreprise;
	private String codePostal;
	private String descriptionEntreprise;
	private Set<Offre> offres=new HashSet<Offre>();
	private Set<String> motsCles = new HashSet<String>();
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





//Constructeurs

public Recruteur() {
	super();}


public Recruteur(String nom, String prenom, String email, String passWord,
		String tel, String nomEntreprise, String adresseEntreprise,
		String siteWebEntreprise, String villeEntreprise,
		String paysEntreprise, String codePostal, String descriptionEntreprise,
		Set<String> motsCles) {
	super();
	this.nom = nom;
	this.prenom = prenom;
	this.email = email;
	this.passWord = passWord;
	this.tel = tel;
	this.nomEntreprise = nomEntreprise;
	this.adresseEntreprise = adresseEntreprise;
	this.siteWebEntreprise = siteWebEntreprise;
	this.villeEntreprise = villeEntreprise;
	this.paysEntreprise = paysEntreprise;
	this.codePostal = codePostal;
	this.descriptionEntreprise = descriptionEntreprise;
	this.motsCles = motsCles;
}
public Recruteur(String nom, String prenom, String email, String passWord,
		String tel, String nomEntreprise, String adresseEntreprise,
		String siteWebEntreprise, String villeEntreprise,
		String paysEntreprise, String codePostal, String descriptionEntreprise,
		Set<Offre> offres, Set<String> motsCles) {
	super();
	this.nom = nom;
	this.prenom = prenom;
	this.email = email;
	this.passWord = passWord;
	this.tel = tel;
	this.nomEntreprise = nomEntreprise;
	this.adresseEntreprise = adresseEntreprise;
	this.siteWebEntreprise = siteWebEntreprise;
	this.villeEntreprise = villeEntreprise;
	this.paysEntreprise = paysEntreprise;
	this.codePostal = codePostal;
	this.descriptionEntreprise = descriptionEntreprise;
	this.offres = offres;
	this.motsCles = motsCles;
}
//Getters and Setters

public String getNomEntreprise() {
	return nomEntreprise;
}
public void setNomEntreprise(String nomEntreprise) {
	this.nomEntreprise = nomEntreprise;
}
public String getAdresseEntreprise() {
	return adresseEntreprise;
}
public void setAdresseEntreprise(String adresseEntreprise) {
	this.adresseEntreprise = adresseEntreprise;
}
public String getSiteWebEntreprise() {
	return siteWebEntreprise;
}
public void setSiteWebEntreprise(String siteWebEntreprise) {
	this.siteWebEntreprise = siteWebEntreprise;
}
public String getVilleEntreprise() {
	return villeEntreprise;
}
public void setVilleEntreprise(String villeEntreprise) {
	this.villeEntreprise = villeEntreprise;
}
public String getPaysEntreprise() {
	return paysEntreprise;
}
public void setPaysEntreprise(String paysEntreprise) {
	this.paysEntreprise = paysEntreprise;
}
public String getCodePostal() {
	return codePostal;
}
public void setCodePostal(String codePostal) {
	this.codePostal = codePostal;
}
public String getDescriptionEntreprise() {
	return descriptionEntreprise;
}
public void setDescriptionEntreprise(String descriptionEntreprise) {
	this.descriptionEntreprise = descriptionEntreprise;
}
public Set<Offre> getOffres() {
	return offres;
}
public void setOffres(Set<Offre> offres) {
	this.offres = offres;
}
public Set<String> getMotsCles() {
	return motsCles;
}
public void setMotsCles(Set<String> motsCles) {
	this.motsCles = motsCles;
}


}