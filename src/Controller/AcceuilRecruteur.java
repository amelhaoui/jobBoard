package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import DAO.Offre;
import DAO.Recruteur;
import Services.Services;
import Util.HibernateUtil;

public class AcceuilRecruteur extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Services s = new Services(); // FindBugs a raison, nous n'avons pas utilise s par la suite 
		HttpSession httpsession = req.getSession();
		Recruteur r = (Recruteur) httpsession.getAttribute("recruteur");
		if (r == null) {
			resp.sendRedirect("home");
		} else {
			// Recruteur recruteur = s.getRecruteurById(r.getIdUtilisateur());
			// begin transaction
			// Session session=
			// HibernateUtil.getSessionFactory().getCurrentSession();
			// session.beginTransaction();
			List<Offre> offres = new ArrayList<Offre>();
			// offres = s.getOffresRecruteurById(r.getIdUtilisateur());
			// r = (Recruteur) httpsession.getAttribute("recruteur");
			// List<Offre> offres = new ArrayList<Offre>();
			offres.addAll(r.getOffres());
			req.setAttribute("offres", offres);

			req.getRequestDispatcher("/WEB-INF/AcceuilRecruteur.jsp").forward(
					req, resp);
		}
		// TODO Auto-generated method stub
	}

}
