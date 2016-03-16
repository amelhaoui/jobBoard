package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Offre;
import Services.Services;

public class DetailsOffre extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// String pathInfo = req.getPathInfo(); // /{value}/test
		// String[] pathParts = pathInfo.split("/");
		String id = req.getParameter("id");		
		Services s = new Services();
		Long l = Long.parseLong(id);
		Offre offre = s.getOffreById(l);
		List<Offre> offre_entreprise = new ArrayList<Offre>();
		if(offre !=null){
			 offre_entreprise = s.getOffresRecruteurById(offre.getRecruteur().getIdUtilisateur());}
		req.setAttribute("offre", offre);
		req.setAttribute("registred", false);
		req.setAttribute("sucess", true);
		req.setAttribute("offre_entreprise", offre_entreprise);

		getServletContext().getRequestDispatcher("/WEB-INF/offre_details.jsp")
				.forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// String pathInfo = req.getPathInfo(); // /{value}/test
		// String[] pathParts = pathInfo.split("/");
		String id = req.getParameter("id");
		Services s = new Services();
		Offre offre = s.getOffreById((long) Integer.parseInt(id));
		req.setAttribute("offre", offre);
		getServletContext().getRequestDispatcher("/WEB-INF/offre_details.jsp")
				.forward(req, resp);
	}

}
