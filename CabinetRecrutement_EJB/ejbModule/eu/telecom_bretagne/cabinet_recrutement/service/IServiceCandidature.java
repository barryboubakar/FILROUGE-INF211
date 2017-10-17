package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.Remote;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;

@Remote
public interface IServiceCandidature {

	
	  public Candidature findById(Integer id);
	
	  public List<Candidature> findAll();
	
	  public List<Candidature> findBySecteurActiviteAndNiveauQualification(int idSecteurActivite, int idNiveauQualification);
	  
	  public Candidature persist(Candidature candidature);
	  
	  public Candidature update(Candidature candidature);
	  
	  public void remove(Candidature candidature);	  
	  
}
