package eu.telecom_bretagne.cabinet_recrutement.front.controlesDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.CandidatureDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.EntrepriseDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.NiveauQualificationDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.OffreEmploiDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.SecteurActiviteDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise;
import eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification;
import eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite;
import eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator;
import eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocatorException;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/ControlesDAO")
public class ControlesDAOServlet extends HttpServlet
{
  //-----------------------------------------------------------------------------
  private static final long serialVersionUID = 1L;
  //-----------------------------------------------------------------------------
  /**
   * @see HttpServlet#HttpServlet()
   */
  public ControlesDAOServlet()
  {
    super();
  }
  //-----------------------------------------------------------------------------
  /**
   * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
   */
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
    // Flot de sortie pour écriture des résultats.
    PrintWriter out = response.getWriter();
    
    // Récupération de la réféence vers le(s) DAO(s)
    EntrepriseDAO entrepriseDAO = null;
    CandidatureDAO candidatureDAO = null;
    NiveauQualificationDAO niveauDAO = null;
    OffreEmploiDAO offreDAO = null;
    SecteurActiviteDAO secteurDAO = null;
    
    try
    {
      entrepriseDAO = (EntrepriseDAO) ServicesLocator.getInstance().getRemoteInterface("EntrepriseDAO");
      candidatureDAO = (CandidatureDAO) ServicesLocator.getInstance().getRemoteInterface("CandidatureDAO");
      niveauDAO = (NiveauQualificationDAO) ServicesLocator.getInstance().getRemoteInterface("NiveauQualificationDAO");
      offreDAO = (OffreEmploiDAO) ServicesLocator.getInstance().getRemoteInterface("OffreEmploiDAO");
      secteurDAO = (SecteurActiviteDAO) ServicesLocator.getInstance().getRemoteInterface("SecteurActiviteDAO");
    }
    catch (ServicesLocatorException e)
    {
      e.printStackTrace();
    }
    out.println("Contrôles de fonctionnement du DAO EntrepriseDAO");
    out.println();
    
    // Contrôle(s) de fonctionnalités.
    
    //-------------------------  Test sur DAO Entreprise -----------------------------------
    	out.println("Liste des entreprises :");
        List<Entreprise> entreprises = entrepriseDAO.findAll();
        
        for(Entreprise entreprise : entreprises)
        {
          out.println(entreprise.getNom());
        }
        out.println();
        
        for(Entreprise e : entreprises){
        	out.println("Obtention de l'entreprise n° "+e.getIdEntreprise()+" :");
            out.println(e.getIdEntreprise());
            out.println(e.getNom());
            out.println(e.getDescriptif());
            out.println(e.getAdressePostale());
            out.println();
        }
        
        out.println("_________________________________________________\nAjout d'une entreprise : ");
        Entreprise ENSTA = new Entreprise();
        ENSTA.setAdressePostale("toto");
        ENSTA.setDescriptif("Ecole d'ingénieur meca/elect/info");
        ENSTA.setNom("ENSTA");
        ENSTA = entrepriseDAO.persist(ENSTA);
        entreprises = entrepriseDAO.findAll();
        
        for(Entreprise e : entreprises){
        	out.println("Obtention de l'entreprise n° "+e.getIdEntreprise()+" :");
            out.println(e.getIdEntreprise());
            out.println(e.getNom());
            out.println(e.getDescriptif());
            out.println(e.getAdressePostale());
            out.println();
        }
        
        ENSTA = entrepriseDAO.findById(ENSTA.getIdEntreprise());
        ENSTA.setAdressePostale("Brest");
        ENSTA = entrepriseDAO.update(ENSTA);
        entreprises = entrepriseDAO.findAll();
        
        out.println("_________________________________________________\nMise a jour de l'entreprise : ");
        for(Entreprise e : entreprises){
        	out.println("Obtention de l'entreprise n° "+e.getIdEntreprise()+" :");
            out.println(e.getIdEntreprise());
            out.println(e.getNom());
            out.println(e.getDescriptif());
            out.println(e.getAdressePostale());
            out.println();
        }
        
    	entrepriseDAO.remove(ENSTA);
    	entreprises = entrepriseDAO.findAll();
    	
    	out.println("_________________________________________________\nSuppression d'une entreprise : ");
    	for(Entreprise e : entreprises){
    	    out.println("Obtention de l'entreprise n° "+e.getIdEntreprise()+" :");
    	    out.println(e.getIdEntreprise());
    	    out.println(e.getNom());
    	    out.println(e.getDescriptif());
    	    out.println(e.getAdressePostale());
    	    out.println();
    	}
	
        //-------------------------  Test sur DAO Candidature -----------------------------------
    	out.println("Liste des Candidatures :");
        List<Candidature> candidatures = candidatureDAO.findAll();
        
        for(Candidature c : candidatures){
        	out.println("Obtention de la candidature n° "+c.getIdCandidature()+" :");
            out.println(c.getIdCandidature());
            out.println(c.getNom());
            out.println(c.getPrenom());
            out.println(c.getDateNaissance());
            out.println(c.getAdressePostale());
            out.println(c.getAdresseEmail());
            out.println(c.getCv());
            out.println(c.getDateDepot());
            out.println(c.getNiveauQualification());
            out.println(c.getSecteurActivites());
        }
        
        
        Candidature c1 = new Candidature();
        c1.setNom("Abou");
        c1.setPrenom("Bacar");
        
        NiveauQualification n = new NiveauQualification();
        n = niveauDAO.findById(2);
        c1.setNiveauQualification(n);
        n.addCandidature(c1);
        
        SecteurActivite secA = new SecteurActivite();
        secA = secteurDAO.findById(1);
        secA.getCandidatures().add(c1);
        
        c1 = candidatureDAO.persist(c1);   
        secA = secteurDAO.update(secA);
        n = niveauDAO.update(n);
        
        candidatureDAO.remove(c1);
        n.removeCandidature(c1);
        n = niveauDAO.update(n);
        
        
  }
  //-----------------------------------------------------------------------------
}
