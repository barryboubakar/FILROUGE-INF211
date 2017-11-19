package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;
import javax.ejb.Remote;
import javax.persistence.Query;
import eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification;

/**
 * Interface du service gérant les niveaux de qualitifications
 * @author Yohann LE GALL & Aboubacar BARRY
 */
@Remote
public interface IServiceNiveauQualification {

	  /**
	   * getNiveauQualification permet de récupérer l'objet {@link NiveauQualification} correspondant à l'id
	   * @param id
	   * 			id du nieau de qualification souhaité
	   * @return {@link NiveauQualification}
	   * 			correspondant à l'id
	   */
	  public NiveauQualification getNiveauQualification(Integer id);
	  

	  /**
	   * listeDesNiveauxQualifications permet de récupérer la liste de tous les {@link NiveauQualification}
	   * @return {@code List<NiveauQualification>}
	   */
	  public List<NiveauQualification> listeDesNiveauxQualifications();
	  
	  
	  /**
	   * newNiveauQualification permet de créer un nouveau {@link NiveauQualification}
	   * @param intitule
	   * 				l'intitule du {@link NiveauQualification}
	   * @return {@link NiveauQualification}
	   * 				l'objet {@link NiveauQualification} créé
	   */
	  public NiveauQualification newNiveauQualification(String intitule);
	  
	  /**
	   * updateNiveauQualification permet de modifier un {@link NiveauQualification}
	   * @param id
	   * 				l'id du {@link NiveauQualification} à modifier
	   * @param intitule
	   * 				nouvel intitule du {@link NiveauQualification}
	   * @return {@link NiveauQualification}
	   * 				l'objet {@link NiveauQualification} modifié
	   */
	  public NiveauQualification updateNiveauQualification(int id, String intitule);
	    
}
