package DAO;

public class Fichier {
	 private String description;
     private String nom;
     private String chemin;
//constructeur
     
public Fichier(String description, String nom, String chemin) {
		super();
		this.description = description;
		this.nom = nom;
		this.chemin = chemin;
	}
public Fichier() {
	super();
}
public Fichier(String description, String nom) {
	super();
	this.description = description;
	this.nom = nom;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getNom() {
	return nom;
}
public void setNom(String nom) {
	this.nom = nom;
}
public String getChemin() {
	return chemin;
}
public void setChemin(String chemin) {
	this.chemin = chemin;
}
     

}
