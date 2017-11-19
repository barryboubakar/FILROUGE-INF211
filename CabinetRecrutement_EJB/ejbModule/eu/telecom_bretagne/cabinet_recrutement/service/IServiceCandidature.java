package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.Remote;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise;
import eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi;

/**
 * Interface du service gérant les candidatures
 * @author Yohann LE GALL & Aboubacar BARRY
 */
@Remote
public interface IServiceCandidature {
	
	  /**
	   * getCandidature permet de recupérer l'objet {@link Candidature} ayant pour id celui passé en paramètre
	   * @param id 
	   * 			celui de la candidature souhaitée
	   * @return {@link Candidature}
	   * 			la {@link Candidature} ayant l'id passé en paramètre
	   */
	  public Candidature getCandidature(Integer id);
	
	  /**
	   * listeDesCandidatures permet de recupérer la liste de toutes les {@link Candidature}
	   * @return List<Candidature>
	   */
	  public List<Candidature> listeDesCandidatures();
	  
	  /**
	   * newCandidature permet de créer une nouvelle {@link Candidature}
	   * @param nom
	   * 			nom de la personne
	   * @param prenom
	   * 			prenom de la personne
	   * @param date_naissance
	   * 			la date de naissance de la personne
	   * @param addresse_postale
	   * 			l'adresse postale de la personne
	   * @param addresse_email
	   * 			l'adresse email de la personne
	   * @param cv
	   * 			le cv de la personne
	   * @param niveauQualification
	   * 			l'id correspondant à un niveau de qualification existant dans la base de données
	   * @param secteursActivite
	   * 			la liste des id correspondant à des secteurs d'activités présent dans la base de données
	   * @return Candidature
	   * 			retourne l'objet candidature ajouté
	   */
	  public Candidature newCandidature(String nom, String prenom, Date date_naissance,String adresse_postale,String adresse_email,String cv,Integer niveauQualification,ArrayList<Integer> secteursActivite);
	  
	  /**
	   * updateCandidature permet de  mettre à jour une {@link Candidature} existante
	   * @param id
	   *			l'id de la candidature à mettre à jour
	   * @param nom
	   * 			nouveau nom de la personne
	   * @param prenom
	   * 			nouveau prenom de la personne
	   * @param date_naissance
	   * 			nouvelle date de naissance de la personne
	   * @param addresse_postale
	   * 			nouvelle adresse postale de la personne
	   * @param addresse_email
	   * 			nouvelle adresse email de la personne
	   * @param cv
	   * 			nouveau cv de la personne
	   * @param niveauQualification
	   * 			nouveau id correspondant à un niveau de qualification existant dans la base de données
	   * @param secteursActivite
	   * 			nouvelle liste des id correspondant à des secteurs d'activités présent dans la base de données
	   * @return <{@link Candidature}
	   * 			retourne l'objet candidature  modifié
	   */
	  public Candidature updateCandidature(int id,String nom, String prenom, Date date_naissance,String adresse_postale,String adresse_email,String cv,Integer idniveauQualification, ArrayList<Integer> secteursActivite);
	  
	  /**
	   * removeCandidature permet de supprimer une {@link Candidature}
	   * @param id
	   *			l'id de la {@link Candidature} à supprimer
	   */
	  public void removeCandidature(int idCandidature);

	  /**
	   * listeDesCandidaturesPourUneOffre permet de récupérer la liste des Candidatures matchant avec une {@link OffreEmploi}
	   * @param id
	   *			l'id de l'offre en question
	   *@return {@code List<Candidature>}
	   */
	  public List<Candidature> listeDesCandidaturesPourUneOffre(Integer idOffre);	  
	  
}
