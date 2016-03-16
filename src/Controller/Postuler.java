package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Candidat;
import DAO.Candidature;
import Services.Services;

public class Postuler extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Services s = new Services();
		HttpSession mysession = req.getSession();
		// String ou = req.getHeader("referer");
		// String[] pathParts = ou.split("/");
		String id = req.getParameter("id");
		boolean b = false;
		long idL = Long.parseLong(id);
		Calendar calendar = Calendar.getInstance();
		Candidat candidat = (Candidat) mysession.getAttribute("candidat");
		List<Candidature> mycandidatures = new ArrayList<Candidature>();
		mycandidatures.addAll(candidat.getCandidatures());
		for (Candidature C : mycandidatures) {
			if ((C.getOffre().getIdOffre()).equals(idL)) {
				b = true;
				req.setAttribute("registred", true);
				break;
			}

		}
		if (!b) {
			Candidature c = new Candidature(calendar.getTime(), "Envoye",
					s.getOffreById(idL), candidat);
			s.addCandidature(idL, c);
		}
		req.setAttribute("sucess", b);
		req.getRequestDispatcher("/offre?id=" + id).forward(req, resp);
		// resp.sendRedirect(ou+"?sucess=true");

		// TODO Auto-generated method stub

	}

}
