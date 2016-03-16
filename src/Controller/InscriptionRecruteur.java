package Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Candidat;
import DAO.Recruteur;
import Services.Services;

public class InscriptionRecruteur extends HttpServlet {
	public static final String VUE = "/WEB-INF/acceuil.jsp";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Services s = new Services();

		// Recuperer les informations
		String nom = req.getParameter("nom");
		String prenom = req.getParameter("prenom");
		String email = req.getParameter("email");
		String passWord = req.getParameter("passWord");
		String confirmation = req.getParameter("confirmation");
		String tel = req.getParameter("tel");
		String nomEntreprise = req.getParameter("nomEntreprise");
		String adresseEntreprise = req.getParameter("adresseEntreprise");
		String siteWebEntreprise = req.getParameter("siteWebEntreprise");
		String villeEntreprise = req.getParameter("villeEntreprise");
		String paysEntreprise = req.getParameter("paysEntreprise");
		String codePostal = req.getParameter("codePostal");
		String descriptionEntreprise = req
				.getParameter("descriptionEntreprise");
		String motsCle = req.getParameter("motsCle");

		Set<String> motsCles = new HashSet<String>();

		motsCles.add(motsCle);
		/********************************************************************/
		final String ATT_ERREURS = "erreurs";
		final String ATT_RESULTAT = "resultat";
		String resultat;
		Map<String, String> erreurs = new HashMap<String, String>();
		/* R�cup�ration des champs du formulaire. */

		/* Validation du champ email. */
		try {
			Validation.validationEmail(email);
		} catch (Exception e) {
			erreurs.put(email, e.getMessage());
		}
		/* Validation des champs mot de passe et confirmation. */
		try {
			Validation.validationMotsDePasse(passWord, confirmation);
		} catch (Exception e) {
			erreurs.put(passWord, e.getMessage());
		}

		/* Initialisation du r�sultat global de la validation. */
		if (erreurs.isEmpty()) {
			resultat = "Succ�s de l'inscription.";
		} else {
			resultat = "�chec de l'inscription.";
		}
		/*
		 * Stockage du r�sultat et des messages d'erreur dans l'objet request
		 */
		req.setAttribute(ATT_ERREURS, erreurs);
		req.setAttribute(ATT_RESULTAT, resultat);

		/****************************************************************************/
		// Creation des objets
		if (resultat == "Succ�s de l'inscription.") {
			Recruteur r = new Recruteur(nom, prenom, email, passWord, tel,
					nomEntreprise, adresseEntreprise, siteWebEntreprise,
					villeEntreprise, paysEntreprise, codePostal,
					descriptionEntreprise, motsCles);
			s.addRecruteur(r);
		}
		/* Transmission de la paire d'objets request/response � notre JSP */
		req.getRequestDispatcher(VUE).forward(req, resp);

	}
}
