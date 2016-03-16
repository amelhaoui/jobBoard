package Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Set;

import DAO.Offre;
import DAO.Recruteur;
import Services.Services;

public class ModifierOffre extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Services s = new Services();
		HttpSession httpsession = req.getSession();
		Recruteur r = (Recruteur) httpsession.getAttribute("recruteur");
		String id = req.getParameter("id");
		Long l = Long.parseLong(id);
		Set<Offre> RecOffres = new HashSet<Offre>();
		RecOffres = r.getOffres();
		Offre o = null;
		for (Offre s : RecOffres) {
			Long L = s.getIdOffre();
			if (L.equals(l)) {
				o = s;
				break;
			}
		}
		// Offre o = s.getOffreById(l);
		req.setAttribute("offre", o);
		req.getRequestDispatcher("/WEB-INF/modifier_offre.jsp").forward(req,
				resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		Services s = new Services();
		HttpSession httpsession = req.getSession();
		Recruteur r = (Recruteur) httpsession.getAttribute("recruteur");
		// Recruteur recruteur = s.getRecruteurById(r.getIdUtilisateur());
		Long l = Long.parseLong(req.getParameter("id"));
		Offre o = s.getOffreById(l);
		if (o == null) {
			Set<Offre> RecOffres = new HashSet<Offre>();
			RecOffres = r.getOffres();
			// Offre o = null;
			for (Offre s1 : RecOffres) {
				Long L = s1.getIdOffre();
				if (L.equals(l)) {
					o = s1;
					break;
				}
			}
		}
		// Recuperer les informations
		/**
		 * Date expiration=new Date(); try { expiration = new
		 * SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("expiration"));
		 * } catch (java.text.ParseException e) { // TODO Auto-generated catch
		 * block e.printStackTrace(); } // String description =
		 * req.getParameter("description");
		 * 
		 * o.setExpiration(expiration);
		 **/
		String titre = req.getParameter("titre");
		o.setTitre(titre);
		// o.setDescription(description);

		s.updateOffre(o);
		Recruteur recruteur = s.getRecruteurById(r.getIdUtilisateur());
		s.updateRecruteur(recruteur);
		r.setOffres(recruteur.getOffres());

		httpsession.setAttribute("recruteur", recruteur);
		resp.sendRedirect("recserv");

	}

}
