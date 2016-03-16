package Controller;

import java.io.IOException;
import java.sql.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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

public class NouvelleOffre extends HttpServlet {
	public static final String VUE = "/WEB-INF/nouvelleOffre.jsp";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher(VUE).forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Services s = new Services();

		HttpSession mysession = req.getSession();
		Recruteur r = (Recruteur) mysession.getAttribute("recruteur");

		// Recuperer les informations
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		String dateInString = req.getParameter("expiration");
		Date expiration = null;
		try {

			expiration = formatter.parse(dateInString);
			System.out.println(expiration);
			System.out.println(formatter.format(expiration));

		} catch (ParseException e) {
			e.printStackTrace();
		}

		String titre = req.getParameter("titre");
		String ville = req.getParameter("ville");
		String entreprise = req.getParameter("nomEntreprise");
		String description = req.getParameter("description");
		String[] motsCle = req.getParameterValues("motCles");
		String etatOffre = "Active";

		Set<String> motsCles = new HashSet<String>();
		for (String m : motsCle)
			motsCles.add(m);

		/********** Recuperation date actuelle ******************/
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();

		/******************************************************************/
		// final String ATT_ERREURS = "erreurs";
		// final String ATT_RESULTAT = "resultat";
		// String resultat;
		// Map<String, String> erreurs = new HashMap<String, String>();

		/* Initialisation du r�sultat global de la validation. */

		// String resultat = "Offre ajoutee.";

		// req.setAttribute( ATT_ERREURS, erreurs );
		// req.setAttribute( ATT_RESULTAT, resultat );

		/****************************************************************************/
		// Creation des objets

		Offre o = new Offre(titre, date, description, etatOffre, expiration,
				motsCles, ville, entreprise, r);
		s.addOffre(o);
		s.addOffreToRecruteur(o.getIdOffre(), r.getIdUtilisateur());
		/* Transmission de la paire d'objets request/response � notre JSP */
		// mysession.setAttribute("recruteur", r);
		// Recruteur recruteur = s.getRecruteurById(r.getIdUtilisateur());
		// s.updateRecruteur(recruteur);
		r.getOffres().add(o);
		mysession.setAttribute("recruteur", r);
		// Set<Offre> offres = new HashSet<Offre>();
		// A quoi bon ??
		// offres = recruteur.getOffres();
		// req.setAttribute("offres", offres);
		resp.sendRedirect("recserv");

		// req.getRequestDispatcher("/WEB-INF/AcceuilRecruteur.jsp").forward(req,
		// resp);

	}
}
