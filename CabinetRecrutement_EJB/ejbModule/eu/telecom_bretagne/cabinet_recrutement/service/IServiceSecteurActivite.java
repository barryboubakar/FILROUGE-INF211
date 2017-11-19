package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.Remote;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi;
import eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite;

/**
 * Interface du service gérant les secteurs d'activités
 * @author Yohann LE GALL & Aboubacar BARRY
 */
@Remote
public interface IServiceSecteurActivite {

	/**
	   * getSecteurActivite permet de récupérer le {@link SecteurActivite} correspondant à l'id passé en paramètre
	   * @param id
	   * 			id du {@link SecteurActivite} souhaité
	   * @return {@link SecteurActivite}
	   */
	public SecteurActivite getSecteurActivite(Integer id);

	/**
	  * listeDesSecteursActivite permet de récupérer la liste de tous les {@link SecteurActivite}
	  * @return {@code List<SecteurActivite>}
	  */
	public List<SecteurActivite> listeDesSecteursActivite();
	
	/**
	   * newSecteurActivite permet de créer un nouveau {@link SecteurActivite}
	   * @param intitule
	   * 				l'intitule du {@link SecteurActivite}
	   * @return {@link SecteurActivite}
	   * 				l'objet {@link SecteurActivite} créé
	   */
	public SecteurActivite newSecteurActivite(String intitule);
	
	/**
	   * updateSecteurActivite permet de modifier un {@link SecteurActivite}
	   * @param id
	   * 				l'id du {@link SecteurActivite} à modifier
	   * @param intitule
	   * 				nouvel intitule du {@link SecteurActivite}
	   * @return {@link SecteurActivite}
	   * 				l'objet {@link SecteurActivite} modifié
	   */
	public SecteurActivite updateSecteurActivite(int id, String intitule);
	  
}
