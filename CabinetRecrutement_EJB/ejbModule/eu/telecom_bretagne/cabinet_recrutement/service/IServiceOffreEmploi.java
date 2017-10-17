package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.Remote;
import javax.persistence.Query;

import eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi;

@Remote
public interface IServiceOffreEmploi {

	  public OffreEmploi findById(Integer id);

	  public List<OffreEmploi> findByEntreprise(int idEntreprise);

	  public List<OffreEmploi> findBySecteurActiviteAndNiveauQualification(int idSecteurActivite, int idNiveauQualification);
	  
	  public List<OffreEmploi> findAll();
	  
	  public OffreEmploi persist(OffreEmploi offreEmploi);
	  
	  public OffreEmploi update(OffreEmploi offreEmploi);
	  
	  public void remove(OffreEmploi offreEmploi);
}
