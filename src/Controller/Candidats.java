package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Candidat;
import Services.Services;

public class Candidats extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Services s = new Services();
		List<Candidat> candidats = s.getAllCandidats();
		req.setAttribute("candidates", candidats);
		req.getRequestDispatcher("/WEB-INF/candidats.jsp").forward(req, resp);

	}

}
