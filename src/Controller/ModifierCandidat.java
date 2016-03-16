package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import DAO.Candidat;
import DAO.Candidature;
import DAO.Fichier;
import DAO.Offre;
import DAO.Recruteur;
import Services.Services;

public class ModifierCandidat extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Services s = new Services();
		HttpSession mysession = req.getSession();
		Candidat candidat = (Candidat) mysession.getAttribute("candidat");
		String OldCv = candidat.getCvChemin();
		String nom = req.getParameter("nom");
		String prenom = req.getParameter("prenom");
		String email = req.getParameter("email");
		String motcles = req.getParameter("skills");
		motcles = motcles.toLowerCase();
		String tel = req.getParameter("tel");
		String ville = req.getParameter("ville");
		String codePostal = req.getParameter("codePostal");
		String pays = req.getParameter("pays");
		String specialites = req.getParameter("specialite");
		String description = req.getParameter("description");

		/** traitement mot cles **/
		List<String> items = Arrays.asList(motcles.split("\\s*,\\s*"));
		Set<String> Mcles = new HashSet<String>();
		Mcles.addAll(items);
		/**/

		Candidat c = s.getCandidatById(candidat.getIdUtilisateur());
		c.setCodePostal(codePostal);
		c.setDescription(description);
		c.setPrenom(prenom);
		c.setNom(nom);
		c.setEmail(email);
		c.setPays(pays);
		c.setSpecialites(specialites);
		c.setTel(tel);
		c.setVille(ville);
		c.setMotsCles(Mcles);

		/********************** Traitement CV *********************************/
		/*
		 * Lecture du paramètre 'chemin' passé à la servlet via la déclaration
		 * dans le web.xml
		 */
		String name = null;

		String chemin = this.getServletConfig().getInitParameter("chemin");

		/* Préparation de l'objet formulaire */
		UploadForm form = new UploadForm();

		/* Traitement de la requête et récupération du bean en résultant */
		Fichier fichier = form.enregistrerFichier(req, chemin);

		/***************************************************/

		Part part = req.getPart("fichier");
		/* Boucle sur chacun des paramètres de l'en-tête "content-disposition". */
		for (String contentDisposition : part.getHeader("content-disposition")
				.split(";")) {
			/* Recherche de l'éventuelle présence du paramètre "filename". */
			if (contentDisposition.trim().startsWith("filename")) {
				/*
				 * Si "filename" est présent, alors renvoi de sa valeur,
				 * c'est-à-dire du nom de fichier sans guillemets.
				 */
				name = contentDisposition
						.substring(contentDisposition.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}

		System.out.println("voilaaaaaaaaaaaaaaaa\n" + name);
		String cvChemin = "http://localhost:8080/JobBoard/CVs/" + name;
		if (!name.isEmpty()) {
			c.setCvChemin(cvChemin);
		} else
			c.setCvChemin(OldCv);
		/****************************************************/
		/* Stockage du formulaire et du bean dans l'objet request */
		req.setAttribute("form", form);
		req.setAttribute("fichier", fichier);

		/********************************************************************/

		s.updateCandidat(c);

		Candidat c1 = s.getCandidatById(candidat.getIdUtilisateur());
		// to be forward to AcceuilCandidat Servlet
		if (c1 != null) {
			Iterator<Candidature> list1 = c1.getCandidatures().iterator();
			req.setAttribute("candidatures", list1);
		}
		mysession.setAttribute("candidat", c1);
		req.setAttribute("filename", c1.getCvChemin()); //FindBugs a raison, c1.getCvChemin ne check pas si
														// si c1.getCvChemin() est NULL ou pas 

		// Candidat
		// c1=s.getCandidatById(Long.parseLong(req.getParameter("id")));
		// req.setAttribute ("modele", c1);
		// List<Offre> offres = new ArrayList<Offre>();
		// offres=s.offresSuggereesByIdCandidat(c.getIdUtilisateur());
		// req.setAttribute("offres", offres);

		resp.sendRedirect("homecandidat");
		// req.getRequestDispatcher("/WEB-INF/AcceuilCandidat.jsp").forward(req,
		// resp);

	}
}
