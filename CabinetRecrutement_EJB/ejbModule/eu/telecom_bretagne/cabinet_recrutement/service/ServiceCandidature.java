package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.CandidatureDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.NiveauQualificationDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.SecteurActiviteDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification;
import eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi;
import eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite;


/**
 * Session Bean implementation class ServiceCandidature
 */
@Stateless
@LocalBean
public class ServiceCandidature implements IServiceCandidature {

     //-----------------------------------------------------------------------------
	  @EJB private CandidatureDAO         		candidatureDAO;
	  @EJB private NiveauQualificationDAO	  	niveauDAO;
	  @EJB private SecteurActiviteDAO 			secteurDAO;
	  
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
	
	public Candidature newCandidature(String nom, String prenom, Date date_naissance,String adresse_postale,String adresse_email,String cv,Integer niveauQualification, ArrayList<Integer> secteurActivite) {
		  
		//--[ Création de la candidature et remplissage ]--
			Candidature candidature = new Candidature();
	
			candidature.setNom(nom);
			candidature.setPrenom(prenom);
			candidature.setDateNaissance(date_naissance);
			candidature.setAdressePostale(adresse_postale);
			candidature.setAdresseEmail(adresse_email);
			candidature.setCv(cv);
			Date date = new Date();
			candidature.setDateDepot(date);
			
		// --[ Traitement du Niveau de Qualification ]--
			NiveauQualification n;
			n = niveauDAO.findById(niveauQualification);
			candidature.setNiveauQualification(n);
			n.addCandidature(candidature);

		//-- Persistance temporaire de la candidature --
			//candidature = candidatureDAO.persist(candidature);

		//--[ Traitement du Niveau de Qualification ]--
			SecteurActivite s;
			Set<SecteurActivite> set = new HashSet<SecteurActivite>();
			
			//-- On recupère chaque secteur d'activité et on ajoute la candidature dedans puis on ajoute le secteur à la candidature
				for(int j=0;j<secteurActivite.size();j++){
					s = secteurDAO.findById(secteurActivite.get(j));
					s.getCandidatures().add(candidature);
	    			set.add(s);
				}
				candidature.setSecteurActivites(set);

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
