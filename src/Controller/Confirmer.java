package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Candidature;
import DAO.Offre;
import DAO.Recruteur;
import Services.Services;

public class Confirmer extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Services s = new Services();
		HttpSession httpsession = req.getSession();
		Recruteur r = (Recruteur) httpsession.getAttribute("recruteur");

		Long idC = Long.parseLong(req.getParameter("id"));
		// Long idO = Long.parseLong(req.getParameter("idO"));

		Candidature c = s.getCandidatureById(idC);

		c.setEtat("Confirme");
		s.updateCandidature(c);

		Recruteur recruteur = s.getRecruteurById(r.getIdUtilisateur());
		Set<Offre> ofs = new HashSet<Offre>();
		ofs = recruteur.getOffres();
		r.setOffres(ofs);

		// httpsession.setAttribute ("recruteur", r);
		resp.sendRedirect("recserv");

	}

}
