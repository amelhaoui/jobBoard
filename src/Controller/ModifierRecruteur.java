package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Candidat;
import DAO.Offre;
import DAO.Recruteur;
import Services.Services;

public class ModifierRecruteur extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Services s = new Services();
		HttpSession mysession = req.getSession();
		Recruteur recruteur = (Recruteur) mysession.getAttribute("recruteur");

		// Recuperer les informations
		String nom = req.getParameter("nom");
		String prenom = req.getParameter("prenom");
		String email = req.getParameter("email");

		String tel = req.getParameter("tel");
		String nomEntreprise = req.getParameter("nomEntreprise");
		String adresseEntreprise = req.getParameter("adresseEntreprise");
		String siteWebEntreprise = req.getParameter("siteWebEntreprise");
		String villeEntreprise = req.getParameter("villeEntreprise");
		String paysEntreprise = req.getParameter("paysEntreprise");
		String codePostal = req.getParameter("codePostal");
		String descriptionEntreprise = req
				.getParameter("descriptionEntreprise");

		Recruteur r = s.getRecruteurById(recruteur.getIdUtilisateur());
		r.setNom(nom);
		r.setPrenom(prenom);
		r.setEmail(email);
		r.setTel(tel);
		r.setNomEntreprise(nomEntreprise);
		r.setAdresseEntreprise(adresseEntreprise);
		r.setDescriptionEntreprise(descriptionEntreprise);
		r.setPaysEntreprise(paysEntreprise);
		r.setVilleEntreprise(villeEntreprise);
		r.setCodePostal(codePostal);

		s.updateRecruteur(r);

		r = s.getRecruteurById(recruteur.getIdUtilisateur());
		mysession.setAttribute("recruteur", r);

		// List<Offre> offres = new ArrayList<Offre>();
		// offres=s.getOffresRecruteurById(r.getIdUtilisateur());
		// req.setAttribute("offres", offres);

		// req.getRequestDispatcher("/WEB-INF/AcceuilRecruteur.jsp").forward(req,
		// resp);
		resp.sendRedirect("recserv");

	}
}
