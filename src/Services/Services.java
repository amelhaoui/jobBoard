package Services;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import Util.HibernateUtil;
import DAO.*;

public class Services {

	public void addCandidat(Candidat c) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(c);
		session.beginTransaction().commit(); // utilisée lorsqu'on veut modifier
												// la BD
	}

	public void addRecruteur(Recruteur r) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(r);
		session.beginTransaction().commit(); // utilisée lorsqu'on veut modifier
												// la BD
	}

	public void addAdmin(Admin a) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(a);
		session.beginTransaction().commit(); // utilisée lorsqu'on veut modifier
												// la BD
	}

	public void addOffre(Offre o) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(o);
		session.flush();
		session.beginTransaction().commit(); // utilisée lorsqu'on veut modifier
												// la BD
	}



	public List<Candidat> getAllCandidats() {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createQuery("from Candidat").list();
	}

	public List<Offre> getAllOffres() {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createQuery("from Offre").list();
	}

	public List<Recruteur> getAllRecruteurs() {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createQuery("from Recruteur").list();
	}

	public List<Candidature> getAllCandidatures() {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createQuery("from Candidature").list();
	}

	public void addOffreToRecruteur(Long idO, Long idR) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();

		Offre o = (Offre) session.get(Offre.class, idO);
		Recruteur r = (Recruteur) session.get(Recruteur.class, idR);

		r.getOffres().add(o);

		session.getTransaction().commit();
	}

	public Candidat getCandidatById(Long id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.flush();
		session.clear();
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Candidat c = (Candidat) session.get(Candidat.class, id);

		return c;

	}

	public Recruteur getRecruteurById(Long id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.flush();
		session.clear();
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Recruteur r = (Recruteur) session.get(Recruteur.class, id);

		return r;

	}
	public Recruteur getRecruteurById2(Long id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.flush();
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Recruteur r = (Recruteur) session.get(Recruteur.class, id);

		return r;

	}

	public Candidature getCandidatureById(Long id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.flush();
	//	session.clear();
		try {
			Thread.sleep(1000);

		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Query query = session.createQuery("from Candidature where id= :id");
				query.setParameter("id", id);
				
	//	Candidature c = (Candidature) session.load(Candidature.class, id);
		
		return (Candidature) query.list().get(0);

	}

	public Offre getOffreById(Long id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		//session.flush();
		session.clear();
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Offre o = (Offre) session.get(Offre.class, id);
		//session.refresh(o);
		/**
		 * if (o == null) { o = new Offre(); session.save(o); }
		 **/

		return o;

	}
	

	public List<Offre> getLastOffers() {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Offre> result = session
				.createQuery("from Offre order by date desc").setMaxResults(4)
				.list();
		return result;
	}


	public void addCandidature(Long idO, Candidature c) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Offre o = getOffreById(idO);

		o.getCandidatures().add(c);
		Candidat cd = c.getCandidat();
		cd.getCandidatures().add(c);
		session.save(c);
		session.flush();
		session.beginTransaction().commit();

	}

	public void addCandidature1(Candidature c) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(c);
		session.beginTransaction().commit(); // utilisée lorsqu'on veut modifier
												// la BD
	}

	public void updateOffre(Offre o) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(o);
		session.beginTransaction().commit();

	}

	public void updateCandidat(Candidat c) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(c);
		session.beginTransaction().commit();

	}

	public void updateRecruteur(Recruteur r) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(r);
		session.beginTransaction().commit();

	}

	public void updateCandidature(Candidature c) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(c);
		session.beginTransaction().commit();

	}

	public void deleteOffreById(Long ido) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Offre o = (Offre) session.get(Offre.class, ido);

		try {
			session.delete(o);
		} catch (HibernateException e) {
			e.printStackTrace();

			session.getTransaction().rollback();

		}

		session.beginTransaction().commit();
	}

	public List<Offre> getOffresRecruteurById(Long id) {

		Recruteur r = getRecruteurById(id);

		List<Offre> offres = new ArrayList<Offre>();
		for (Offre o : r.getOffres())
			offres.add(o);
		return offres;

	}
	
	

	public List<Offre> offresSuggereesByIdCandidat(Candidat c) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.flush();
		session.clear();
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		List<String> motsCle = new ArrayList<String>();
	//	Candidat candidat = getCandidatById(id);
	//	session.refresh(candidat);
		for (String s : c.getMotsCles())
			motsCle.add(s);
		List<Recruteur> allR = getAllRecruteurs();
		List<Offre> offres = new ArrayList<Offre>();
		for (Recruteur r : allR) {
			session.refresh(r);
			Set<Offre> Of = r.getOffres();
			List<Offre> Ofc = new ArrayList<Offre>();
			Ofc.addAll(Of);
			for (Offre o : Ofc) {
				for (String s : o.getMotsCles())
					if (motsCle.contains(s)) {
						offres.add(o);
						break;
					}

			}
		}
			
		return offres;
	}

	public Recruteur recruteurDeloffreByIdOffre(Long id) {
		List<Recruteur> allR = getAllRecruteurs();
		Recruteur r1;
		Long i = 100L;
		for (Recruteur r : allR) {
			for (Offre o : r.getOffres()) {
				if (o.getIdOffre().equals(id))
					i = r.getIdUtilisateur();
			}
		}
		r1 = getRecruteurById(i);
		return r1;

	}

	public List<Offre> getAllOffresRecruteursByIdCandidat(Long id) {

		List<Offre> offres = new ArrayList<Offre>();
		List<Recruteur> allR = getAllRecruteurs();
		for (Recruteur r : allR) {
			for (Offre o : r.getOffres()) {
				offres.add(o);
			}
		}
		return offres;

	}

	public List<Offre> rechercheOffre(String mot) {
		List<Offre> offres = new ArrayList<Offre>();
		List<Offre> offres1 = new ArrayList<Offre>();
		offres1 = getAllOffresRecruteursByIdCandidat(1L);
		for (Offre o : offres1) {
			if (o.getDescription().toLowerCase().contains(mot.toLowerCase())) {
				offres.add(o);
				continue;
			}
			if (o.getTitre().toLowerCase().contains(mot.toLowerCase())) {
				offres.add(o);
				continue;
			}
			if (o.getMotsCles().contains(mot.toLowerCase())) {
				offres.add(o);
				continue;
			}

		}
		return offres;
		// str1.toLowerCase().contains(str2.toLowerCase())

	}

	public List<Candidat> rechercheCandidat(String mot) {
		List<Candidat> candidats = new ArrayList<Candidat>();
		List<Candidat> candidats1 = new ArrayList<Candidat>();
		candidats1 = getAllCandidats();

		for (Candidat c : candidats1) {
			if (c.getDescription() != null)
				if (c.getDescription().toLowerCase()
						.contains(mot.toLowerCase())) {
					candidats.add(c);
					continue;
				}
			if (c.getSpecialites() != null)
				if (c.getSpecialites().toLowerCase()
						.contains(mot.toLowerCase())) {
					candidats.add(c);
					continue;
				}
			if (c.getDiplomes() != null)
				if (c.getDiplomes().contains(mot.toLowerCase())) {
					candidats.add(c);
					continue;
				}
			if (c.getPays() != null)
				if (c.getPays().toLowerCase().contains(mot.toLowerCase())) {
					candidats.add(c);
					continue;
				}
			if (c.getVille() != null)
				if (c.getVille().toLowerCase().contains(mot.toLowerCase())) {
					candidats.add(c);
					continue;
				}
			if (c.getMotsCles() != null)
				if (c.getMotsCles().contains(mot.toLowerCase())) {
					candidats.add(c);
					continue;
				}
		}

		return candidats;

	}

}
