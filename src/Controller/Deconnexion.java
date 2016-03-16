package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Deconnexion extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();

		// if(session.getAttribute("recruteur")!= null){
		session.setAttribute("recruteur", null);
		// }
		// if(session.getAttribute("candidat")!= null){
		session.setAttribute("candidat", null);
		// }

		// req.getRequestDispatcher("/WEB-INF/acceuil.jsp").forward(req, resp);
		resp.sendRedirect("home");

		// TODO Auto-generated method stub
	}

}
