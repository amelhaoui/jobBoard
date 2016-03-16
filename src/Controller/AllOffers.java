package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Offre;
import Services.Services;

public class AllOffers extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Services s = new Services();
		// String filter = req.getParameter("ville");
		List<Offre> Offres = new ArrayList<Offre>();

		// if(filter == null || filter=="")
		Offres = s.getAllOffres();
		// Offres = s.offresSuggereesByIdCandidat((long)2);
		// else
		// Offres = s.getOffresByFilter(filter);

		req.setAttribute("offres", Offres);
		req.getRequestDispatcher("/WEB-INF/offres.jsp").forward(req, resp);
	}

}
