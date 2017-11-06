package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.Date;
import java.util.List;

import javax.ejb.Remote;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi;

@Remote
public interface IServiceCandidature {
	
	  public Candidature getCandidature(Integer id);
	
	  public List<Candidature> listeDesCandidatures();
	
	  public List<Candidature> listeDesCandidaturesPourUneOffre(OffreEmploi offre);
	  
	  public Candidature newCandidature(String nom, Date date_naissance,String adresse_postale,String adresse_email,String cv,int niveauQualification,int[] SecteurActivite);
	  
	  public Candidature updateCandidature(Candidature candidature);
	  
	  public void removeCandidature(Candidature candidature);	  
	  
}
