package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.Remote;
import javax.persistence.Query;

import eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification;

@Remote
public interface IServiceNiveauQualification {

	
	  public NiveauQualification getNiveauQualification(Integer id);
	  
	  //----------------------------------------------------------------------------
	  public List<NiveauQualification> listeDesNiveauxQualifications();
	  
	  public NiveauQualification newNiveauQualification(NiveauQualification niveau);
	  
	  public NiveauQualification updateNiveauQualification(NiveauQualification niveau);
	    
}
