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
import javax.servlet.http.HttpSession;

import DAO.Candidat;
import DAO.Fichier;
import Services.Services;

public class InscriptionCandidat extends HttpServlet {
	public static final String VUE = "inscriptionCandidat.jsp";
	// Parametres cv
	public static final String CHEMIN = "chemin";
	public static final String ATT_FICHIER = "fichier";
	public static final String ATT_FORM = "form";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Services s = new Services();

		HttpSession mysession = req.getSession();
		// Recuperer les informations
		String nom = req.getParameter("nom");
		String prenom = req.getParameter("prenom");
		String email = req.getParameter("email");
		String passWord = req.getParameter("passWord");
		String confirmation = req.getParameter("confirmation");
		String tel = req.getParameter("tel");
		String ville = req.getParameter("ville");
		String codePostal = req.getParameter("codePostal");
		String pays = req.getParameter("pays");
		String specialites = req.getParameter("specialites");
		String description = req.getParameter("description");
		String diplome = req.getParameter("diplome");
		String motsCle = req.getParameter("motsCle");
		Set<String> diplomes = new HashSet<String>();
		Set<String> motsCles = new HashSet<String>();
		diplomes.add(diplome);
		motsCles.add(motsCle);
		/********************** Traitement CV *********************************/
		/*
		 * Lecture du param�tre 'chemin' pass� � la servlet via la d�claration
		 * dans le web.xml
		 */
		String chemin = this.getServletConfig().getInitParameter(CHEMIN);

		/* Pr�paration de l'objet formulaire */
		UploadForm form = new UploadForm();

		/* Traitement de la requ�te et r�cup�ration du bean en r�sultant */
		Fichier fichier = form.enregistrerFichier(req, chemin);

		/* Stockage du formulaire et du bean dans l'objet request */
		req.setAttribute(ATT_FORM, form);
		req.setAttribute(ATT_FICHIER, fichier);
		/********************************************************************/
		final String ATT_RESULTAT = "resultat";
		final String ATT_ERREURS = "erreurs";

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
		// this.getServletContext().getRequestDispatcher( VUE ).forward( req,
		// resp);
		/****************************************************************************/
		// Creation des objets
		if (resultat == "Succ�s de l'inscription.") {
			Candidat c = new Candidat(nom, prenom, email, passWord, tel, ville,
					codePostal, pays, specialites, description, diplomes,
					motsCles);
			s.addCandidat(c);
			// mysession.setAttribute("candidat", c);
			// req.setAttribute("togo", "homecandidat");
		}

		/* Transmission de la paire d'objets request/response � notre JSP */
		req.getRequestDispatcher("/WEB-INF/acceuil.jsp").forward(req, resp);
	}
	// this.getServletContext().getRequestDispatcher( VUE ).forward( req, resp);

}
