package Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Candidat;
import DAO.Candidature;
import DAO.Offre;
import DAO.Recruteur;
import Services.Services;

public class AcceuilCandidat extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

  HttpSession httpsession = req.getSession();
		Candidat c = (Candidat) httpsession.getAttribute("candidat");
		Services s = new Services();

		if (c != null) {
			Iterator<Candidature> list1 = c.getCandidatures().iterator();
			List<Offre> result = s.offresSuggereesByIdCandidat(c);
			Set<String> SetSkills = c.getMotsCles();
			String skills = "";
			for (String str : SetSkills)
				skills +=  str.toUpperCase() + ", ";
			req.setAttribute("skills", skills);
			req.setAttribute("candidatures", list1);
			if( c.getCvChemin() != null){
			File p = new File(c.getCvChemin());
			String file = p.getName();
			req.setAttribute("filename", file);
			}
			req.setAttribute("result", result);
		}

		req.getRequestDispatcher("/WEB-INF/AcceuilCandidat.jsp").forward(req,
				resp);

		// TODO Auto-generated method stub
	}

}
