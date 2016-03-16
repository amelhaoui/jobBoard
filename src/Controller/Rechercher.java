package Controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Candidat;
import DAO.Offre;
import DAO.Recruteur;
import Services.Services;


public class Rechercher extends HttpServlet {
	
	
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
       Services s =new Services();
       
    	//Recuperer les informations 
    	String rechercher=req.getParameter("id");
    	List<Candidat> candidats=new ArrayList<Candidat>();
    	List<Offre> offres=new ArrayList<Offre>();
    	candidats=s.rechercheCandidat(rechercher);
    	offres=s.rechercheOffre(rechercher);
    	req.setAttribute ("candidats", candidats);
    	req.setAttribute ("offres", offres);
    	
    	//str1.toLowerCase().contains(str2.toLowerCase())
    	req.getRequestDispatcher("/WEB-INF/recherche.jsp").forward(req, resp);
    	
    	
    	
    	
    	
    	
    }}