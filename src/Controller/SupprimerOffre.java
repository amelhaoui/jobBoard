package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Offre;
import DAO.Recruteur;
import Services.Services;

public class SupprimerOffre extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Services s = new Services();
		HttpSession mysession = req.getSession();

		Recruteur r = (Recruteur) mysession.getAttribute("recruteur");

		/* s.deleteOffreById(Long.parseLong(request.getParameter("idso"))); */
		Long l = Long.parseLong(req.getParameter("id"));
		Offre o = s.getOffreById(l);

		o.setEtatOffre("Expire");
		Recruteur recruteur = s.getRecruteurById2(r.getIdUtilisateur());
		Set<Offre> ofs = new HashSet<Offre>();
		ofs = recruteur.getOffres();

		ofs.remove(o);
		r.setOffres(ofs);
		recruteur.setOffres(ofs);
		// s.updateRecruteur(r);
		s.updateRecruteur(recruteur);

		mysession.setAttribute("recruteur", r);
		resp.sendRedirect("recserv");
		/**List<Offre> offres = new ArrayList<Offre>();
		// offres=s.getOffresRecruteurById(r.getIdUtilisateur());
		offres.addAll(ofs);
		req.setAttribute("offres", offres);

		req.getRequestDispatcher("/WEB-INF/AcceuilRecruteur.jsp").forward(req,
				resp);
		;**/
		
	}

	// TODO Auto-generated method stub

}
