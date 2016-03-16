package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Candidat;
import Services.Services;

public class CandidatDetails extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");
		Services s = new Services();
		Long l = Long.parseLong(id);

		Candidat c = s.getCandidatById(l);
		req.setAttribute("candidat", c);

		getServletContext().getRequestDispatcher(
				"/WEB-INF/candidat_details.jsp").forward(req, resp);

	}

}
