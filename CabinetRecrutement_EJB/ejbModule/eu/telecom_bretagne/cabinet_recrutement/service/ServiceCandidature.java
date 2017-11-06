package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.CandidatureDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.SecteurActiviteDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification;
import eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi;
import eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite;
import eu.telecom_bretagne.cabinet_recrutement.service.ServiceSecteurActivite;
import eu.telecom_bretagne.cabinet_recrutement.service.ServiceNiveauQualification;

/**
 * Session Bean implementation class ServiceCandidature
 */
@Stateless
@LocalBean
public class ServiceCandidature implements IServiceCandidature {

     //-----------------------------------------------------------------------------
	  @EJB private CandidatureDAO         candidatureDAO;
    /**
     * Default constructor. 
     */
    public ServiceCandidature() {
        // TODO Auto-generated constructor stub
    }
	@Override
	public Candidature getCandidature(Integer id) {
		
		return candidatureDAO.findById(id) ;
	}
	@Override
	public List<Candidature> listeDesCandidatures() {
		
		return  candidatureDAO.findAll();
	}
	@Override
	public List<Candidature> listeDesCandidaturesPourUneOffre(OffreEmploi offre) {
		
		List candidaturesRETURN = null;
		for(Candidature can : candidatureDAO.findAll()){
			//if(can);
		}
		
		return candidaturesRETURN;
	}
	
	public Candidature newCandidature(String nom, Date date_naissance,String adresse_postale,String adresse_email,String cv,int niveauQualification,int[] secteurActivite) {
		  
		  Candidature candidature = new Candidature();
	      
	      candidature.setNom(nom);
	      candidature.setDateNaissance(date_naissance);
	      candidature.setAdressePostale(adresse_postale);
	      candidature.setAdresseEmail(adresse_email);
	      candidature.setCv(cv);
	      
	      // Ajout dans niveau de qualification
	      NiveauQualification n;
	      ServiceNiveauQualification niveau = new ServiceNiveauQualification();
	      n = niveau.getNiveauQualification(niveauQualification);
	      candidature.setNiveauQualification(n);
	      n.addCandidature(candidature);
	
	      // Ajout dans secteur activite
	      SecteurActivite[] tabS = null;
	      SecteurActivite s;
	      ServiceSecteurActivite secteur = new ServiceSecteurActivite();
	      
	      for(int j=0;j<secteurActivite.length;j++){
	    	  tabS[j] = secteur.getSecteurActivite(secteurActivite[j]);
	    	  candidature.getSecteurActivites().add(tabS[j]);
	      }
	            
	      
	      for (int i=0;i<tabS.length;i++){
	    	  s = tabS[i];
		      s.getCandidatures().add(candidature);
	      }
	      
	      SecteurActiviteDAO secDAO = new SecteurActiviteDAO();
	      secDAO.update(tabS);
	      
	      return candidatureDAO.persist(candidature);
		
	}
	@Override
	public Candidature updateCandidature(Candidature candidature) {
		
		return candidatureDAO.update(candidature);
	}
	@Override
	public void removeCandidature(Candidature candidature) {
		candidatureDAO.remove(candidature);
		
	}
}
