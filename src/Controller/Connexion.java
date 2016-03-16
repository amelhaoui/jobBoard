package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import DAO.Candidat;
import DAO.Offre;
import DAO.Recruteur;
import Services.Services;

public class Connexion extends HttpServlet {
	private String ToGo;

	@Override
	// service
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession httpsession = request.getSession();

		String email = request.getParameter("email");
		String password = request.getParameter("passWord");

		SessionFactory factory = new Configuration().configure(
				"/Hibernate.cfg.xml").buildSessionFactory();
		Session session = factory.openSession();

		// search query
		String query = "from Candidat candidat where email=? and passWord=?";
		Query queryObj = session.createQuery(query);
		queryObj.setString(0, email);
		queryObj.setString(1, password);
		List<Candidat> records = queryObj.list();

		// search query
		String query1 = "from Recruteur recruteur where email=? and passWord=?";
		Query queryObj1 = session.createQuery(query1);
		queryObj1.setString(0, email);
		queryObj1.setString(1, password);
		List<Recruteur> records1 = queryObj1.list();

		if (records.size() > 0) {
			Candidat c;
			ToGo = "/JobBoard/homecandidat";
			c = records.get(0);
			// request.setAttribute("modele", c);
			request.setAttribute("loginstatus", "Login Successful.");
			httpsession.setAttribute("candidat", c);
			httpsession.setAttribute("togo", ToGo);
			getServletContext().getRequestDispatcher(
					"/WEB-INF/common/login.jsp").forward(request, response);
		} else {
			httpsession.setAttribute("candidat", null);

		}
		if (records1.size() > 0) {
			Recruteur r;
			ToGo = "/JobBoard/recserv";
			r = records1.get(0);
			// request.setAttribute("modele", r);
			request.setAttribute("loginstatus", "Login Successful.");
			httpsession.setAttribute("recruteur", r);
			httpsession.setAttribute("togo", ToGo);
			getServletContext().getRequestDispatcher(
					"/WEB-INF/common/login.jsp").forward(request, response);

			// getServletContext().getRequestDispatcher("/acceuilRecruteur.jsp").forward(request,
			// response);
		} else {
			httpsession.setAttribute("recruteur", null);

		}

		if (records.size() <= 0 && records1.size() <= 0) {
			request.setAttribute("loginstatus",
					"Username/Password do not match.");
			getServletContext().getRequestDispatcher(
					"/WEB-INF/common/login.jsp").forward(request, response);
		}
	}

}
