package DAO;

public class Utilisateur {
	private Long idUtilisateur;
	private String nom;
	private String prenom;
	private String email;
	private String passWord;
	private String tel;
	
	//Constructeurs
	
	public Utilisateur() {
		super();
	}
	public Utilisateur(String nom, String prenom, String email,
			String passWord, String tel) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.passWord = passWord;
		this.tel = tel;
	}
	
	//Getters and Setters
	
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
	
}
