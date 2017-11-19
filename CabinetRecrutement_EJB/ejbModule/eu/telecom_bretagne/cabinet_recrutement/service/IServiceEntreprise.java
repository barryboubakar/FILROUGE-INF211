package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.Remote;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise;

/**
 * Interface du service gérant les entreprises.
 * @author Yohann LE GALL & Aboubacar BARRY
 */
@Remote
public interface IServiceEntreprise
{
  //-----------------------------------------------------------------------------
  /**
   * Obtention d'une {@link Entreprise}.
   * 
   * @param id 
   * 			id de l'entreprise à récupérer.
   * @return
   */
  public Entreprise getEntreprise(int id);
  
  /**
   * Obtention de la liste de toutes les entreprises.
   * 
   * @return la liste des entreprises dans une {@code List<Entreprise>}.
   */
  public List<Entreprise> listeDesEntreprises();
  
  /**
   * newEntreprise permet de créer une nouvelle {@link Entreprise}
   * @param nom
   * 			nom de l'entreprise
   * @param addresse_postale
   * 			l'adresse postale de l'entreprise
   * @param descriptif
   * 			description de l'entreprise
   * @return {@link Entreprise}
   * 			retourne l'objet {@link Entreprise} ajouté
   */
  public Entreprise newEntreprise(String nom,String adresse_postale,String descriptif);
  
  /**
   * updateEntreprise permet de mettre à jour une {@link Entreprise} existante
   * @param id
   * 			id de l'{@link Entreprise} à modifier
   * @param nom
   * 			nouveau nom de l'{@link Entreprise}
   * @param addresse_postale
   * 			nouvelle adresse postale de l'{@link Entreprise}
   * @param descriptif
   * 			nouvelle description de l'{@link Entreprise}
   * @return {@link Entreprise}
   * 			retourne l'objet {@link Entreprise} modifié
   */
  public Entreprise updateEntreprise(int idEntreprise, String nom,String adresse_postale,String descriptif);
  
  /**
   * removeEntreprise permet de supprimer une {@link Entreprise} existante
   * @param id
   * 			id de l'{@link Entreprise} à supprimer
   */
  public void removeEntreprise(int id);
  
  //-----------------------------------------------------------------------------
}
