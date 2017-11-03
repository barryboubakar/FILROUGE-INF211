package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.Remote;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi;

@Remote
public interface IServiceCandidature {
	
	  public Candidature getCandidature(Integer id);
	
	  public List<Candidature> listeDesCandidatures();
	
	  public List<Candidature> listeDesCandidaturesPourUneOffre(OffreEmploi offre);
	  
	  public Candidature newCandidature(Candidature candidature);
	  
	  public Candidature updateCandidature(Candidature candidature);
	  
	  public void removeCandidature(Candidature candidature);	  
	  
}
