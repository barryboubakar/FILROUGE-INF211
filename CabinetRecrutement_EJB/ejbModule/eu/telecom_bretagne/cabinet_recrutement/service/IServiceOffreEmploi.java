package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Remote;
import javax.persistence.Query;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise;
import eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi;

@Remote
public interface IServiceOffreEmploi {

	  public OffreEmploi getOffreEmploi(Integer id);

	  public List<OffreEmploi> listeDesOffresPourUneEntreprise(int idEntreprise);

	  public List<OffreEmploi> listeDesOffresPourUneCandidature(int idCandidature);
	  
	  public List<OffreEmploi> listeDesOffres();
	  
	  public OffreEmploi newOffreEmploi(String titre, String descriptif_mission, String profil_recherche, Integer niveauQualification, ArrayList<Integer> secteurActivite, Entreprise e) ;
	  
	  public OffreEmploi updateOffreEmploi(OffreEmploi offreEmploi);
	  
	  public void removeOffreEmploi(OffreEmploi offreEmploi);
}
