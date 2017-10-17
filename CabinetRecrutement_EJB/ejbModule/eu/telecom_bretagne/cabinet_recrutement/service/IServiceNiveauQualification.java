package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.Remote;
import javax.persistence.Query;

import eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification;

@Remote
public interface IServiceNiveauQualification {

	
	  public NiveauQualification findById(Integer id);
	  
	  //----------------------------------------------------------------------------
	  public List<NiveauQualification> findAll();
	  
	  public NiveauQualification persist(NiveauQualification niveau);
	  
	  public NiveauQualification update(NiveauQualification niveau);
	    
}
