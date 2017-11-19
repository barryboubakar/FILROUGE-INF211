package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Remote;
import javax.persistence.Query;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise;
import eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi;

/**
 * Interface du service gérant les offres d'emploi
 * @author Yohann LE GALL & Aboubacar BARRY
 */
@Remote
public interface IServiceOffreEmploi {

	  /**
	   * getOffreEmploi permet de récupérer l'{@link OffreEmploi} correspondant à l'id passé en paramètre
	   * @param id
	   * 			id de l'{@link OffreEmploi} souhaité
	   * @return {@link OffreEmploi}
	   */
	  public OffreEmploi getOffreEmploi(Integer id);

	  /**
	   * listeDesOffresPourUneEntreprise permet de récupérer la liste des {@link OffreEmploi} posté par une entreprise
	   * @param id
	   *			id de l'entreprise
	   *@return {@code List<OffreEmploi>}
	   *			la liste des offres d'emploi correspondante
	   */
	  public List<OffreEmploi> listeDesOffresPourUneEntreprise(int idEntreprise);

	  /**
	   * listeDesOffresPourUneCandidature permet de récupérer la liste des {@link OffreEmploi} matchant avec une candidature
	   * @param id
	   *			id de la {@link Candidature}
	   *@return {@code List<OffreEmploi>}
	   *			la liste des offres d'emploi correspondante
	   */
	  public List<OffreEmploi> listeDesOffresPourUneCandidature(int idCandidature);
	  
	  /**
	   * listeDesOffres permet de récupérer la liste de toutes les {@link OffreEmploi}
	   *@return {@code List<OffreEmploi>}
	   */
	  public List<OffreEmploi> listeDesOffres();
	  
	  /**
	   * newOffreEmploi permet de créer une nouvelle {@link OffreEmploi}
	   * @param titre
	   * 			titre de l'{@link OffreEmploi}
	   * @param descriptif_mission
	   * 			description de l'{@link OffreEmploi}
	   * @param profil_recherche
	   * 			une description du type de profil recherché
	   * @param niveauQualification
	   * 			l'id du {@link NiveauQualification} recherché
	   * @param secteursActivite
	   * 			la liste des id correspondant à des secteurs d'activités présent dans la base de données
	   * @param entreprise
	   * 			l'id de l'{@link Entreprise} postant l'{@link OffreEmploi}
	   * @return {@link OffreEmploi}
	   * 			retourne l'objet {@link OffreEmploi} ajouté
	   */
	  public OffreEmploi newOffreEmploi(String titre, String descriptif_mission, String profil_recherche, Integer niveauQualification, ArrayList<Integer> secteursActivite, Integer entreprise) ;
	  
	  /**
	   * updateOffreEmploi permet de modifier une {@link OffreEmploi}
	   * @param idOffre
	   * 			id de l'{@link OffreEmploi} à modifier
	   * @param titre
	   * 			nouveau titre de l'{@link OffreEmploi}
	   * @param descriptif_mission
	   * 			nouvelle description de l'{@link OffreEmploi}
	   * @param profil_recherche
	   * 			nouvelle une description du type de profil recherché
	   * @param niveauQualification
	   * 			nouveau id du {@link NiveauQualification} recherché
	   * @param secteursActivite
	   * 			nouvelle liste des id correspondant à des secteurs d'activités présent dans la base de données
	   * @return {@link OffreEmploi}
	   * 			retourne l'objet {@link OffreEmploi} modifié
	   */
	  public OffreEmploi updateOffreEmploi(Integer idOffre, String titre, String descriptif_mission, String profil_recherche, Integer niveauQualification, ArrayList<Integer> secteursActivite);
	 
	  /**
	   * removeOffreEmploi permet de supprimer une {@link OffreEmploi}
	   * @param idOffreEmploi
	   *			l'id de la {@link OffreEmploi} à supprimer
	   */
	  public void removeOffreEmploi(int idOffreEmploi);
}
